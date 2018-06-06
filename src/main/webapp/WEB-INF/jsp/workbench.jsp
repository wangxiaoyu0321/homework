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
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript" language="javascript"></script>
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
		padding: 20px;
	}
	h3 {
		font-size: 14px;
	}
	.div_todo {
		width: 50%;
		background-color: white;
		height: 20%;
		padding: 1px 12px;
	}
	.div_td {
		background-color:#F5F5F5;
		height: 65%;
		width: 30%;
		margin-right: 18px;
		padding-top: 4%;
	}
	.div_tp {
		height: 27%;
		background-color:#F5F5F5;
		color: #A9A9A9;
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
			<div style="float:left;width: 60%">
			<h3>安全预警</h3>
				<div class="div_td" style="float:left;" align="center">
					<span style="color: #C6D0D4;font-size: 32px;">2</span><br>
					<span font-size: 12px;">紧急事件</span>
				</div>
				<div class="div_td" style="float:left" align="center">
					<span style="color: #C6D0D4;font-size: 32px;">2</span><br>
					<span>漏洞</span>
				</div>
				<div class="div_td" style="float:right" align="center">
					<span style="color: #C6D0D4;font-size: 32px;">2</span><br>
					<span>攻击</span>
				</div>
			</div>			
			<div style="float: right;width: 40%">
			<h3>安全防护</h3>
				<div class="div_tp" style="margin-bottom: 18px;">主机安全</div>
				<div class="div_tp">危险预警</div>
			</div>
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