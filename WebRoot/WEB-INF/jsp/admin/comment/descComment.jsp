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
	    <meta name="description" content="Daemon个人网站--后台">
	    <meta name="author" content="DaemonYe">
	    <link rel="icon" href="<c:url value='/img/icon.ico'/>">
		<title>Daemon个人网站--后台</title>
	
	    <!-- Bootstrap core CSS -->
	    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
	    
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
			<div class="container-fluid">
		      <div class="row">
		      	<%@include file="../sidebar.jsp" %>
		      	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		          <h1 class="page-header">评论详情</h1>
		          <div class="table-responsive">
		          	<table class="table table-striped">
	          			<tbody>
		          			<tr><td style="width: 100px;"><strong>评论ID:</strong></td><td>${comment.commentId }</td></tr>
		          			<tr><td><strong>所评博文名:</strong></td><td>${comment.blogId.blogTitle }</td></tr>
		          			<tr><td><strong>评论内容:</strong></td><td>${comment.commentContent }</td></tr>
		          			<tr><td><strong>评论时间:</strong></td><td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.commentTime}" /></td></tr>
		          			<tr><td><strong>评论者:</strong></td><td>${comment.commentAuthor }</td></tr>
		          			<tr><td><strong>评论者邮箱:</strong></td><td>${comment.commentEmail }</td></tr>
		          			<tr><td><strong>评论者网址:</strong></td><td>${comment.commentWebsite }</td></tr>
		          			<tr></tr>
	          			</tbody>
	          		</table>
	          			<c:if test="${comment.checkStatus eq '0'}">
	          				<a class="btn btn-success" href="<c:url value='/admin/checkComment.htm'/>?checked=yes&commentId=${comment.commentId }"  onclick="javascript:if(confirm('确定要此评论要通过审核吗？')){return true;}return false;">通过审核</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            		<a class="btn btn-danger" href="<c:url value='/admin/checkComment.htm'/>?checked=no&commentId=${comment.commentId }"  onclick="javascript:if(confirm('确定要此评论不能通过审核吗？')){return true;}return false;">不通过审核</a>
		          		</c:if>
		          </div>
		        </div>
		      </div>
		    </div>
		</article>
	</body>
</html>