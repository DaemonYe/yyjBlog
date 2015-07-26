<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		          <h1 class="page-header">${parentClassification.classificationName }的子分类列表</h1>
		          <div class="table-responsive">
		            <table class="table table-striped">
		              <thead>
		                <tr>
		                  <th>ID</th>
		                  <th>分类名称</th>
		                  <th>分类描述</th>
		                  <th>操作</th>
		                </tr>
		              </thead>
		              <tbody>
		              	<c:forEach var="secondClassification" items="${secondClassification}">
			              	<tr>
			                  <td>${secondClassification.classificationId }</td>
			                  <td>${fn:substring(secondClassification.classificationName, 0, 10)}</td>
			                  <td>${fn:substring(secondClassification.classificationDesc, 0, 30)}</td>
			                  <td>
			                  	<a href="<c:url value='/admin/updateSecondClassificationPage.htm'/>?classificationId=${secondClassification.classificationId }">修改</a>
			                  	<!-- <a href="<c:url value='/admin/deleteSecondClassification.htm'/>?classificationId=${secondClassification.classificationId }">删除</a> -->
			                  </td>
			                </tr>
		                </c:forEach>
		              </tbody>
		            </table>
		          </div>
		        </div>
		      </div>
		    </div>
		</article>
	</body>
</html>