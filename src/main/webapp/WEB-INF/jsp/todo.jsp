<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   	<title>待办事项</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="待办事项>
	<!-- 引入公共jsp -->
	<%@include file="FileList.jsp"%>
	<!-- 引入顶端导航栏 -->
	<%@include file="topNav.jsp"%>	
	<!-- 引入左侧导航栏 -->
	<jsp:include page="LeftList.jsp"/>
<style type="text/css">
	h2{
		color: #00BFFF;
		text-align: left;
		margin-left: 20px;
	}
	#div-left {
		height: 100%;
		width: 12%;
		background-color: #E0EEEE;
	}
	#div-right {
		height: 100%;
		width: 88%;
		background-color: #fff;
	}
	#search{
		width: 180px;
		height: 30px;
		margin-left: 15px;
		margin-top: 20px;	
	}
	#span1{
		color: black;font-size: 15px;width: 20%;height: 31px;
	}
	#span2{
		color: black;font-size: 15px;margin-top: 8px;height: 19px;text-align: center;
		margin-right: 100px;
		height: auto;
	}
	a{
		height: 35px;
		width: 209px;
		text-align: center;
		line-height: 35px;
	}
	li{
		height: 35px;
		width: 209px;
		color:#E0EEEE;
	}
	li:HOVER {
		height: 35px;
		width: 209px;
		background-color: 	#B0C4DE;
		color:	#B0C4DE;
	}
</style>
</head>
  <script type="text/javascript">
	  var urlstr = location.href; 
	  console.log(urlstr); 
	  //alert((urlstr + '/').indexOf($(this).attr('href')));
	  var urlstatus=false;
	  $("#left li").each(function () {
	    if ((urlstr).indexOf($(this).attr('href')) > -1 && $(this).attr('href')!='') {
	      $(this).addClass('cur'); 
	      urlstatus = true;
	    } else {
	      $(this).removeClass('cur');
	    }
	  });
	  if (!urlstatus) {$("#left li").eq(1).addClass('cur');}
</script>  

<body>
	<div class="right-main" style="float:left;margin-left:0px;margin-top:50px;">
		<div style="float:left;" id="div-left">
			<div><input id="search" type="text" class="form-control"placeholder="搜索"/></div>
			<div>				
				<li style="margin-top: 10px;" id="li-todo"><a id="a1"><span id="span1" class="glyphicon glyphicon-star"></span><span id="span2">待办项</span></a></li>	
				<li id="li-plan"><a id="a1"><span id="span1" class="glyphicon glyphicon-time"></span><span id="span2">已计划</span></a></li>			
			</div>
		</div>
		<div style="float:left;" id="div-right">
			<h2 id="test">待办事项 <button type="button" class="btn btn-success" style="position:absolute;right: 20px;">新增</button></h2>
			<hr>		
			<table class="table table-striped" align="center" style="margin-top: 50px;">
				<tbody>
				<c:forEach items="${tolist }" var="td">				
					<tr>
						<td class="selectColumn"><input type="radio" id="userSelect" name="userSelect" value="${td.id}"/></td>
						<td align="center">${td.content }</td>
						<td align="center">${td.creatime }</td>				
					</tr>
				</c:forEach>						
				</tbody>
			</table>			
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
  $("#li-todo").click(function(){
    $('#div-right').load('plan.jsp');
  })
});
</script>
</html>
