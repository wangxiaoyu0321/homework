<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
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
			<div style="height:auto;padding-bottom: 60px;">
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
							<td id="name">${user.name }</td>
							<td id="phone">${user.phone }</td>
							<td id="email">${user.email }</td>
							<td id="createtime">${user.createtime }</td>
							<td id="remark">${user.remark }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<!-- div3:分页插件 -->
			<div align="center">
				<div style="float: left;padding-top: 20px;" align="center">
					<p>共 ${pageUtil.totalRecord } 条数据，共 ${pageUtil.totalPage } 页,当前页：${pageUtil.currentPage }</p>
				</div>
				<div style="float: right">
					<ul class="pagination">
						<li><a href="#" onclick="return first()">首页</a></li>
						<!-- 上一页（当前页>1时，显示上一页 -->
						<c:if test="${pageUtil.currentPage>1 }">						
							<li><a href="#" onclick="return previousPage()">上一页</a></li>
						</c:if>
						
						<c:choose>
							<c:when test="${pageUtil.totalPage<5 }">
								<c:set var="start" value="1" />
	       						<c:set var="end" value="${pageUtil.totalPage }" />
							</c:when>
						</c:choose>
						
						 <c:forEach begin="${start }" end="${end }" var="i">  
						   <c:choose>  
						      <c:when test="${i eq pageUtil.currentPage }">  
						       <li><a href="#">${i }</a></li>  
						      </c:when>  
						      <c:otherwise>  
						        <a href="${pb.url }&pc=${i}" class="aBtn">${i }</a>  
						      </c:otherwise>  
						   </c:choose>               
						 </c:forEach>  
						 
<!-- 						<c:forEach items="i" var="i1"> -->
<!-- 							<li><a href="#">${i1 }</a></li> -->
<!-- 						</c:forEach> -->
<!-- 						<li><a href="#">i</a></li> -->
<!-- 						<li><a href="#">1</a></li> -->
<!-- 						<li><a href="#">2</a></li> -->
<!-- 						<li><a href="#">3</a></li> -->
<!-- 						<li><a href="#">4</a></li> -->
<!-- 						<li><a href="#">5</a></li> -->
						<!-- 当前页<总页数时，显示下一页 -->
						<c:if test="${pageUtil.currentPage<pageUtil.totalPage }">
							<li><a href="#" onclick="return nextPage()">下一页</a></li>
						</c:if>
						<li><a href="#" onclick="return last()">尾页</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript">
	//向后翻页
	function nextPage(){
		if(${pageUtil.currentPage+1} <= ${pageUtil.totalPage}){
		 $('#right').load('/blog/system/user?currentPage=${pageUtil.currentPage+1}');
		 } else {
		 	alert("已经是最后一页。");
		 }
	};
	//向前翻页
	function previousPage(){
		if(${pageUtil.currentPage-1}>=1){
			$('#right').load('/blog/system/user?currentPage=${pageUtil.currentPage-1}');
		} else {
			alert("已经是第一页");
		}
	};
	//首页
	function first(){
		$('#right').load('/blog/system/user?currentPage=1');
	};
	//尾页
	function last(){
		$('#right').load('/blog/system/user?currentPage=${pageUtil.totalPage}');
	};

</script>
</html>