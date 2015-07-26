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
	    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
	    
	    <script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	    
	    <!-- 编辑器配置文件 -->
		<script type="text/javascript" src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
		<!-- 编辑器源码文件 -->
		<script type="text/javascript" src="<c:url value='/ueditor/ueditor.all.min.js'/>"></script>

	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    <script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    <script type="text/javascript">
	    function checka(form) {
			var adminDesc = $.trim(form.adminDesc.value);
			if(adminDesc=='') {
	              alert("站长详情不能为空!");
	              form.adminDesc.focus();
	              return false;
	         }
			return true;
		}
		</script> 
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<article>
			<div class="container-fluid">
		      <div class="row">
		      <%@include file="../sidebar.jsp" %>
		      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		          <h1 class="page-header">更改站长信息</h1>
		          <div class="row placeholders">
		            <form action="<c:url value='/admin/updateAboutMe.htm'/>" method="post"  onsubmit="return checka(this)">
		            	<!-- 加载编辑器的容器 -->
						<script id="container" name="adminDesc" type="text/plain">
							${adminDesc}
						</script>
						<!-- 实例化编辑器 -->
						<script type="text/javascript">
						    var ue = UE.getEditor('container');
						</script>
						<br/>
						<input type="submit" name="submit" value="提交" class="btn btn-primary btn-lg btn-block">
					</form>
		          </div>
		        </div>
		      </div>
		    </div>
		</article>
	</body>
</html>