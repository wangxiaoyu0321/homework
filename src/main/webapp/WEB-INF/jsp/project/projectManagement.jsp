<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   	<title>项目管理</title>
	<!-- 引入公共jsp -->
	<jsp:include page="../FileList.jsp"/>
	<!-- 引入顶端导航栏 -->	
	<jsp:include page="../topNav.jsp"/>
	<!-- 引入左侧导航 -->
	<jsp:include page="projectLeftList.jsp"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
	<style type="text/css">		
		.project_card {
			height: 20%;
			width: 95%;	
			border: solid;
			border-top-width: 4px;
			border-bottom-width:0px;
			border-left-width:0px;
			border-right-width:0px;
			border-color: #DCDCDC;
			margin-bottom: 6px;
		}
		.card_top {
			height: 20%;
			border-bottom: 1px solid #DCDCDC;
			padding: 4px;
		}
		.card_bottom {
			height: 80%;
			padding: 10px 20px 15px;
		}
		.projectName {
			font-size: 18px;
			text-align: left;
			color: #428bca;
		}
		.card_bottom:HOVER {
			-webkit-box-shadow:0 0 10px #0CC;
			-moz-box-shadow:0 0 10px #0CC;
			box-shadow:0 0 10px #48D1CC;
   		}
   		.projectSearch {
   			text-align: left;
   			padding-right:30px;
   			height:50%;
   			color:	#A9A9A9;
   		}
   		.Search {
   			float:left;
   			width:30%;
   		}
   		.Search>select {
   			width: 180px;
   			height: 26px;
   			border-color: #DCDCDC;
   		}
   		.Search>select {
   			padding-left: 5px;
   		}
   		.Search>input {
   			width: 180px;
   		}
/*    		.paging { */
/*    			border: solid; */
/* 			border-top-width: 4px; */
/* 			border-color: #DCDCDC; */
/*    		} */
		.title {
			color: #A9A9A9;
			font-size: 15px;
			font-weight: normal;
		}
		dt>span {
			font-size: 15px;
		}
	</style>
</head> 

<body>
	<div class="right-main" style="overflow-y:scroll;" id="right-main">
		<div style="height: 100%;width: 100%;padding: 20px 30px;">
			<!-- part1:项目列表查询条件 -->
			<div style="height:80px;">
				<div class="projectSearch">
					<div class="Search">
						<span>创建时间区间:</span>
						<select>
							<option>1</option>
						</select>
					</div>
					<div class="Search">
						<span>开发商:</span>
						<select>
							<option>全部</option>
						</select>
					</div>
					<div class="Search">
						<span>产品类型:</span>
						<select></select>
					</div>			
				</div>
				<div class="projectSearch">
					<div class="Search">
						<span>项目所在地区:</span>
						<select></select>
					</div>
					<div class="Search">
						<span>创建人:</span>
						<input style="border: 1px solid #e4e4e4;height: 26px;">
					</div>
					<div class="Search">
						<span>流程节点:</span>
						<select></select>
					</div>												
				</div>
			</div>
			<!-- part2:项目列表 -->
			<c:forEach items="${projectList }" var="project" varStatus="status">
				<div class="project_card">
					<div class="card_top">
						<h5 class="projectName">${status.index+1}.${project.proname }</h5>
					</div>
					<div class="card_bottom" style="float: left;width: 40%;" onmouseover="this.style.cursor='hand'" id="card_bottom">
						<input type="hidden" value="${project.id}" name="id" class="id">
						<dl>
							<dt style="float: left;">
								<span class="title">发起时间：</span>
								<span><fmt:formatDate value="${project.createtime}" pattern="yyyy-MM-dd HH:mm:dd"/></span>
							</dt>
							<dt>
								<span class="title">项目城市：</span>
								<span>${project.province }</span>
							</dt>
						</dl>
					</div>
					<div class="card_bottom" style="float: right;width: 60%;" onmouseover="this.style.cursor='hand'">
					<input type="hidden" value="${project.id}" name="id" class="id">
						<dl>
							<dt>
								<span class="title">产品类型：</span>
								<span>
									<c:if test="${project.producttype=='1' }">
										美房圈
									</c:if>
									<c:if test="${project.producttype=='2' }">
										HVR
									</c:if>
									<c:if test="${project.producttype=='3' }">
										定制化
									</c:if>
									<c:if test="${project.producttype=='4' }">
										定制化HVR
									</c:if>
								</span>
							</dt>
						</dl>
					</div>
				</div>
			</c:forEach>  
			<!-- part3:分页 -->
			<div class="project_card">
				<div style="float: left;text-align: center;margin-top: 30px;">
					共 ${page.totalRecord } 条记录,每页显示 ${page.pageSize} 条数据,共 ${page.totalPage } 页
				</div>
				<div style="float: right;">
					<ul class="pagination">
						<li><a href="projectManagement?currentPage=${page.currentPage-1 }" onclick="return previousPage()">上一页</a></li>
						<li class="active"><a href="#">1</a></li>
						<li class="disabled"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="projectManagement?currentPage=${page.currentPage+1 }" onclick="return nextPage()">下一页</a></li>
					</ul>			
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function previousPage(){
		if(${page.currentPage==1 }){
			alert("已经加载到首页！");
			return false;
		}
	};	
	function nextPage(){
		if(${page.currentPage} == ${page.totalPage} ){
			alert("已经加载到尾页！");
			return false;
		}
	};
</script>
<script>
	$(document).ready(function(){
		$(".card_bottom").click(function(){
 			var id = $(this).children('input').val();
			console.log(id);
			$("#right-main").load('<%=basePath%>project/projectInfo?projectId='+id);
	});
	});
</script>
</html>
