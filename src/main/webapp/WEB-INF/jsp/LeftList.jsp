<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="在线办公-页面左侧导航栏">
	<!-- 引入CSS -->  
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 
   	<style type="text/css">
   		.btn-index {
			height: 80%;
			line-height: 80%;
			margin-top: 4px;
			width: 20%;
			border-radius:0px;
		}
		#left>li{
			list-style-type: none;
			padding-left: 20px;
		}
   	</style>
  </head>
<body>  
	<div class="div-main" style="float:left;height: 100%;margin-top: 50px;">
		<!-- 顶部按钮区 -->
		<div class="sidebar-fold">
			<button class="btn-index btn-success">
				<i class="li-p glyphicon glyphicon-signal" style="list-sytle:none;"></i>
			</button>
			<button class="btn-index btn-info">
				<i class="li-p glyphicon glyphicon-pencil"></i>
			</button>
			<button class="btn-index btn-warning">
				<i class="li-p glyphicon glyphicon-star"></i>
			</button>
			<button class="btn-index btn-danger">
				<i class="li-p glyphicon glyphicon-Cog"></i>
			</button>
		</div>
		<!-- 左侧导航栏 -->
		<div class="left-main left-full" id="left">	
			<li id="createProject"><a><span class="glyphicon glyphicon-user"></span><span class="sub-title">新建项目</span></a></li>					
			<li><a href="<%=basePath%>account/getAllAccount"><span class="glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a></li>
			<li><a href="<%=basePath%>todo/getAllBacklog"><span class="glyphicon glyphicon-star"></span><span class="sub-title">待办事项</span></a></li>
<!-- 			<li><a href="<%=basePath%>user/personal"><span class="glyphicon glyphicon-star"></span><span class="sub-title">个人中心</span></a></li> -->
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#createProject").click(function(){
		$("#right-main").load('<%=basePath%>project/createProject');
});
});
</script>
</html>