<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>plan</title>
<style type="text/css">
	h2{
		color: red
	}
</style>
</head>
<body>
	<h2 id="test">已计划<button type="button" class="btn btn-success" style="position:absolute;right: 20px;">新增</button></h2>
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
</body>
</html>