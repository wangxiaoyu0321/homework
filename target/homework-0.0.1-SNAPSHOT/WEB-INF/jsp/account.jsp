<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">    
    <title>账号管理</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入公共jsp -->
	<%@include file="FileList.jsp"%>
	<!-- 引入顶端导航栏 -->
	<%@include file="topNav.jsp"%>	
	<!-- 引入左侧导航栏 -->
	<%@include file="LeftList.jsp"%>
	<style type="text/css">
	.table-striped>tr>td{
		font-size: 20px;
	}
	#btn-group {
		margin-bottom: 20px;
		position: relative;
		margin-left: 70.2%;
		float: left;
	}
	button {
		width: 70px;
		padding: 0px;
	}
	#search {
		height: 34px;
		width: 45px;
		border: 0px;
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
	  if (!urlstatus) {$("#left li").eq(0).addClass('cur');}
</script>
<body>
<div class="right-main" style="float:left;margin-left:0px;margin-top:50px;">	
<div class="div-3" style="margin: 25px 60px 60px;background-color: white">
	<h1 style="padding-top: 20px;">账号管理</h1>
	<hr style="border:2px solid #eee;">
	<div class="input-group" style="float: left">  
       <input id="searchByName" type="text" class="form-control"placeholder="搜索" style="width: 180px;margin-left: 20px;"/>
           <button class="btn-info" id="search" onclick="searchName();"><span class="glyphicon glyphicon-search"></span></button>
	</div>
	<div class="btn-group" id="btn-group">
	    <button type="button" class="btn btn-success" onclick="show_modal();"><span class="glyphicon glyphicon-plus" style="margin-right: 4px;"></span><span>新增</span></button>
	    <button type="button" class="btn btn-warning" onclick="update();"><span class="glyphicon glyphicon-pencil" style="margin-right: 4px;"></span><span>修改</span></button>
	    <button type="button" class="btn btn-danger" onclick="del();" ><span class="glyphicon glyphicon-minus" style="margin-right: 4px;"></span><span>删除</span></button>
	</div>
	<!-- account表单 -->		  
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table" align="center" >
				<thead>
					<tr>
					<th class="selectColumn">选择</th>
		   			<th>序号</th>
		   			<th>账号</th>
		   			<th>名字</th>
		   			<th>年龄</th>
		   			<th>性别</th>
		   			<th>创建时间</th>
		   			<th>创建日期</th>
		   			<th>创建人</th>
		   			<th>金额</th>
		   			<th>更新时间</th>
		   			<th>状态</th>
		   			</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list }" var="account">				
					<tr>
						<td class="selectColumn"><input type="radio" id="userSelect" name="userSelect" value="${account.id}" /></td>
						<td align="center">${account.id }</td>
						<td align="center">${account.account }</td>
						<td align="center">${account.name }</td>
						<td align="center">${account.age }</td>
						<td align="center">
							<c:if test="${account.sex == '1'}">男</c:if>
							<c:if test="${account.sex == '2' }">女</c:if>
						</td>						
						<td><fmt:formatDate value="${account.creatime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td align="center">${account.createdate }</td>
						<td align="center">${account.createuser }</td>
						<td align="center">${account.amount }</td>
						<td align="center">${account.updatetime }</td>
						<td align="center">${account.status }</td>						
					</tr>
				</c:forEach>						
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<div>
	
	<!-- 分页 -->
	<p style="position: absolute;left: 9%;">共${page.totalRecord }条数据/共${page.totalPage}页</p>		  
	<p style="position: absolute;right: 9%;">跳转到：<input style="width: 30px;" id="turnPage"> 页&nbsp
		  <button class="btn btn-primary btn-mini" type="button" onclick="return startTurn()">跳转</button>
	</p>
	<ul class="pagination">
	<li><a href="account/getAllAccount?page.currentPage=0">首页</a></li>
    <li><a href="account/getAllAccount?currentPage=${page.currentPage-1}" onclick="return previousPage()">上一页</a></li>
<!--     <li><a href="#">${page.start }</a></li> -->
    <li><a>${page.currentPage }</a></li>
