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
<meta http-equiv="Description" content="项目管理导航栏">
<title>Insert title here</title>
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
	</style>
</head>

<body style="overflow: hidden">
	<div class="div-main" style="float:left;height: 100%;margin-top: 50px;overflow: hidden">
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
				<i class="glyphicon glyphicon-Cog"></i>
			</button>
		</div>
		<!-- 左侧导航栏 -->
		<div class="left-main left-full" id="left">	
			<li onmouseover="this.style.cursor='hand'" id="myProject"><a><span class="glyphicon glyphicon-star"></span><span class="sub-title">我的项目</span></a></li>	
		</div>
	</div>
</body>
</html>