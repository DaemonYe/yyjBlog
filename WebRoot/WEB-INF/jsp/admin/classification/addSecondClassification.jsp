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
		<script type="text/javascript">
		//初始化 
		$(document).ready(function() {  
			$.getJSON("<c:url value='/linkage.htm'/>?classificationId=", "", function(response){  
	            $.each(response,function(i){   
	                //将后台传回的信息打印到页面中  
	                $ ("#top-classification").append ("<option value="+response[i].id+">"+ response[i].val +"</option>");  
	            });  
	        });    
		 });
		function checka(form) {
			var flag = false;
			var cName = $.trim(form.classificationName.value);
			var cid = document.getElementById("top-classification").value;
			if(cName=='') {
	              alert("分类名称必填!");
	              form.classificationName.focus();
	              return false;
	         }
			$.ajaxSettings.async = false; 
			$.getJSON("<c:url value='/admin/validateClassificationName.htm'/>?classificationName="+cName, "", function(response){  
				if(response.result){//分类名不存在
					flag=true;
				};
		    }); 
			if(flag==false){
				alert("分类名存在");
				form.classificationName.focus();
				return false;
			} 
			if(cid==''||cid=='0'){
	        	 alert("一级分类必填!");
	        	 document.getElementById("top-classification").focus();
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
			<div class="container-fluid">
		      <div class="row">
		      <%@include file="../sidebar.jsp" %>
		      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		          <h1 class="page-header">新增二级分类</h1>
		          <div class="row placeholders">
		            <form action="<c:url value='/admin/addSecondClassification.htm'/>" method="post" onsubmit="return checka(this)">
		            	<span>二级分类名称：</span><input type="text" name="classificationName" class="form-control"/><br /><br />
		            	<span>所属分类：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		            	<select class="form-control" id="top-classification" name="parentId.classificationId"><option value="0">请选择</option></select><br /><br /> 
		            	<!-- <select class="form-control" id="top-classification" name="parentId"><option value="0">请选择</option></select><br /><br />-->
		            	<span class="classification-span">二级分类描述：</span><textarea class="form-control classification-textarea" name="classificationDesc"></textarea>
						<br /><br />
						<input type="submit" name="submit" value="提交" class="btn btn-primary" style="width: 39%;">
					</form>
		          </div>
		        </div>
		      </div>
		    </div>
		</article>
	</body>
</html>