<!--     <li><a href="#">${page.end }</a></li> -->
    <li><a href="account/getAllAccount?currentPage=${page.currentPage+1}" onclick="return nextPage()">下一页</a></li>
    <li><a href="account/getAllAccount?currentPage=${page.totalPage}">尾页</a></li>
	</ul>
	</div>
<!-- 编辑用户模态框（Modal） -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center;margin-left: 68px;">编辑用户</h4>
            </div>
            <div class="modal-body">
            <div>
            <form id="form-addAccount">
				<table class="table table-striped" contenteditable="true">
						<tr class="active">
							<td id="td-1">账	号</td>
							<td>
								<input placeholder="请输入用户的手机号..." style="width:350px;height: 40px;position: relative;font-size: 14px;" id="searchAccount1">
							</td>
						</tr>
						<tr class="success">
							<td>姓  名</td>
							<td><input id="name1"  style="width:350px;height: 40px;position: relative;font-size: 14px;" ></td>
						</tr>
						<tr class="warning">
							<td>年  龄</td>
							<td><input id="age1" style="width:350px;height: 40px;position: relative;font-size: 14px;"></td>
						</tr>
						<tr class="danger">
							<td>性  别</td>
							<td>
								<form id="sex-form1">
									<input name="sex1" type="radio" value="1" id="sex">男

									<input name="sex1" type="radio" value="2" id="sex" style="margin-left: 120px;">女
								</form>
							</td>
						</tr>
						<tr class="info">
							<td>金  额</td>
							<td><label><input id="amount1" style="width:350px;height: 40px;position: relative;font-size: 14px;"></label></td>
						</tr>

				</table>
				</form>
				</div>
				<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="alter" onclick="alter()">
                 	   提交
                </button>
            	</div>
                </div>

            </div>

        </div>
    </div> 
