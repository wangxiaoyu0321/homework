<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入CSS -->  
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 
	<!-- 引入bootstrap -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript" language="javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/bootstrap-3.3.7/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/common/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript" language="javascript"></script>
	<style type="text/css">
		.navbar-brand {
			color: #FFFFFF;
		}
		.btn-index {
			height: 80%;
			line-height: 80%;
			margin-top: 4px;
			width: 20%;
			border-radius:0px;
		}
		.btn>span {
			line-height: 40px;
		}
		#left>li{
			list-style-type: none;
			padding-left: 20px;
		}
		.cur {
			background-color: #2b7dbc;
		}
		.cur2 {
			color: #FFFFFF !important;
		}
	</style>
</head>
<body>
	<div class="div-main" style="float:left;height: 100%;margin-top: 50px;">
		<!-- 顶部按钮区 -->
		<div class="sidebar-fold">
			<button class="btn-index btn-success">
				<i class="glyphicon glyphicon-signal" style="list-sytle:none;"></i>
			</button>
			<button class="btn-index btn-info">
				<i class="glyphicon glyphicon-pencil"></i>
			</button>
			<button class="btn-index btn-warning">
				<i class="glyphicon glyphicon-star"></i>
			</button>
			<button class="btn-index btn-danger">
				<i class="glyphicon glyphicon-glass"></i>
			</button>
		</div>
		<!-- 左侧导航栏 -->
		<div class="left-main left-full" id="left">	
			<li id="user" class="li"><a><span class="glyphicon glyphicon-user"></span><span class="sub-title">用户管理</span></a></li>
			<li id="role" class="li"><a><span class="glyphicon glyphicon-bookmark"></span><span class="sub-title">角色管理</span></a></li>
			<li id="organization" class="li"><a><span class="glyphicon glyphicon-th"></span><span class="sub-title">组织管理</span></a></li>
			<li id="permission" class="li"><a><span class="glyphicon glyphicon-bell"></span><span class="sub-title">权限管理</span></a></li>
		</div>
	</div>
</body>
<script>
$(function(){
	var cotrs =$(".li");
	var sp = $(".li").children().children();
	cotrs.click(function(){
		cotrs.removeClass("cur"); 
		sp.removeClass("cur2"); 
		$(this).addClass("cur");
		$(this).children().children().addClass("cur2");
           return false;
	});
});
</script>
</html>