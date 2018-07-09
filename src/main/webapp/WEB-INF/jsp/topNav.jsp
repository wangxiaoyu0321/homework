<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
  <head>     
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="顶端导航母版">
	<jsp:include page="FileList.jsp"/>
  	<style type="text/css">
  	/* 顶端导航栏样式 */
  	#nav>li>a {
  		text-align: center;
  	}
  	#nav>li {
  		width: 100px;
  	}
  	.navbar-brand {
		color: #FFFFFF;
	}
	#head{
		width: 120px;
		height:50px;
		border-left: solid 2px white;
		background-color: #62a8d1;
	}
  	</style>
  </head>
  <body>
    <div class="div-top" style="height: 50px;;">
	    <nav class="navbar" role="navigation">
			<div class="navbar-header" style="float: left;margin:0 auto;width: 10%;">					
				<ul>
					<li class="glyphicon glyphicon-leaf" style="color: #FFFFFF;font-size: 25px;line-height: 45px;float: left"></li>
					<li style="float: right;list-style-type: none;"><a class="navbar-brand" href="<%=basePath%>/user/workbench">管理控制台</a></li>
				</ul>								
			</div>
	 		<div style="float: left" id="navbar-right">
				<ul class="nav navbar-nav" id="nav" style="auto;">
					<li><a href="<%=basePath%>/user/index"><span>在线办公</span></a></li>
					<li><a href="<%=basePath%>/project/projectManagement"><span>项目管理</span></a></li>
					<li><a href="#"><span>日报管理</span></a></li>
					<li><a href="<%=basePath%>/system/SystemManagement"><span>系统管理</span></a></li>
					<li><a href="<%=basePath%>/data/developerMaintenance"><span>数据维护</span></a></li>
					<li><a href="<%=basePath%>/user/personal"><span>个人中心</span></a></li>				
				</ul>
				<div style="float:right;margin-right: 7%;" id="head">
					<img src="${username.image }" style="height: 40px;width: 40px;border-radius: 50%;text-align: center;line-height: 50px;margin-left: 5px;">
					<span style="font-size: 16px;color: #FFFFFF;text-align: center;line-height: 50px;margin-left: 5px;">${username.name }</span>
				</div>
			</div>
			


			
			<span style="position: absolute;right:80px;top:15px;;">
				<a href="${pageContext.request.contextPath}/user/outLogin" style="color: white;">退出</a>
			</span>
		</nav>
	</div>	
  </body>
</html>
