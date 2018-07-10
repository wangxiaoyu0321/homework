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
   	<jsp:include page="topNav.jsp"/>
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 
	<!-- 引入bootstrap -->
 	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript" language="javascript"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>工作台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<style type="text/css">
		.div-content {
			background-color: #f5f5f6;
			padding: 20px;
			padding-top: 30px;
		}
		h3 {
			font-size: 14px;
		}
		.div_todo {
			width: 50%;
			background-color: white;
			height: 20%;
			padding: 1px 12px;
			float: left;
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
			height: 28%;
		}
		.div-content {
			padding:20px 30px;
		}
		.navbar-brand {
			color: #FFFFFF;
		}
		.div_td:HOVER {
			box-shadow:0 0 1px #00BFFF;
		}
		.div_tp:hover {
			box-shadow:0 0 1px #00BFFF;
		}
		.setting {
			width: 68px;
			background-color: white;
			float: right;
			height: 100%;
		}
	</style>
  </head>
  
  <body style="overflow: hidden;">
  	<!-- part1:顶端导航栏 -->
		
	<!-- part2：主题内容 -->
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
		<div class="setting">
			<div style="width: 68px;text-align: center">
				<img alt="" src="../image/setting.gif" style="width: 50px;">
				<span></span>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 10px;">
				<img alt="" src="../image/arrow.jpg" style="width: 16px;">
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/pensil.jpg" style="width: 38px;margin-bottom: 5px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/meeting.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/t.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/print.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/sun.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/star.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/todo.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/ball.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
			</div>
			<div style="width: 68px;text-align: center;margin-bottom: 20px;">
				<img alt="" src="../image/pink.jpg" style="width: 38px;">
				<div style="width: 68px;font-size: 12px;"><span style="text-align: center;">标题待定</span></div>
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