<!-- 添加用户模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center;margin-left: 68px;">新增用户</h4>
            </div>
            <div class="modal-body">
            <div>
            <form id="form-addAccount">
				<table class="table table-striped" contenteditable="true">
						<tr class="active">
							<td id="td-1">账	号</td>
							<td>
								<input placeholder="请输入用户的手机号..." style="width:350px;height: 40px;position: relative;font-size: 14px;" id="searchAccount">
							</td>
						</tr>
						<tr class="success">
							<td>姓  名</td>
							<td><input id="name" style="width:350px;height: 40px;position: relative;font-size: 14px;"></td>
						</tr>
						<tr class="warning">
							<td>年  龄</td>
							<td><input id="age" style="width:350px;height: 40px;position: relative;font-size: 14px;"></td>
						</tr>
						<tr class="danger">
							<td>性  别</td>
							<td>
								<form id="sex-select">
									<input name="sex" type="radio" value="1" id="sex">男

									<input name="sex" type="radio" value="2" id="sex" style="margin-left: 120px;">女
								</form>
							</td>
						</tr>
						<tr class="info">
							<td>金  额</td>
							<td><label><input id="amount" style="width:350px;height: 40px;position: relative;font-size: 14px;"></label></td>
						</tr>
					
				</table>
				</form>
				</div>
				<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="submit()">
                 	   提交
                </button>
            	</div>
                </div>
                
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>
	//向前翻页
	function previousPage(){
        if(${page.currentPage-1>=1}){
           return true;       
         } 
         alert("已到页首,无法加载更多");    
         return false;      
    }
    
    //向后翻页
    function nextPage(){
    	if(${page.currentPage+1}<=${page.totalPage}){
    		return true;
    	}
    	alert("已经是最后一页，无法加载更多");
    	return false;
    }
    
    
	//显示模态框
    function show_modal() {
         $('#myModal').modal('show');
    }
    
    
	//跳转按钮-跳转方法
    function startTurn(){
		var turnPage = document.getElementById("turnPage").value;
		if(turnPage > ${page.totalPage}){
		    alert("超过最大限制");
		    return false;
		}
        var shref="account/getAllAccount?currentPage="+turnPage;

        window.location.href=shref;
    }
    
    //删除方法
	function del(){
		var id = $("#userSelect").val();
		$.ajax({
			url:"<%=basePath%>account/deleteAccount",
			type:"POST",
			data:{'id': id},
			dataType:"json",
			success: function(data){
				if(data.operFlag == '1000'){
					alert("SUCCESS");
					window.location.href="<%=basePath%>account/getAllAccount";
				} else {
					alert(data.errorMessage);
				}
			}
		})
	};


	//修改方法
	function update() {
		var id = $("input[name='userSelect']:checked").val();
		$.ajax({
			url:"<%=basePath%>account/searchAccountById",
			type:"POST",
			data:{'id': id},
			dataType:"json",
			success: function (data){
			  if (data.operFlag == '1000') {
			  	console.log(data.user.name);
			  	$("#alter").val(data.user.id);
			  	$("#searchAccount1").val(data.user.account);
			  	$("#name1").val(data.user.name);
			  	$("#age1").val(data.user.age);
			  	$("#amount1").val(data.user.amount);
			  	var sex = data.user.sex;
			  	$("input[name='sex1'][value="+sex+"]").prop("checked",true);
			  } else if(data.operFlag =='1001') {
			      alert(data.errorMessage);
			  }
			},
			error:function(data){
				if(data.operFlag == '1001'){
					alert("Add account excetion,please try again later!");
				}
			}
			})
		$('#edit').modal('show');
    };
	
	
	//搜索方法
	function searchName() {
		console.log("search");
		var name = $("#searchByName").val();
		window.location.href="<%=basePath%>account/getAllAccount?name="+encodeURI(encodeURI(name));
		<%-- $.ajax({
			url:"<%=basePath%>account/searchByName",
			type:"POST",
			data:{'name': name},
			dataType:"json",
			success:function(data){
				if(data.operFlag == 1000){
					
				}
			} --%>
		/* }); */
	};
	
	//编辑用户提交
	function alter(){
		var account = $("#searchAccount1").val();
		var name = $("#name1").val();
		var age = $("#age1").val();
		var sex = $("input[name='sex1']:checked").val();
		var amount = $("#amount1").val();
		var id = $("#alter").val();
		//判断不能为空
		if(account==""){
			alert("账号不能为空");
			return false;
		}
		if(name==""){
			alert("姓名不能为空");
			return false;
		}
		if(age==""){
			alert("年龄不能为空");
			return false;
		}	
		$.ajax({
			url:"<%=basePath%>account/updateAccount",
			type:"POST",
			data:{
				'id':id,
				'account':account,
				'name':name,
				'age':age,
				'sex':sex,
				'amount':amount
			},
			timeout:30000,
			dataType:"json",
			success: function (data){
			  if (data.operFlag == '1000') {
			  	alert("SUCCESS");
			  	window.location.href="<%=basePath%>account/getAllAccount";
			  } else if(data.operFlag =='1001') {
			      alert(data.errorMessage);
			  }
			},
			error:function(data){
				if(data.operFlag == '1001'){
					alert("Alter account excetion,please try again later!")
				}
			}
			})
	};

    //添加用户模态框中的提交按钮方法
    function submit(){  
    	var account = $("#searchAccount").val();
		var name = $("#name").val();
		var age = $("#age").val();
		var sex = $("input[name='sex']:checked").val();
		var amount = $("#amount").val();
		//判断不能为空
		if(account==""){
			alert("账号不能为空");
			return false;
		}
		if(name==""){
			alert("姓名不能为空");
			return false;
		}
		if(age==""){
			alert("年龄不能为空");
			return false;
		}	
		$.ajax({
			url:"<%=basePath%>account/addAccount",
			type:"POST",
			data:{
				'account':account,
				'name':name,
				'age':age,
				'sex':sex,
				'amount':amount
			},
			timeout:30000,
			dataType:"json",
			success: function (data){
			  if (data.operFlag == '1000') {
			  	alert("SUCCESS");
			  	window.location.href="<%=basePath%>account/getAllAccount";
			  } else if(data.operFlag =='1001') {
			      alert(data.errorMessage);
			  }
			},
			error:function(data){
				if(data.operFlag == '1001'){
					alert("Add account excetion,please try again later!")
				}
			}
			})
}



</script>

</div>
</body>

</html>
