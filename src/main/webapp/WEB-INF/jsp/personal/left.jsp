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
		.blur {
			filter: blur(10px);
			border: px solid #808080;
		}
		.sidebar-fold {
			margin-top: 110%;
		}
		.circle2 {
			border: 2px solid #DCDCDC;
			border-radius:50%;
			width: 120px;
			height: 120px;
			z-index:3;
			top:3%;
			position:absolute;
			left: 18%;
		}
		.name {
			color: #FFFFF;
			z-index: 4;
			font-size: 18px;
			position: absolute;
			top: 17%;
			font-weight: bold;
			left:26%;
		}
   	</style>
</head>
<body>
	<div class="div-main" style="float:left;height: 100%;margin-top: 50px;">
		<div>
			<div style="text-align: center;border-bottom: 2px solid #DCDCDC;">
				<img src="${image }" style="width: 100%;height:192px;position:absolute;top:0;left:0; z-index:1;" class="blur">
				<img src="${image }" style="width:35%;border-radius: 50%;position:absolute;top:6%;left:32%; z-index:2">
				<img src="../image/nv.jpg" style="width:10%;position:absolute;top:17.2%;left:80%; z-index:2">
				<div class="name">
					<p style="color: #F5F5F5;">Hello,${username.name}!</p>
				</div>
				<div class="circle2"></div>
			</div>
		</div>
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
			<li><a href="<%=basePath%>user/personal"><span class="glyphicon glyphicon-star"></span><span class="sub-title">个人信息</span></a></li>
		</div>
	</div>
</body>
</html>