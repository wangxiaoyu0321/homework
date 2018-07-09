<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入公共jsp -->
	<%@include file="FileList.jsp"%>
	<!-- 引入顶端导航栏 -->
	<%@include file="topNav.jsp"%>	
	
	<jsp:include page="system/systemLeft.jsp"></jsp:include>
	<title>System Management</title>
	<style type="text/css">
		html{
			height: 100%;
		}
		body {
			background-color: #ffffff;
			height: 100%;
		}
		.left-main{
	/* 		background-color: #293038; */
			margin-bottom: 0px;
			bottom: 0px;
			top:0px;
			height: 100%;
		}
		.right {
			float: left;
			height: 100%;
			width: 1743px;
		}
/* 		li{ */
/* 			line-height:40px; */
/* 			text-align:left; */
/* 		} */
/* 		a { */
/* 			margin-left: -15px; */
/* 		} */
		span{
			height: 36px;
		}
		.li:HOVER {
			background-color: red;
		}
		#right {
			width: 90%;
			float: right;
		}
	</style>
</head>

<body>
	<div id="right">
	
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
  $("#user").click(function(){
    $('#right').load('/blog/system/user');
  })
});
$(document).ready(function(){
	$("#role").click(function(){
		$('#right').load('/blog/system/role');
	})
});
$(document).ready(function(){
	$("#organization").click(function(){
		$('#right').load('/blog/system/organization');
	})
});
$(document).ready(function(){
	$("#permission").click(function(){
		$('#right').load('/blog/system/permission');
	})
});
</script>
</html>