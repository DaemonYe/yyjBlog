<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function getClas(id){
	$.getJSON("<c:url value='/linkage.htm'/>?classificationId="+id, "", function(response){  
        $ ("#next"+id+" li").remove();//将li中的信息清空  
        $.each(response,function(i){   
        	 $ ("#next"+id).append ("<li><a href='/yyjBlog/blog/listBlogsByClassification-"+response[i].id+".htm'>"+ response[i].val +"</a></li>");  
        });  
    });   
} 
</script>     
<header>
	<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<c:url value='/index.htm'/>"><img src="<c:url value='/img/logo2.jpg'/>" alt="www.yeyangjie.cn"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<li class="dropdown" onClick="getClas(1);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">移动开发 <span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next1">
			  </ul>
			</li>
          	<li class="dropdown" onClick="getClas(2);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Web前端 <span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next2">
			  </ul>
			</li>
          	<li class="dropdown" onClick="getClas(3);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">架构设计 <span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next3">
			  </ul>
			</li>
          	<li class="dropdown" onClick="getClas(4);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">编程语言 <span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next4">
			  </ul>
			</li>
          	<li class="dropdown" onClick="getClas(5);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">系统运维 <span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next5">
			  </ul>
			</li>
			<!-- 
          	<li class="dropdown" onClick="getClas(6);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">互联网<span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next6">
			  </ul>
			</li> -->
          	<li class="dropdown" onClick="getClas(6);">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">数据库<span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu" id="next6">
			  </ul>
			</li>
            <li><a href="<c:url value='/listMessage.htm'/>">留言板</a></li>
            <li><a href="<c:url value='/growth.htm'/>">成长史</a></li>
            <li><a href="<c:url value='/aboutMe.htm'/>">关于我</a></li>
            <li><a href="#">随笔</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
</header>