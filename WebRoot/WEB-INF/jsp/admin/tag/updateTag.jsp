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
			var tagName = $.trim(form.tagName.value);
			if(tagName=='') {
	              alert("标签名称必填!");
	              form.tagName.focus();
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
		          <h1 class="page-header">更新标签</h1>
		          <div class="row placeholders">
		            <form action="<c:url value='/admin/updateTag.htm'/>" method="post" onsubmit="return checka(this)">
		            	<input type="hidden" name="tagId" value="${tag.tagId }">
		            	<input type="hidden" name="tagViews" value="${tag.tagViews }">
		            	<span>标签名称：</span><input type="text" name="tagName" class="form-control" value="${tag.tagName}"/><br /><br />
		            	<span class="classification-span">标签描述：</span><textarea class="form-control classification-textarea" name="tagDesc">${tag.tagDesc}</textarea>
						<br /><br />
						<input type="submit" name="submit" value="更新" class="btn btn-primary btn-lg btn-block">
					</form>
		          </div>
		        </div>
		      </div>
		    </div>
		</article>
	</body>
</html>