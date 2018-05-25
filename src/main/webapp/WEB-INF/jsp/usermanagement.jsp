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
	.div2 {
		border:solid 1px;
		border-color:  #DCDCDC;
		float:left;
		height: 200px;
		width: 166px;
	}
	h3 {
		font-size: 17px;
	}
	.btn {
		
	}
	.s1 {
		background-color: red;
	}
</style>
</head>
<script type="text/javascript">
	//选中一行数据后变色
	$(function(){
		$("tbody tr").click(function(){
			$(this).addClass("s1").siblings().removeClass("s1");
			$(this).find(":radio").attr("checked",true);			
			var name = $(this).find("td")[0].innerHTML;
			console.log(name);			
		});
	});
</script>
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
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">分配角色</button>
				</div>
			</div>
			
			<!-- div2:表单 -->
			<div>
			<table align="center" style="width: 100%" class="table table-bordered" id="table1">
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
						<tr type="radio">
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
						<!-- 中间页 -->											
						<c:choose>
							<c:when test="${pageUtil.totalPage<5 }">
								<c:set var="start" value="1" />
	       						<c:set var="end" value="${pageUtil.totalPage }" />
							</c:when>
							<c:otherwise>
						        <c:set var="start" value="${pageUtil.currentPage-2 }"/> 
						        <c:set var="end" value="${pageUtil.currentPage+2 }"/>
						        <c:if test="${start<1 }">
						        	<c:set var="start" value="1"/>
						        	<c:set var="end" value="5"/>
						        </c:if>
						        <c:if test="${end > pageUtil.totalPage }">
						        	<c:set var="start" value="${pageUtil.totalPage-4 }"/>
						        	<c:set var="end" value="${pageUtil.totalPage }"/>
						        </c:if>
						    </c:otherwise>   
						</c:choose>						
						
						<c:forEach begin="${start }" end="${end }" var="i">
							<c:choose>  
								<c:when test="${i == pageUtil.currentPage}">  
									<li class="active"><a href="#">${i}</a></li>  
								</c:when>   
								<c:otherwise>  
									<li><a>${i}</a></li>  
								</c:otherwise> 
							</c:choose>  
						</c:forEach>
						
						 <c:forEach begin="${start }" end="${end }" var="i">  
						   <c:choose>  
						      <c:when test="${i eq pageUtil.currentPage }">  

						      </c:when>  
						      <c:otherwise>  

						      </c:otherwise>  
						   </c:choose>               
						 </c:forEach>  
			
						
						<!-- 当前页<总页数时，显示下一页 -->
						<c:if test="${pageUtil.currentPage<pageUtil.totalPage }">
							<li><a href="#" onclick="return nextPage()">下一页</a></li>
						</c:if>
						<li><a href="#" onclick="return last()">尾页</a></li>
					</ul>
				</div>
			</div>
			
			
			
			<!-- 分配角色模态框（Modal）--start -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- div1：标题 -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" 
									aria-hidden="true">×
							</button>
							<h4 class="modal-title" id="myModalLabel">
								分配角色
							</h4>
						</div>
						<!-- div2：分配角色内容 -->
						<div class="modal-body" style="height: 240px;">
							<div class="div2" style="margin-left: 40px;">
								<ul>
									<li>总经理</li>
								</ul>
							</div>
							<div class="div2" style="margin-left: 140px;">
								<ul>
									
								</ul>
							</div>
						</div>
						<!-- div3：底部按钮 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" 
									data-dismiss="modal">关闭
							</button>
							<button type="button" class="btn btn-primary">
								提交更改
							</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			<!-- 分配角色模态框（Modal）--end -->
			
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