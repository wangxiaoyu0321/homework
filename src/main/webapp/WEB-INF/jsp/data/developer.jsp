<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<jsp:include page="../FileList.jsp"/>
<jsp:include page="../topNav.jsp"/>
<jsp:include page="left.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开发商维护</title>
   	<style type="text/css">
   		.btn-index {
			height: 80%;
			line-height: 80%;
			margin-top: 4px;
			width: 20%;
			border-radius:0px;
		}
		#left>li{
			list-style-type: none;
			padding-left: 20px;
		}
		.right-main {
			padding: 20px 30px;
		}
		.developer_part1>h4{
			text-align: left;
		}
		.developer_table>input {
			margin-bottom: 20px;
			float: left;
		}
   	</style>
</head>
<body>
	<div class="right-main">
	
		<!-- part1:Title -->
		<div class="developer_part1">
			<h4>开发商管理</h4>
		</div>
		<hr>
		
		<!-- part2:开发商列表 -->
		<div class="developer_table">
			<span style="float: left;text-align: center;line-height: 26px;">开发商搜索:</span><input>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>序号</th>
						<th>开发商名称</th>
						<th>创建时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${developers}" var="developer" varStatus="status">
						<tr <c:if test="${status.count%2==0 }"> class="success"</c:if>>
							<td>${status.index+1 }</td>
							<td>${developer.developername }</td>
							<td><fmt:formatDate value="${developer.createtime }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- part3:分页 -->
		<div>
			<div style="float: left;">
				<span>共${page.totalRecord }条记录，每页显示${page.pageSize }数据，共${page.totalPage }页</span>
			</div>
			<div style="float: right;">
				<ul class="pagination">
					<c:if test="${page.currentPage>1 }">
						<li><a href="developerMaintenance?currentPage=${page.currentPage-1 }" onclick="return previousPage()">&laquo;</a></li>
					</c:if>
					 <c:forEach begin="${page.start }" end ="${page.end }" var = "i">
					 	<c:choose>
                           <c:when test="${i == page.currentPage}">
                              <li class='active'><a>${page.currentPage}</a></li>
                           </c:when>
                           <c:otherwise>
                               <li><a>${i }</a></li>
                           </c:otherwise>
                        </c:choose>
					 </c:forEach>
					<c:if test="${page.currentPage<page.totalPage }">
						<li><a href="developerMaintenance?currentPage=${page.currentPage+1 }" onclick="return nextPage()">&raquo;</a></li>
					</c:if>				
				</ul>
			</div>
		</div>
	</div>
</body>
</html>