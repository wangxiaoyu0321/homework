<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<!-- 引入CSS -->  
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 
	<!-- 引入bootstrap -->
 	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
<style type="text/css">
	.div-content {
		background-color: #f5f5f6;
		padding: 20px 30px;
	}
	h3 {
		font-size: 15px;
	}
	.div_todo {
		width: 60%;
		background-color: white;
		height: 35%;
		padding: 1px 16px;
	}
	.div_td {
		background-color:#F5F5F5;
		height: 60%;
		width: 30%;
		margin-right: 20px;
	}
</style>
  </head>
  
  <body>
  <div>
  	<!-- div1:顶端导航栏 -->
  	<div class="div-top">
    <nav class="navbar" role="navigation">
		<div class="navbar-header">			
			<a class="navbar-brand" href="<%=basePath%>user/workbench">管理控制台</a>
		</div>
 		<div>
			<ul class="nav navbar-nav" id="nav">
				<li><a href="<%=basePath%>user/index">在线办公</a></li>
				<li><a href="#">需求管理</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						项目管理
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">前端</a></li>
						<li><a href="#">后端</a></li>
						<li><a href="#">SQL</a></li>
					</ul>
				</li>
				<li><a href="<%=basePath%>system/SystemManagement">系统管理</a></li>
			</ul>
		</div>
		<span style="position: absolute;right:80px;top:15px;;">
			<a href="${pageContext.request.contextPath}/user/outLogin" style="color: white;">退出</a>
		</span>
	</nav>
	</div>	
	<!-- div2：底部内容 -->
	<div class="div-content">
		<div class="div_todo">
			<h3>待办事项</h3>
			<div class="div_td" style="float:left">2</div>
			<div class="div_td" style="float:left">3</div>
			<div class="div_td" style="float:right">4</div>
		</div>
	</div>
 </div>	
</body>
<script>
$(document).ready(function(){
  $("#li-project").click(function(){
    $("#content").load('<%=basePath%>WEB-INF/jsp/todo.jsp');
  })
});
</script>
</html>