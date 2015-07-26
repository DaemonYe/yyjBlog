<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="yyjBlog" tagdir="/WEB-INF/tags" %>
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
	    <link href="<c:url value='/css/growth.css'/>" rel="stylesheet">
	    
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
		<article>
	    	<div class="container">
		      	<div class="row">
		      		<div class="row-header">
			   			<div class="title">
					        <span>成长史</span>
					    </div>
				        <div class="b-line"></div>
			      	</div>
	    			<div class="col-sm-9 blog-main">
	    				<div class="growth">
	    					<p>申请域名</p>
	    					<div class="dateview">2014-06-12</div>
	    				</div>
		                <div class="growth">
	    					<p>购买腾讯云空间，原因是物美价廉，而且速度也行</p>
	    					<div class="dateview">2014-06-14</div>
	    				</div>
		                <div class="growth">
	    					<p>域名备案申请成功</p>
	    					<div class="dateview">2014-08-15</div>
	    				</div>
	    				<div class="growth">
	    					<p>网站正式上线</p>
	    					<div class="dateview">2014-09-01</div>
	    				</div>
	    				<div class="growth">
	    					<p>网站完全改版</p>
	    					<div class="dateview">2014-07-14</div>
	    				</div>
	    			</div>
	    			<%@include file="sidebar.jsp" %>
	    		</div>
	    	</div>
	    </article>
	    <%@include file="footer.jsp" %>
	</body>
</html>