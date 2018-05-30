<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.div {
		padding:10px 30px;
	}
	.div1 {
		padding:10px 30px;
	}
	h3 {
		font-size: 17px;
	}
	.error {
		background: #f2dede;
	}
</style>
</head>
<body>
	<div class="div">
		<h3>角色管理</h3>
		<hr>
	<!-- div1：标题 -->
	<div style="height:auto;padding-bottom: 60px;">
		<div class="btn-group" data-toggle="buttons" style="float: right">
			<button class="btn btn-success" style="border-radius:0px">
				<span>新增</span>
			</button>
			<button class="btn btn-warning">
				<span> 编辑 </span>
			</button>
			<button class="btn btn-danger">
				<span>删除</span>
			</button>
			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" style="border-radius:0px">分配权限</button>
		</div>
	</div>
	<!-- div2：表单 -->
	<div>
		<table align="center" style="width: 100%" class="table table-bordered">
			<thead>
				<tr>
					<td>角色名称</td>
					<td>创建时间</td>
					<td>备注信息</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageUtil.list }" var="role" varStatus="status">
				
					<tr <c:if test="${status.count%2==0}"> class="warning" </c:if><c:if test="${status.count%2==1}"> class="error" </c:if>>
						<td>${role.roleName }</td>
						<td>${role.CreateTime }</td>
						<td>${role.remark }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- div3：分页 -->
	<div>
		<div style="float: left">
			<p>每页数量：
			<ul class="pagination" >
				<li class=><a href="#">10</a></li>
				<li class=><a href="#">20</a></li>
				<li><a href="#">50</a></li>
				<li><a href="#">100</a></li>
				<li><a href="#">All</a></li>
			</ul>
		</div>
		<div style="float: right">
			<ul class="pagination" >
				<li><a href="#">上一页</a></li>
				<li class="active"><a href="#">1</a></li>
				<li class="disabled"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">下一页</a></li>
			</ul>
			<p align="center">共 条记录，每页显示 条，共 页
			
		</div>
	</div>
	</div>
</body>
</html>