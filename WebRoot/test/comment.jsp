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
			$(function() {
				$("#form").submit(function() {
					var data=$("#form").serialize();
					alert(data);
					$.ajax({
						url:"<c:url value='/blog/commentBlog.htm'/>",//链接
						data:$("#form").serialize(),//给服务器的参数
						type:"POST",
						async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
						cache:false,
						success:function(result) {
							alert("&&&");
								return false;
						}
					});
					return false;//阻止表单默认提交
				});
			});
		</script>  	
				
		
	</head>
	<body>
		<article>
	    	<div class="container">
		      	<div class="row">
	    			<div class="col-sm-9 blog-main">
	    				<div class="blog-post">
						     	<div class="replybox-content">
							     	<form id="form" action="#" method="post" >
							     		<input type="hidden" name="blogId" value="">
									    <span>昵称</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentAuthor"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
							     		<span>邮箱</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentEmail" />&nbsp;&nbsp;&nbsp;&nbsp;<span>(必填)</span><br /><br />
							     		<span>网址</span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="commentWebsite" /><br /><br />
							     		<!-- 加载编辑器的容器 -->
										<script id="container" name="commentContent" type="text/plain">
											您的评论可以一针见血
										</script>
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
							     		<br><input type="submit" name="submit" value="发表评论" class="btn btn-primary btn-lg btn-block" id="mySubmit"/>
							     	</form>
							     </div>
						     </div>
				          </div><!-- /.blog-post -->
	    			</div>
	    		</div>
	    	</div>


	    </article>
	</body>
</html>