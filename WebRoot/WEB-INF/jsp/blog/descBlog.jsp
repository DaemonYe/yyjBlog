<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    <link href="<c:url value='/css/blog.css'/>" rel="stylesheet">
	    
	    <script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
	    
	    <!-- 编辑器配置文件 -->
		<script type="text/javascript" src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
		<!-- 编辑器源码文件 -->
		<script type="text/javascript" src="<c:url value='/ueditor/ueditor.all.min.js'/>"></script>
		
		<script type="text/javascript">
		/*
			$(function() {
				$("#replybox").submit(function() {
					$.ajax({
						url:"<c:url value='/blog/commentBlog.htm'/>",//链接
						data:$("#replybox").serialize(),//给服务器的参数
						type:"POST",
						async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
						cache:false,
						success:function(response) {
							alert(response);
							alert("发表成功");
							return false;
						}
					});
					return false;//阻止表单默认提交
				});
			});
			*/
			var id;
			function reply(i){
				$("#reply"+id).toggle();
	    		$("#reply"+i).toggle();
	    		id=i;
	    	}
			function check2(form) {
				var commentAuthor = $.trim(form.commentAuthor.value);
				var commentEmail = $.trim(form.commentEmail.value);
				var commentContent = $.trim(form.commentContent.value);
				if(commentAuthor=='') {
		              alert("昵称必填!");
		              form.commentAuthor.focus();
		              return false;
		         }
		         if(commentAuthor.length < 3 || commentAuthor.length > 20){
		        	 alert("用户名长度必须在3 ~ 20之间！");
		             form.commentAuthor.focus();
		             return false;
			     }
		         if(commentEmail==''){
		        	 alert("邮箱必填!");
		             form.commentEmail.focus();
		             return false;
				 }
		         if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(commentEmail)) {
		        	 alert("邮箱格式不正确!");
		             form.commentEmail.focus();
		             return false;
		         }
		         if(commentContent==''){
		        	 alert("评论内容必填!");
		             form.commentContent.focus();
		             return false;
				 }
				return true;
			}
			function check3(form) {
				var commentAuthor = $.trim(form.commentAuthor.value);
				var commentEmail = $.trim(form.commentEmail.value);
				var commentContent = $.trim(form.commentContent.value);
				if(commentAuthor=='') {
		              alert("昵称必填!");
		              form.commentAuthor.focus();
		              return false;
		         }
		         if(commentAuthor.length < 3 || commentAuthor.length > 20){
		        	 alert("用户名长度必须在3 ~ 20之间！");
		             form.commentAuthor.focus();
		             return false;
			     }
		         if(commentEmail==''){
		        	 alert("邮箱必填!");
		             form.commentEmail.focus();
		             return false;
				 }
		         if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(commentEmail)) {
		        	 alert("邮箱格式不正确!");
		             form.commentEmail.focus();
		             return false;
		         }
		         if(commentContent==''){
		        	 alert("评论内容必填!");
		             form.commentContent.focus();
		             return false;
				 }
				return true;
			}
		</script> 
	
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
	    			<div class="col-sm-9 blog-main">
	    				<div class="blog-post">
				            <h2 class="blog-post-title">${blog.blogTitle }</h2>
				            <div class="blog-manage">
				            	<span class="blog-post-left">分类：【<a href="<c:url value='/blog/listBlogsByClassification-${blog.classificationId.classificationId}.htm'/>">${blog.classificationId.classificationName }</a>】</span>
				            	<div class="blog-post-right">
				            		<span class="d_time">发布时间：
				            			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${blog.createTime }" />
									</span>&nbsp;
				            		<span>编辑：<a href="#">Daemon</a></span>&nbsp;
				            		<span>浏览（${blog.blogViews }）</span>&nbsp;
				            		<span>评论（${blog.blogReplies }）</span>&nbsp;
				            	</div>
				            </div>
				            <div class="a-line"></div>
				            <div class="blog-content">
					            ${blog.blogContent }
					         </div>
					         <div class="tags">
						        <p>
						        	<span>标签：
							    		<c:forEach var="tag" items="${blog.tags}"> 
							    		【<a href="<c:url value='/blog/listBlogsByTag-${tag.tagId}.htm'/>">${tag.tagName}</a>】
							    		</c:forEach>
							    	</span>
						        </p>
						     </div>
						     <!-- <div class="share"></div> -->
						     <div class="nextinfo">
						        <p class="nextinfo-left">
						        	<c:if test="${(!empty preBlog)&&preBlog.deleteStatus == '0'}">
						        		上一篇：<a href="<c:url value='/blog/descBlog-${preBlog.blogId}.htm'/>">${preBlog.blogTitle }</a>
						        	</c:if>
						        </p>
						        <p class="nextinfo-right">
						       		<c:if test="${(!empty nextBlog) && nextBlog.deleteStatus == '0'}">
						        		下一篇：<a href="<c:url value='/blog/descBlog-${nextBlog.blogId}.htm'/>">${nextBlog.blogTitle }</a>
						        	</c:if>
						        </p>
						     </div>
						     <div class="replybox">
						     	<div class="replybox-header">
							     	<h3>发表评论</h3>
							     	<p>邮箱地址不会公开</p>
						     	</div>
						     	<div class="a-line"></div>
						     	<div class="replybox-content">
							     	<form action="<c:url value='/blog/commentBlog.htm'/>" method="post" id="replybox"  onsubmit="return check2(this)">
							     		<input type="hidden" name="blogId.blogId" value="${blog.blogId }">
									    <span>昵称</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentAuthor"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
							     		<span>邮箱</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentEmail" />&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
							     		<span>网址</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentWebsite" /><br /><br />
							     		<!-- 加载编辑器的容器 -->
							     		<textarea name="commentContent" id="container">您的评论可以一针见血</textarea>  
										<!-- 实例化编辑器 -->
										<script type="text/javascript">
											var ue = UE.getEditor('container', {
												toolbars: [
															 [	'source' ,
																'justifyleft', 		//居左对齐
															 	'justifyright', 	//居右对齐
															  	'justifycenter', 	//居中对齐
															    'justifyjustify', 	//两端对齐
															    'fontfamily',
															    'insertcode',
															    'emotion'
													       	]
												       ],
												 initialFrameWidth:760,
												 initialFrameHeight:150,
												 elementPathEnabled:false,
												 wordCount:false
											});
										</script>
							     		<br><input type="submit" name="submit" value="发表评论" class="btn btn-primary btn-lg">
							     	</form>
							     </div>
						     </div>
						     <div class="commentlist">
								<div class="commentlist-header">
							     	<h3>评论列表</h3>
						     	</div>
						     	<div class="a-line"></div>
						     	<c:if test="${empty parentComments}">
						     		<div class="replybox-content">
						     			<p>暂无评价</p>
						     			<p>期待您的牛评</p>
						     		</div>
						     	</c:if>
						     	<c:if test="${!empty parentComments}">
						     		<c:forEach var="comment" items="${parentComments}">
										<div class="replybox-content">
											<div class="comment-author">
												<c:if test="${empty comment.commentWebsite}">
													<h4><a href="#">${comment.commentAuthor }</a></h4>
												</c:if>
												<c:if test="${!empty comment.commentWebsite}">
													<h4><a href='http://${comment.commentWebsite }'>${comment.commentAuthor }</a></h4>
												</c:if>
											</div>
											<div class="comment-content">${comment.commentContent }</div>
											<p class="autor"><span>时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.commentTime }" /></span><span><a href="javascript:reply(${comment.commentId });">回复</a></span></p>
											<div class="replybox-content" style="display: none;" id="reply${comment.commentId }">
										     	<form action="<c:url value='/blog/commentBlog.htm'/>" method="post" id="replybox"  onsubmit="return check3(this)">
										     		<input type="hidden" name="blogId.blogId" value="${blog.blogId }">
										     		<input type="hidden" name="parentId.commentId" value="${comment.commentId }">
												    <span>昵称</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentAuthor"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
										     		<span>邮箱</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentEmail" />&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
										     		<span>网址</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentWebsite" /><br /><br />
										     		<!-- 加载编辑器的容器 -->
													<script id="reply-${comment.commentId }" name="commentContent" type="text/plain">您的评论可以一针见血</script>
													<!-- 实例化编辑器 -->
													<script type="text/javascript">
														var ue = UE.getEditor('reply-'+${comment.commentId }, {
															toolbars: [
																		 [	'source' ,
																			'justifyleft', 		//居左对齐
																		 	'justifyright', 	//居右对齐
																		  	'justifycenter', 	//居中对齐
																		    'justifyjustify', 	//两端对齐
																		    'fontfamily',
																		    'insertcode',
																		    'emotion'
																       	]
															       ],
															 initialFrameWidth:700,
															 initialFrameHeight:150,
															 elementPathEnabled:false,
															 wordCount:false
														});
													</script>
										     		<br><input type="submit" name="submit" value="发表评论" class="btn btn-primary btn-lg">
										     	</form>
										     </div>
											<c:forEach var="childComment" items="${allComments}">
												<c:if test="${childComment.parentId.commentId eq comment.commentId}">
													<div class="replybox-content">
														<div class="comment-author">
															<c:if test="${empty childComment.commentWebsite}">
																<h4><a href="#">${childComment.commentAuthor }</a></h4>
															</c:if>
															<c:if test="${!empty childComment.commentWebsite}">
																<h4><a href='http://${childComment.commentWebsite }'>${childComment.commentAuthor }</a></h4>
															</c:if>
														</div>
														<div class="comment-content">${childComment.commentContent }</div>
														<p class="autor"><span>时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${childComment.commentTime }" /></span><span><a href="javascript:reply(${childComment.commentId });">回复</a></span></p>
														<div class="replybox-content" style="display: none;" id="reply${childComment.commentId }">
													     	<form action="<c:url value='/blog/commentBlog.htm'/>" method="post" id="replybox">
													     		<input type="hidden" name="blogId.blogId" value="${blog.blogId }">
													     		<input type="hidden" name="parentId.commentId" value="${comment.commentId }">
															    <span>昵称</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentAuthor"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
													     		<span>邮箱</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentEmail" />&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
													     		<span>网址</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentWebsite" /><br /><br />
													     		<!-- 加载编辑器的容器 -->
																<script id="reply-${childComment.commentId }" name="commentContent" type="text/plain">您的评论可以一针见血</script>
																<!-- 实例化编辑器 -->
																<script type="text/javascript">
																	var ue = UE.getEditor('reply-'+${childComment.commentId }, {
																		toolbars: [
																					 [	'source' ,
																						'justifyleft', 		//居左对齐
																					 	'justifyright', 	//居右对齐
																					  	'justifycenter', 	//居中对齐
																					    'justifyjustify', 	//两端对齐
																					    'fontfamily',
																					    'insertcode',
																					    'emotion'
																			       	]
																		       ],
																		 initialFrameWidth:700,
																		 initialFrameHeight:150,
																		 elementPathEnabled:false,
																		 wordCount:false
																	});
																</script>
													     		<br><input type="submit" name="submit" value="发表评论" class="btn btn-primary btn-lg">
													     	</form>
													     </div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</c:forEach>
						     	</c:if>
						     </div>
				          </div><!-- /.blog-post -->
	    			</div>
	    			<%@include file="../sidebar.jsp" %>
	    		</div>
	    	</div>
	    </article>
	    <%@include file="../footer.jsp" %>
	</body>
</html>