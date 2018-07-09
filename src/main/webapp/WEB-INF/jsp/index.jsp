<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 	
  	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.6&key=95d5504ea55a29a2404e9336988cced8&plugin=AMap.DistrictSearch"></script>
  	<!-- 引入CSS -->  
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 
	<!-- 引入bootstrap -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript" language="javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/bootstrap-3.3.7/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/common/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript" language="javascript"></script>
<!--  	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<jsp:include page="topNav.jsp"/>
	<jsp:include page="LeftList.jsp"/>
    <title>管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<style type="text/css">		
		.btn>span {
			line-height: 40px;
		}
		#left>li{
			list-style-type: none;
			padding-left: 20px;
		}
	</style>
  </head>
  
  <body style="height: 100%;overflow: hidden">
	  <div>
	   	<!-- part1：引入顶端导航栏母版 -->
		
		<!-- part2：主体内容 -->
		<div class="div-content">
			<!-- part2.1：引入左侧列表母版 -->
	
			<!-- part2.2：右侧内容 -->
			<div class="right-main" style="float:right;margin-left:0px;background-color: #FFFFFF" id="right-main">
			
			</div>		
		</div>
	 </div>	
</body>
<script>
$(document).ready(function(){
	$("#createProject").click(function(){
		console.log("新建项目");
		$("#right-main").load('<%=basePath%>project/createProject');
	});
});

</script>
</html>