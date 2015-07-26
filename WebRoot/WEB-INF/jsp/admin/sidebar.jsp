<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>    
<script type="text/javascript">
	var id;
	function reply(i){
		$("#sidebar"+id).toggle();
		$("#sidebar"+i).toggle();
		id=i;
	}
</script>    
<div class="col-sm-3 col-md-2 sidebar">
   	<ul class="nav nav-sidebar">
   		<li>
   			<a href="javascript:reply(1);">博文管理</a>
   			<div id="sidebar1" style="display: none;">
	   			<ul>
					<li><a href="<c:url value='/admin/addBlogPage.htm'/>">新增博文</a></li>
	       			<li><a href="<c:url value='/admin/listBlog.htm'/>">博文列表</a></li>
	       			<li><a href="<c:url value='/admin/listDeleteBlog.htm'/>">已删除博文列表</a></li>
	       			<li><a href="<c:url value='/admin/listRecommendBlog.htm'/>">推荐博文列表</a></li>
	   			</ul>
   			</div>
   		</li>
   		<li>
   			<a href="javascript:reply(2);">分类管理</a>
   			<div id="sidebar2" style="display: none;">
	   			<ul>
	   				<li><a href="<c:url value='/admin/addTopClassificationPage.htm'/>">新增一级分类</a></li>
	             	<li><a href="<c:url value='/admin/addSecondClassificationPage.htm'/>">新增二级分类</a></li>
	             	<li><a href="<c:url value='/admin/listTopClassification.htm'/>">分类列表</a></li>
	   			</ul>
   			</div>
   		</li>
   		<li>
   			<a href="javascript:reply(3);">标签管理</a>
   			<div id="sidebar3" style="display: none;">
	   			<ul>
	             	<li><a href="<c:url value='/admin/addTagPage.htm'/>">新增标签</a></li>
	             	<li><a href="<c:url value='/admin/listTag.htm'/>">标签列表</a></li>
	   			</ul>
   			</div>
   		</li>
   		<li>
   			<a href="javascript:reply(4);">评论管理</a>
   			<div id="sidebar4" style="display: none;">
	   			<ul>
	             	<li><a href="<c:url value='/admin/uncheckedCommentPage.htm'/>">未审核评论</a></li>
	             	<li><a href="<c:url value='/admin/checkedCommentPage.htm'/>">已通过审核评论</a></li>
	             	<li><a href="<c:url value='/admin/nocheckedCommentPage.htm'/>">未通过审核评论</a></li>
	             	<!-- <li><a href="<c:url value='/admin/listComment.htm'/>">评论列表</a></li> -->
	   			</ul>
   			</div>
   		</li>
   		<li>
   			<a href="javascript:reply(5);">留言管理</a>
   			<div id="sidebar5" style="display: none;">
	   			<ul>
	             	<li><a href="<c:url value='/admin/uncheckedMessagePage.htm'/>">未审核留言</a></li>
	             	<li><a href="<c:url value='/admin/checkedMessagePage.htm'/>">已通过审核留言</a></li>
	             	<li><a href="<c:url value='/admin/nocheckedMessagePage.htm'/>">未通过审核留言</a></li>
	             	<!-- <li><a href="<c:url value='/admin/listComment.htm'/>">评论列表</a></li> -->
	   			</ul>
	   		</div>
   		</li>
   		<li>
   			<a href="javascript:reply(6);">站长管理</a>
   			<div id="sidebar6" style="display: none;">
	   			<ul>
	             	<li><a href="<c:url value='/admin/updateAboutMePage.htm'/>">更新站长信息</a></li>
	   			</ul>
	   		</div>
   		</li>
   		
   	</ul>
</div>