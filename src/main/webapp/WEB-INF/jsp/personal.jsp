<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>个人中心</title>
	<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入公共jsp -->
	<%@include file="FileList.jsp"%>
	<!-- 引入顶端导航栏 -->
	<%@include file="topNav.jsp"%>	
	<!-- 引入左侧导航栏 -->
	<%@include file="LeftList.jsp"%>
</head>
<script type="text/javascript">
	//光标切换
	var urlstr = location.href; 
	console.log(urlstr); 
	//alert((urlstr + '/').indexOf($(this).attr('href')));
	var urlstatus=false;
	$("#left li").each(function () {
	  if ((urlstr).indexOf($(this).attr('href')) > -1 && $(this).attr('href')!='') {
	    $(this).addClass('cur'); 
	    urlstatus = true;
	  } else {
	    $(this).removeClass('cur');
	  }
	});
	if (!urlstatus) {$("#left li").eq(2).addClass('cur');};
	//上传头像
    function uploadImage() {
    	alert("1");
       var form = new FormData(document.getElementById("form")); 
       $.ajax({
       type: "POST",
       dataType: "json",
       contentType:false,
       processData:false,
       url: "<%=basePath%>user/upload",
       data: form,
       success: function (data) {
         console.log(data);
         if (data.operFlag == '1000') {
           alert("SUCCESS");
           window.location.href="<%=basePath%>user/personal";
         }else if(data.operFlag == '1001'){
         	alert(data.errorMessage);
         };
       },
       error : function(request) {
         alert("异常！");
       }
     });
   };
</script>
<body>
    <div class="right-main" style="float:left;margin-left:0px;margin-top:50px;">
		<h1>${name}的 个人中心</h1>
		<div style="text-align: left;margin-left: 20px;">
			<img src="${image }" style="height: 150px;width: 150px;border-radius: 50%">
		</div>
		<div style="text-align: left;margin-left: 20px;margin-top: 20px;">
			<form enctype="multipart/form-data" id="form" method="post">
				<label>上传头像：</label><input type="file" name="file"><br/>
				<button onclick="uploadImage()" type="submit">提交</button>  	
			</form>  		
		</div>
		<shiro:hasPermission name="add">add权限登录显示此内容</shiro:hasPermission>  
	    <shiro:hasRole name="admin">admin角色登录显示此内容</shiro:hasRole>  
	    <shiro:hasRole name="normal">normal角色登录显示此内容</shiro:hasRole>  
	</div>
</body>
</html>
