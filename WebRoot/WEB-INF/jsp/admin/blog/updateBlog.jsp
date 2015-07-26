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
	    
	    <!-- 编辑器配置文件 -->
		<script type="text/javascript" src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
		<!-- 编辑器源码文件 -->
		<script type="text/javascript" src="<c:url value='/ueditor/ueditor.all.min.js'/>"></script>
		
		<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
		<script type="text/javascript">
		//初始化 
		$(document).ready(function() {  
			$.getJSON("<c:url value='/linkage.htm'/>?classificationId=", "", function(response){  
	            $.each(response,function(i){   
	                if(response[i].id==${blog.classificationId.parentId.classificationId }){
	                	$ ("#top-classification").append ("<option value="+response[i].id+" selected>"+ response[i].val +"</option>");
	                	$ ("#second-classification").attr("disabled",false); 
	                	$ ("#second-classification").append ("<option value="+${blog.classificationId.classificationId }+" selected>"+ '${blog.classificationId.classificationName }' +"</option>");  
		            }else{
		              	//将后台传回的信息打印到页面中  
		                $ ("#top-classification").append ("<option value="+response[i].id+">"+ response[i].val +"</option>");  
		            }
	            });
	              
	        });    
		 });
		function getSecondClassification(){  
			var classificationId = document.getElementById('top-classification').value;  
			$.getJSON("<c:url value='/linkage.htm'/>?classificationId="+classificationId, "", function(response){  
		        $ ("#second-classification option").remove();//将select中的信息清空  
		        $ ("#second-classification").attr("disabled",false); 
		        $ ("#second-classification").append ("<option value=0>请选择</option>"); 
	            $.each(response,function(i){   
	                //将后台传回的信息打印到页面中
	            	 $ ("#second-classification").append ("<option value="+response[i].id+">"+ response[i].val +"</option>");  
	            });  
	        });   
	 	} 
		function checku(form) {
			var blogTitle = $.trim(form.blogTitle.value);
			var cid = form.cid.value;
			var blogContent = $.trim(form.blogContent.value);
			var tag= document.getElementsByName('tag');
	        var isSel=false;//判断是否有选中项，默认为无
			if(blogTitle=='') {
	              alert("博文名称必填!");
	              form.blogTitle.focus();
	              return false;
	         }
	         if(blogTitle.length < 3 || blogTitle.length > 255){
	        	 alert("博文名称长度必须在3 ~ 255之间！");
	             form.blogTitle.focus();
	             return false;
		     }
	         if(cid==''||cid=='0'){
	        	 alert("二级分类必填!");
	             form.cid.focus();
	             return false;
			 }
	         if(blogContent==''){
	        	 alert("博文内容必填!");
	             form.blogContent.focus();
	             return false;
			 }
	         for(var i=0;i<tag.length;i++){
	        	if(tag[i].checked==true){
	         		isSel=true;
	         		break;
	        	}
	         }
	         if(isSel==false){
	        	 alert("标签必填!");
	        	 tag[0].focus();
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
		          <h1 class="page-header">修改博文</h1>
		          <div class="row placeholders">
		            <form action="<c:url value='/admin/updateBlog.htm'/>" method="post" onsubmit="return checku(this)">
		            	<input type="hidden" name="blogId" value="${blog.blogId }">
		            	
		            	<span>博文名称：</span><input type="text" name="blogTitle" class="form-control" value="${blog.blogTitle } " size="100px"/><br /><br />
		            	<span>所属分类：</span>
		            	<select class="form-control" id="top-classification"  onChange="getSecondClassification();">
		            		<option value="0">请选择</option>
		            	</select>&nbsp;&nbsp;&nbsp;
		            	<select class="form-control" id="second-classification" disabled="disabled" name="cid">
		            		<option value="0">请选择</option>
		            	</select><br /><br />
						<!-- 加载编辑器的容器 -->
						<script id="container" name="blogContent" type="text/plain">${blog.blogContent }</script>
						<!-- 实例化编辑器 -->
						<script type="text/javascript">
						    var ue = UE.getEditor('container');
						</script>
						<br />
						<span>标签：</span><br>
						<div style="padding-left:40px;">
						<!-- 
							<c:forEach var="tag_b" items="${blog.tags}">
								<label class="tag"><input checked type="checkbox" name="tags" >${tag_b.tagName}</label>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach> -->
							<c:forEach var="tag" items="${tags}">
								<label class="tag"><input type="checkbox" value="${tag.tagId }" name="tag" >${tag.tagName}</label>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</div>
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