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
		li {
			width: 120px;
		}
	</style>
  </head>
  
  <body style="height: 100%;">
  <div>
  	<div class="div-top">
    <nav class="navbar" role="navigation">
		<div class="navbar-header" style="float: left">			
			<a class="navbar-brand" href="<%=basePath%>user/workbench">管理控制台</a>
		</div>
 		<div style="float: left">
			<ul class="nav navbar-nav" id="nav" style="width: 480px;">
				<li><a href="<%=basePath%>user/index"><span>在线办公</span></a></li>
				<li><a href="#"><span>需求管理</span></a></li>
				<li><a href="#"><span>项目管理</span></a></li>
				<li><a href="<%=basePath%>system/SystemManagement"><span>系统管理</span></a></li>				
			</ul>
		</div>
		<span style="position: absolute;right:80px;top:15px;;">
			<a href="${pageContext.request.contextPath}/user/outLogin" style="color: white;">退出</a>
		</span>
	</nav>
	</div>	
	<div class="div-content">
		<div class="div-main" style="float:left;height: 100%;">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="left-main left-full" id="left">	
				<li id="createProject"><a><span class="glyphicon glyphicon-user"></span><span class="sub-title">新建项目</span></a></li>					
				<li><a href="<%=basePath%>account/getAllAccount"><span class="glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a></li>
				<li><a href="<%=basePath%>todo/getAllBacklog"><span class="glyphicon glyphicon-star"></span><span class="sub-title">待办事项</span></a></li>
				<li><a href="<%=basePath%>user/personal"><span class="glyphicon glyphicon-star"></span><span class="sub-title">个人中心</span></a></li>
				<li><a href="<%=basePath%>user/authorization"><span class="glyphicon glyphicon-list"></span><span class="sub-title">权限管理</span></a></li>
				<li id="li-project"><a><span class="glyphicon glyphicon-book"></span><span class="sub-title">项目管理</span></a></li>
				<li id="li-project"><a href="<%=basePath%>system/SystemManagement"><span class="glyphicon glyphicon-book"></span><span class="sub-title">系统管理</span></a></li>
			</div>

		</div>
		<div class="right-main" style="float:left;margin-left:0px;background-color: #f5f5f5" id="right-main">
		</div>
		
	</div>
 </div>	
</body>
<script>
<%-- $(document).ready(function(){
  $("#li-project").click(function(){
    $("#content").load('<%=basePath%>WEB-INF/jsp/todo.jsp');
  });
}); --%>
$(document).ready(function(){
	$("#createProject").click(function(){
		console.log("新建项目");
		$("#right-main").load('<%=basePath%>project/createProject');
	});
});

</script>
</html>