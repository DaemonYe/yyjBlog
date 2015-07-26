<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	    <link href="<c:url value='/css/index.css'/>" rel="stylesheet">
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
		<%@include file="header.jsp" %>
		
		<!-- Main jumbotron for a primary marketing message or call to action -->
	    <div class="jumbotron">
	      <div class="container">
	      	<div class="impression">
		      	<div class="left">
		      		<img src="<c:url value='/img/logo.jpg'/>" />
		      	</div>
		      	<div class="right">
		      		<h1>DaemonYe个人网站</h1>
		      		<h3>路漫漫其修远兮，吾将上下而求索</h3>
		      	</div>
		      </div>
	      </div>
	    </div>
		
		<article>
	    	<div class="container">
	    		<div class="container-header">
		   			<div class="title">
				        <span >推荐博文</span>
				    </div>
			        <div class="s-line"></div>
		      	</div>
		      	<div class="row">
	    			<div class="col-sm-9 blog-main">
	    				<c:forEach var="blog" items="${blogs}">
		    				<div class="blogs">
			    				<a class="blogs-link" href="<c:url value='/blog/descBlog-${blog.blogId}.htm'/>"></a>
			    				<div class="blogs-title">${fn:substring(blog.blogTitle, 0, 30)}</div>
						        <div class="blogs-detail">${fn:substring(blog.blogContent, 0, 100) }</div>
						        <a href="<c:url value='/blog/descBlog-${blog.blogId}.htm'/>" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
							    <p class="autor">
							    	<span>更新时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${blog.updateTime}" /></span>
							    	<span>标签：
							    		<c:forEach begin="0" end="3" var="tag" items="${blog.tags}"> 
							    			【<a href="<c:url value='/blog/listBlogsByTag-${tag.tagId}.htm'/>">${tag.tagName}</a>】
							    		</c:forEach>
							    	</span>
							    	<span>浏览（${blog.blogViews }）</span>
							    	<span>评论（${blog.blogReplies }）</span>
							    </p>
						    </div>
					    </c:forEach>
	    			</div>
	    			<%@include file="sidebar.jsp" %>
	    		</div>
	    	</div>
	    </article>
	    <%@include file="footer.jsp" %>
	</body>
</html>