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
  </head>
  
  <body>
  <div>
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
	<div class="div-content">
		<div class="div-main" style="float:left">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="left-main left-full" id="left">						
				<li><a href="<%=basePath%>account/getAllAccount"><span class="glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a></li>
				<li><a href="<%=basePath%>todo/getAllBacklog"><span class="glyphicon glyphicon-star"></span><span class="sub-title">待办事项</span></a></li>
				<li><a href="<%=basePath%>user/personal"><span class="glyphicon glyphicon-star"></span><span class="sub-title">个人中心</span></a></li>
				<li><a href="<%=basePath%>user/authorization"><span class="glyphicon glyphicon-list"></span><span class="sub-title">权限管理</span></a></li>
				<li id="li-project"><a><span class="glyphicon glyphicon-book"></span><span class="sub-title">项目管理</span></a></li>
				<li id="li-project"><a href="<%=basePath%>system/SystemManagement"><span class="glyphicon glyphicon-book"></span><span class="sub-title">系统管理</span></a></li>
			</div>

		</div>
		<div class="right-main" style="float:left;margin-left:0px;background-color: #f5f5f5" id="content">
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