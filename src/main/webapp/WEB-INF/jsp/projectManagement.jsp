<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

   	<title>项目管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<!-- 引入公共jsp -->
	<%@include file="FileList.jsp"%>
	<!-- 引入顶端导航栏 -->
	<%@include file="topNav.jsp"%>	
	<!-- 引入左侧导航栏 -->
	<%@include file="LeftList.jsp"%>
	<style type="text/css">
		.btn-success{
			position: relative;
		margin-left: 92%;
		margin-top:15px;
		float: left;
		}
	</style>
</head> 

<body>
	<div class="right-main" style="float:left;margin-left:0px;margin-top:50px;">
		<button type="button" class="btn btn-success" onclick="show_modal();"><span class="glyphicon glyphicon-plus" style="margin-right: 4px;"></span><span>新建项目</span></button>
	</div>
</body>
</html>
