<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    <link href="<c:url value='/css/login.css'/>" rel="stylesheet">
	
	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    <script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>
	    
	    <script type="text/javascript">
			function changeImg(){
				document.getElementById("myimg").src="<c:url value='/checkcode.htm'/>?"+new Date().getTime();
			}
		</script>
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	<body>
		<div class="container">
			<form class="form-signin" action="<c:url value='/doLogin.htm'/>" method="post">
				<c:if test="${!empty errorMsg}">
				  <div style="color:red">${errorMsg}</div>
				</c:if>
				<h2 class="form-signin-heading">Please sign in</h2>
				<label for="inputEmail" class="sr-only">Email address</label>
				<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus name="email">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password">
				<!-- <input type="text" id="inputPassword" class="form-control" name="checkcode"/><br/>
				
				<img src="<c:url value='/checkcode.htm'/>" style="cursor: pointer" id="myimg" onclick="changeImg();"/><br/><br/> -->
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			</form>
		</div>
		<!-- /container -->
	</body>
</html>