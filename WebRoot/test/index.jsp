<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
	function getCity1(){  
        var unitid = document.getElementById('addformunitid').value;  
		$.getJSON("test.htm?unitid="+unitid, "", function(response){  
			//$ ("#departmentid").show();//将隐藏的select显示出来  
	        $ ("#adddepartmentid option").remove();//将select中的信息清空  
	        $ ("#adddepartmentid").attr("disabled",false);  
	        //alert(response);  
            $.each(response,function(i){   
                //encodeURI(response[i]);  
                //encodeURI(fileName)  
                //将后台传回的信息打印到页面中  
                $ ("#adddepartmentid").append ("<option value="+response[i].id+">"+ response[i].val +"</option>");  
            });  
        });  
          
          
 } 
		</script> 
  </head>
  
  <body>
    <select name="eform.unitid"   id="addformunitid"  onChange="getCity1();">  
        <option value="0">请选择</option>  
        <option value="1">编程语言</option>  
    </select> 
    
    <select name="eform.departmentid" id="adddepartmentid" disabled="disabled">  
        <option value="0">请选择</option>  
    </select>
  </body>
</html>
