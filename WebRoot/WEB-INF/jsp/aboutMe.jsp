<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	    <link href="<c:url value='css/blog.css'/>" rel="stylesheet">
	    <link href="<c:url value='css/aboutme.css'/>" rel="stylesheet">
	    
	    <script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
	
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
		<%@include file="header.jsp" %>
		<article>
	    	<div class="container">
		      	<div class="row">
		      		<div class="row-header">
			   			<div class="title">
					        <span >关于我</span>
					    </div>
				        <div class="b-line"></div>
			      	</div>
	    			<div class="col-sm-9 blog-main">
	    				<div class="banner">
					    	<ul class="texts">
								<p><strong>定风波</strong></p>
						        <p><strong>莫听穿林打叶声，何妨吟啸且徐行。</strong></p>
								<p><strong>竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。</strong></p>
								<p><strong>料峭春风吹酒醒，微冷，山头斜照却相迎。</strong></p>
								<p><strong>回首向来萧瑟处，归去，也无风雨也无晴。</strong></p>
					      	</ul>
					    </div>
					    <div class="blog-post">
		    				<div>
		    				${adminDesc }
		    				<!-- 
		    					<p>Daemon，一个90后的大学生！10年入学后开始接触编程，至今已有四年。大一大二期间，掌握了c、c++、java、html、css等编程语言，同时对数据结构与算法以及面向对象的编程有深刻了解；大三开始参与实际项目，主要方向为JavaWeb，从企业开发的角度，全面理解了软件开发的生命周期与各种开发模式之间的不同；大四开始转向移动互联网开发（Android和html5），同时学习设计模式在软件开发中的作用。</p>
	        					<p>因为所学是机械+软件复合型专业，在大一大二的时候，想在嵌入式方向发展，把所学的两个专业很好地结合起来。然而，理想是丰满的，现实是骨感的。在经历了多次失败后，一次机缘巧合下，参加了华信杯比赛，结果获得一等奖。。。</p>
	        					<p>大三的时候，参与开发了第一个创业项目，每天背着电脑，抱着大头书，和小伙伴们一起讨论。。。那段时间，每天有些蓬头扣面的工作，开始相信那句话：每天叫醒我的不是闹钟而是梦想。但是我仍然很享受那些熬得只剩下黑眼圈的日子。。。最终在Java的路上越走越远，遇到了JavaWeb，SSH。。。现在遇到了移动互联网，爱上了Android+Html5。。。</p>
	        					<p>人生是一个长期而持续的累积故事，一次次的失败总会积累许许多多的经验。未来是未知的，过去是无法回去的，只有现在是我所能把握的。我希望自己能够抓住现在，能够在编程的路上越走越远！</p>
	        					<p>联系我：</p>
	        					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>QQ：303664355 </strong></p>
	        					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>邮箱：daemon@yeyangjie.cn</strong></p> -->
						    </div>
					    </div>
	    			</div>
	    			<%@include file="sidebar.jsp" %>
	    		</div>
	    	</div>
	    </article>
	    <%@include file="footer.jsp" %>
	</body>
</html>