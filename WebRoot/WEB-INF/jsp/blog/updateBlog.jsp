<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 配置文件 -->
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
</head>
<body>
<form action="updateBlog.htm" method="post">
	<input type="hidden" name="blogId" value="${blog.blogId }">
	<!-- 加载编辑器的容器 -->
	<script id="container" name="blogContent" type="text/plain">
		${blog.blogContent }
	</script>
	<input type="submit" name="submit" value="提交">
</form>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>

</body>
</html>