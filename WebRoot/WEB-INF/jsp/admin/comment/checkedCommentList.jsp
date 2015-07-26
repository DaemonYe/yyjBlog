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
	    
	    <style type="text/css">
	    	/**
			 * 页码
			 */
			.pagebar{
			  	margin: 30px 0 40px 0;
			  	padding-left: 10px;
			}
			.page{
				color: #999;
			  	font-weight: bolder;
			  	width: 36px;
			  	height: 40px;
			  	line-height: 40px;
			  	float: left;
			  	margin-left: 10px;
			  	background: #FFF;
			  	text-align: center;
			  	border: 1px solid #D9D9D9;
			}
			.now-page{
				color:#000;
			}	
			.page-other{
				width: 70px;
			}
				    	
	    </style>
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<article>
			<div class="container-fluid">
		      <div class="row">
		      	<%@include file="../sidebar.jsp" %>
		      	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		          <h1 class="page-header">待审核评论列表</h1>
		          <div class="table-responsive">
		            <table class="table table-striped">
		              <thead>
		                <tr>
		                  <th>ID</th>
		                  <th>所评博文名</th>
		                  <th>评论内容</th>
		                  <th>评论时间</th>
		                  <th>评论者</th>
		                  <th>评论者邮箱</th>
		                  <th>评论者网址</th>
		                  <th>操作</th>
		                </tr>
		              </thead>
		              <tbody>
		              	<c:forEach var="comment" items="${pagedComments.result}">
			              	<tr>
			                  <td>${comment.commentId }</td>
			                  <td>${fn:substring(comment.blogId.blogTitle, 0, 15)}</td>
			                  <td>${fn:substring(comment.commentContent, 0, 30)}</td>
			                  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.commentTime}" /></td>
			                  <td>${comment.commentAuthor}</td>
			                  <td>${comment.commentEmail}</td>
			                  <td>${comment.commentWebsite}</td>
			                  <td>
			                  	<a href="<c:url value='/admin/descComment.htm'/>?commentId=${comment.commentId }">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
			                  </td>
			                </tr>
		                </c:forEach>
		              </tbody>
		            </table>
		          </div>
		          <div class="pagebar">
		          	<!-- 分页显示导航栏 -->
		          	<yyjBlog:PageBar pageUrl="/admin/checkedCommentPage.htm" pageAttrKey="pagedComments"/>
		          </div>
		        </div>
		      </div>
		    </div>
		</article>
	</body>
</html>