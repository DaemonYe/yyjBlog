<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="yyjBlog" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    <meta name="keywords" content="个人博客，IT博客，html5，Daemon" />
	    <meta name="description" content="Daemon个人网站--IT技术博客">
	    <meta name="author" content="DaemonYe">
	    <link rel="icon" href="<c:url value='/img/icon.ico'/>">
		<title>Daemon个人网站--IT技术博客</title>
	
	    <!-- Bootstrap core CSS -->
	    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="<c:url value='/css/basic.css'/>" rel="stylesheet">
	    <link href="<c:url value='/css/bloglist.css'/>" rel="stylesheet">
	    
	    <script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
	
	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    <script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<article>
	    	<div class="container">
		      	<div class="row">
		      		<div class="row-header">
			   			<div class="title">
					        <span>${tag.tagName}</span>
					    </div>
				        <div class="b-line"></div>
			      	</div>
	    			<div class="col-sm-9 blog-main">
	    				<!-- 设置分页初始数据 -->
	    				<c:set var="listSize" value="${fn:length(pagedBlogs)}"/>						<!-- 总长度 -->
		 				<c:set var="pageSize" value="5"/>												<!-- 每页大小 -->
		 				<c:set var="pageBegin" value="${empty param.pageBegin?0:param.pageBegin}"/>		<!-- 每页开始 -->
		 				<c:set var="pageEnd" value="${pageBegin + pageSize - 1}"/>						<!-- 每页结束 -->
		 				<c:set var="pageLength" value="${listSize/pageSize}"/>						<!-- 总页数 -->
		 				<c:if test="${listSize eq (listSize-listSize%pageSize)}">
		 					<c:set var="pageLength" value="${listSize/pageSize-1}"/>					<!-- 总页数 -->
		 				</c:if>
		 				<!-- 迭代循环 -->
		                <c:forEach var="blog" items="${pagedBlogs}" begin="${pageBegin}" end="${pageEnd}">
		    				<div class="blogs">
			    				<a class="blogs-link" href="<c:url value='/blog/descBlog-${blog.blogId}.htm'/>"></a>
			    				<div class="blogs-title">${fn:substring(blog.blogTitle, 0, 30)}</div>
						        <div class="blogs-detail">${fn:substring(blog.blogContent, 0, 100) }</div>
						        <a href="<c:url value='/blog/descBlog-${blog.blogId}.htm'/>" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
							    <p class="autor">
							    	<span>更新时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${blog.updateTime}" /></span>
							    	<span>标签：
							    		<c:forEach begin="0" end="2" var="tag" items="${blog.tags}"> 
							    		【<a href="<c:url value='/blog/listBlogsByTag-${tag.tagId}.htm'/>">${tag.tagName}</a>】
							    		</c:forEach>
							    	</span>
							    	<span>浏览（${blog.blogViews }）</span>
							    	<span>评论（${blog.blogReplies }）</span>
							    </p>
						    </div>
					    </c:forEach>
					    <!-- 页码显示 -->
				    	<div class="pagebar">
				    		<!--首页 -->
				    		<c:if test="${pageBegin ne 0}">
								<a href='<c:url value="/blog/listBlogsByTag-${tag.tagId }.htm">
			            				 	<c:param name="pageBegin" value="0"/>
			          					 </c:url>'>
			    					<span class="page page-other">首页</span>
			  					</a>
		  					</c:if>
				    		<!--上一页 -->
				    		<c:if test="${pageBegin gt 0}">
								<a href='<c:url value="/blog/listBlogsByTag-${tag.tagId }.htm">
			            				 	<c:param name="pageBegin" value="${pageBegin-pageSize}"/>
			          					 </c:url>'>
			    					<span class="page page-other">&lt;上一页</span>
			  					</a>
			  				</c:if>
			  				<!-- 总页面数小于等于10 都显示 -->
			  				<c:if test="${pageLength le 10}">
								<c:forEach var="num" begin="0" end="${pageLength}" step="1">
									<!-- 当前页 -->
									<c:if test="${num*pageSize eq pageBegin }">
			 							<span class="page now-page">${num+1}</span>
				 					</c:if>
				 					<!-- 其余页 -->
				 					<c:if test="${num*pageSize ne pageBegin}">
				 						<a href='<c:url value="/blog/listBlogsByTag-${tag.tagId }.htm">
				            					 <c:param name="pageBegin" value="${num*pageSize}"/>
				           					</c:url>'>
				    						<span class="page">${num+1}</span>
				  						</a>
				 					</c:if>
								</c:forEach>
							</c:if>
							<!-- 总页面数大于10  -->
							<c:if test="${pageLength gt 10}">
								<c:set var="begin" value="${pageBegin/pageSize - 9}"/> 
		 						<c:set var="end" value="${pageBegin/pageSize + 10}"/>
		 						<c:if test="${begin lt 0}">
		 							<c:set var="begin" value="0"/> 
		 						</c:if>
		 						<c:if test="${end gt pageLength}">
		 							<c:set var="end" value="${pageLength}"/> 
		 						</c:if>
					
				      		  	<c:forEach var="num" begin="${begin}" end="${end}" step="1">
									<c:if test="${num*pageSize eq pageBegin}">
			 							<span class="page now-page">${num+1}</span>
			 						</c:if>
			 	
			 						<c:if test="${num*pageSize ne pageBegin}">
			 							<a href='<c:url value="/blog/listBlogsByTag-${tag.tagId }.htm">
			             							<c:param name="pageBegin" value="${num*pageSize}"/>
			          						 </c:url>'>
			    						<span class="page">${num+1}</span>
			  							</a>
			 						</c:if>
								</c:forEach>
							</c:if>
							<!--下一页 -->
							<c:if test="${pageEnd+1 < listSize}">
								<a href='<c:url value="/blog/listBlogsByTag-${tag.tagId }.htm">
						             		<c:param name="pageBegin" value="${pageBegin+pageSize}"/>
						          	 	</c:url>'>
						    		<span class="page page-other">下一页&gt;</span>
						  		</a>
						  	</c:if>
						  	<!-- 末页 -->
							<c:if test="${pageEnd+1 lt listSize}">
								<c:if test="${(listSize-listSize%pageSize) eq listSize}">
									<c:set var="pageBegin" value="${listSize-pageSize}"/>
								</c:if>
								<c:if test="${(listSize-listSize%pageSize) ne listSize}">
									<c:set var="pageBegin" value="${listSize-listSize%pageSize}"/>
								</c:if>
								<a href='<c:url value="/blog/listBlogsByTag-${tag.tagId }.htm">
						             		<c:param name="pageBegin" value="${pageBegin }"/>
						          	 	</c:url>'>
						    		<span class="page page-other">末页</span>
						  		</a>
						  	</c:if>
					    </div>
	    			</div>
	    			<%@include file="../sidebar.jsp" %>
	    		</div>
	    	</div>
	    </article>
	    <%@include file="../footer.jsp" %>
	</body>
</html>