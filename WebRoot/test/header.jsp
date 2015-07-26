<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
function getClas(id){
	alert("hello");
	$.getJSON("<c:url value='/linkage.htm'/>?classificationId="+id, "", function(response){  
        $ ("#next li").remove();//将select中的信息清空  
           $.each(response,function(i){   
               //将后台传回的信息打印到页面中<li><a href="#">Action</a></li>
           	 $ ("#next").append ("<li>"+ response[i].val +"</li>");  
           });  
       });   
	} 

</script> 
</head>
<body>
<select class="form-control" id="top-classification"  onChange="getSecondClassification();">
	<option value="0">请选择</option>
</select>
<select class="form-control" id="second-classification" disabled="disabled" name="cid">
	<option value="0">请选择</option>
</select>
<ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
	  <a href="javascript:getClas(1)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" >移动开发 <span class="caret"></span></a>
	  <ul class="dropdown-menu" role="menu" id="next">
	  </ul>
	</li>
</ul>	

</body>
</html>