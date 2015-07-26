<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	//初始化 
	$(document).ready(function() {  
		$.getJSON("<c:url value='/siderbar.htm'/>", "", function(response){  
            $.each(response,function(i){   
                //将后台传回的信息打印到页面中  
                $ ("#hottgs").append ("<a class='btn btn-sm btn-success hot-tag' href='/yyjBlog/blog/listBlogsByTag-"+response[i].id+".htm'>"+ response[i].name +"</a>");  
            });  
        });    
		$.getJSON("<c:url value='/siderbar2.htm'/>", "", function(response){  
            $.each(response,function(i){   
                //将后台传回的信息打印到页面中  
				//$ ("#recentComments").append ("<a href='/yyjBlog/blog/descBlog-"+response[i].blogId+".htm'><li>"+ response[i].commentAuthor+"</li><li>&nbsp;&nbsp;"+ response[i].commentContent+"</li></a>");  
                $ ("#recentComments").append ("<a href='/yyjBlog/blog/descBlog-"+response[i].blogId+".htm'><li>"+ response[i].commentAuthor+"</li></a>");  
            });  
        });    
	 });
	function check(form) {
		var content = $.trim(form.searchContent.value);
		if(content=='') {
              alert("请输入搜索关键字!");
              form.searchContent.focus();
              return false;
         }
		return true;
	}
</script>
<div class="col-sm-3 blog-sidebar">
	<div class="sidebar-module">
		<div class="about-me">
			<div class="avatar"><a href="<c:url value='/aboutMe.htm'/>"><span>关于我</span></a></div>
			<div class="topspaceinfo">
		      	<h1>少年游</h1>
		      	<h4>海阔凭鱼跃，天高任鸟飞!</h4>
		    </div>
		    <div class="about-c">
		      <p>网名：Daemon</p>
		      <p>学校：大连交通大学 </p>
		      <p>擅长：JAVA,Android</p>
		      <p>QQ ：303664355</p>
		      <p>邮箱：daemon@yeyangjie.cn</p>
		    </div>
		</div>
	</div>
	<div class="sidebar-module">
		<div class="sidebar-module-header">
			<h4>搜索</h4>
			<div class="s-line"></div>
		</div>
		<div class="sidebar-module-content">
			<form action="<c:url value='/blog/searchBlogs.htm'/>" method="post"  onsubmit="return check(this)">
				<input type="text" name="searchContent"/>
				<button type="submit" >Search</button>
			</form>
		</div>
		
	</div>
	<div class="sidebar-module">
		<div class="sidebar-module-header">
			<h4>热门标签</h4>
			<div class="s-line"></div>
		</div>
		<div class="sidebar-module-content" id="hottgs">
		</div>
	</div>
	<div class="sidebar-module">
		<div class="sidebar-module-header">
			<h4>最新评论</h4>
			<div class="s-line"></div>
		</div>
	  	<div class="sidebar-module-content">
	   		<ol class="list-unstyled"  id="recentComments">
	     		
	   		</ol>
		</div>
	</div>
</div>