<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Management</title>
<style type="text/css">
	.div1 {
		padding:10px 30px;
	}
	h3 {
		font-size: 17px;
	}
	.btn {
		
	}
	
</style>
</head>
<body>
	<div class="div1">
		<h3>用户管理</h3>
		<hr>
		<div>
			<!-- div1：搜索框和按钮 -->
			<div style="height:auto;padding-bottom: 50px;">
				<div class="input-group" style="float: left;width:200px;height: 34px;">
				    <input type="text" class="form-control input-lg" style="height: 34px;border-radius:0px;"><span class="input-group-addon btn btn-primary" style="height: 34px;">搜索</span>
				</div>
				<div class="btn-group" data-toggle="buttons" style="float: right">
					<label class="btn btn-success">
						<input type="checkbox"> 新增
					</label>
					<label class="btn btn-warning">
						<input type="checkbox"> 编辑
					</label>
					<label class="btn btn-danger">
						<input type="checkbox"> 删除
					</label>
					<button type="button" class="btn btn-info">分配角色</button>
				</div>
			</div>
			
			<!-- div2:表单 -->
			<div>
			<table align="center" style="width: 100%" class="table table-bordered">
				<thead>
					<tr>
						<td>用户名</td>
						<td>电话号</td>
						<td>email</td>
						<td>注册时间</td>
						<td width="20%">备注</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageUtil.list }" var="user">
						<tr>
							<td>${user.name }</td>
							<td>${user.phone }</td>
							<td>${user.email }</td>
							<td>${user.createtime }</td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<!-- div3:分页插件 -->
			<div align="center">
				<div style="float: left;padding-top: 20px;" align="center">
					<p>共 ${pageUtil.totalRecord } 条数据，每页 ${pageUtil.pageSize } 条，共 ${pageUtil.totalPage } 页</p>
				</div>
				<div style="float: right">
					<ul class="pagination">
						<li><a href="#">首页</a></li>
						<li><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
						<li><a href="#">尾页</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>