<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">  
	//显示联动菜单  
	//初始化  
    $.ajax({  
		url: "test2.htm",//调用方法  
        type: "GET",  
        data: {id:""},//参数  
        dataType: "json",//类型  

        $.each(response,function(i){   
            //encodeURI(response[i]);  
            //encodeURI(fileName)  
            //将后台传回的信息打印到页面中  
            $ ("#ddlCompany").append ("<option value="+response[i].id+">"+ response[i].val +"</option>");  
        });

        success: function(data) {  
          	var tbHtml = "";//定义HTML  
          	tbHtml += "<option></option>";  
          	$.each(data, function(key, value) {//循环  
              tbHtml+="<option value="+value.id+">"+value.name+"</option>"//显示查询出来的结果内容  
          	});  
          	$('#ddlCompany').html(tbHtml);//显示HTML  
      	}  
     });  
  
     $(document).ready(function() {  
		$('#ddlCompany').change(function() {//变更事件  
       		GetData();//获取第二个select数据  
      	});  
	 });  
  
   
  
     function GetData() {  
		var id = $('#ddlCompany').val();  
           $.ajax({  
            url: "test2.htm",  
            type: "GET",  
            data: {id : $("#ddlCompany").val()},  
            dataType: "json",  
            success: function(data) {  
            	$("#iid").empty();//清空  
              	$("#iid").show();//显示select  
                var secondHtml = "";  
                secondHtml += "<option></option>";  
              	$.each(data, function(key, value) {  
                  secondHtml+="<option value="+value.id+">"+value.name+"</option>"  
              	});  
              
             	$("#iid").html(secondHtml);  
           }  
         });  
	}  
</script> 
</head>
<body>
<div ID="ddlSummary">  
   <select id="ddlCompany">  

   </select>  
    <select id="iid" style="display:none">  

   </select>  
</div>  

</body>
</html>