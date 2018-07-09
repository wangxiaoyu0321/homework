<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String abc = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://at.alicdn.com/t/font_234130_nem7eskcrkpdgqfr.css">
<script src="${pageContext.request.contextPath }/js/bootstrapValidator.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/bootstrapValidator.css">
<script type="text/javascript" src="../js/schedule.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/js/bootstrap-select.js"></script> 
<!-- 引入上传文件控件 -->
<script type="text/javascript" src="../js/fileinput.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/fileinput.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/fileinput-rtl.min.css">
<!-- 引入表单验证js -->
<!-- <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript" language="javascript"></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建项目</title>
<style type="text/css">
	lable {
		font-weight: normal;
	}
	.div {
		height: 100%;
		width: 100%;
		background-color: #FFFFFF;
	}
	.div3 {
		margin-top: 20px;
	}
	.li0 { 
 		height: 10%; 
 		width: 33%; 
 		border: 0px; 
 		border-color: white; 
 	}
	.span1 {
		height: 45px;
		width: 45px;
		font-size: 16px;
		display:inline-block;
		background-color: #FFA500;
		border-radius:50px;
		color: #FFFFFF;
		text-align: center;
		line-height:45px;
	}
	.progress-bar {
		width: 5px;
		background-color: #800080;
	}
	a {
		border: 0px;
	}
	.input {
		height: 34px;
		width: 40%;
		margin-left: 25px;
		border: solid 1px #DCDCDC;
		margin-right: 20px;
	}
	.selectpicker {
		height: 34px;
		width: 40%;
		margin-left: 32%;
		border: solid 1px #DCDCDC;
		border-radius:0px;
		margin-top: 0px;
		color: #DCDCDC;
	}
	.city {
		height: 34px;
		width: 12%;
		margin-right: 24px;
		border-color: #DCDCDC;
	}
	.div2 {
		margin-bottom: 30px;
	}
	input{
		padding-left: 10px;
	}
	button {
		border-radius:0px;
	}
	.error {
		color: red;
	}
	.li-tab{
		width: 20%;
		font-size:14px;
		height: 40px;
		border-radius:0px;
		background-color: #9400D3;
	}
	.a-tab {
		height: 40px;
		color: white;
		background-color: #9400D3;
		border: 0px;
		border-radius:0px;
		background-color: #9400D3;
	}
	.nav-tabs>li>a {
		border: 0px;
		border-radius:0px;
	}
	.nav-tabs>li.active>a:hover {
		border: 0px;
		background-color: #9400D3;
	}
	.nav-tabs>li.active>a {
		border: 0px;
	}
</style>
<!-- 日历控件样式 -->
<style>
	*{
		margin: 0;
		padding: 0;
	}
	ul{
		list-style: none;
	}
	#schedule-box{
		width: 240px;
		height:260px;
/* 		margin: 0 auto; */
		padding: 35px 20px;
		font-size: 13px;
	}
	.schedule-hd{
		display: flex;
		justify-content: space-between;
		padding: 0 15px;
	}
	.today{
		flex: 1;
		text-align: center;
		color: #FF0000;
	}
	.ul-box{
		overflow: hidden;
	}
	.ul-box > li{
		float: left;
		width: 14.28%;
		text-align: center;
		padding: 5px 0;
	}
	.other-month{
		color: #999999;
	}
	.current-month{
		color: #333333;
	}
	.today-style{
		border-radius: 50%;
		background: #58d321;
	}
	.arrow{
		cursor: pointer;
	}
	.dayStyle{
		display: inline-block;
		width: 28px;
		height: 28px;
		border-radius: 50%;
		text-align: center;
		line-height: 28px;
		cursor: pointer;
	}
	.current-month > .dayStyle:hover{
		background: #00BDFF;
		color: #ffffff;
	}
	.today-flag{
		background: #fff;
		color: black;
	}
	.boxshaw{
		box-shadow: 2px 2px 15px 2px #e3e3e3;
	}
	.selected-style {
		background: #00BDFF;
		color: #ffffff;
	}
	#h3Ele{
		text-align: center;
		padding: 10px;
	}
	#calendar_body{
		height: 240px;
	}
</style>

<script type="text/javascript">

	$(document).ready(function(){
		var flag = $("#test").val();
		if(flag == 0){
		}else if(flag == 1){
			$("#myTab li:eq(1) a").tab('show');
		}else{
			alert("网络错误");
		}
	});	

	var productType = "";
	
	function nextPage1(){
		//项目信息验证
// 		$('#form_base').bootstrapValidator('validate');
// 			if ($("#form_base").data('bootstrapValidator').isValid()) {
// 				$("#myTab li:eq(1) a").tab('show');
// 		}
		
 		$("#myTab li:eq(1) a").tab('show');
		var productType = window.document.getElementsByName("product");
     	var s=[];//如果这样定义var s;变量s中会默认被赋个null值
        for(var i=0;i<productType.length;i++){
			if(productType[i].checked) //取到对象数组后，我们来循环检测它是不是被选中
            s.push(productType[i].value);
				s+productType[i].value;  //如果选中，将value添加到变量s中  
     	}
     	productType=s;
     	var jsObject = JSON.parse(productType);
     	console.log(jsObject);
      	$.ajax({
      		url: "<%=basePath%>project/getProduction",
      		type: "POST",
      		data:{'productType': jsObject},
      		dataType:"json",
      		async: false,
      		success:function(data){
      			console.log(data.operFlag);
      			$("#right-main").load('<%=basePath%>project/getProductType?product='+productType);  	
      		},
      		error:function(data){
      			alert("获取制作内容异常");
      			console.log(data.operFlag);
      			console.log(data);
      			$("#right-main").load('<%=basePath%>project/getProductType?product='+productType);
      		}
      	});  

	}
	
		
	function nextPage2(){
		//制作说明书
		$("#myTab li:eq(2) a").tab('show');
		//回显项目名称
		var name=window.document.getElementById ("name"); 
		name.innerHTML=$("#project_name").val();
		//回显开发商信息
		var developer=window.document.getElementById ("developer0"); 
		developer.innerHTML=$("#developer").val();
		//回显项目城市
		var city=window.document.getElementById ("city0"); 
		city.innerHTML=province;
		//回显甲方金额
		var money=window.document.getElementById ("money0"); 
		money.innerHTML=$("#money").val();
		//回显建筑面积
		var area=window.document.getElementById ("area0"); 
		area.innerHTML=$("#area").val();
		//回显制作内容备注
		var remark=window.document.getElementById ("remark0"); 
		remark.innerHTML=$("#remark").val();
		//回显产品类型
		var productType0=window.document.getElementById("productType0");
		var productType=window.document.getElementsByName("product");
		var check=[];
		for(k=0;k<productType.length;k++){
      		if(productType[k].checked){
           		check.push(productType[k].previousSibling.nodeValue);
            }
            console.log(k);
  		}
  		
//   		check = check.toString();
		productType0.innerHTML=check;
		console.log(productType0);
  		//check1 = check1.subString(0,check1.lastIndexOf(","));
	}
	function priviousPage1(){
		$("#myTab li:eq(0) a").tab('show');
	}
	function priviousPage2(){
		$("#myTab li:eq(1) a").tab('show');
	}
	//setTimeout("a()",400);//延时2秒 
    var map, district, polygons = [], citycode;
    var citySelect = document.getElementById('city');
    var districtSelect = document.getElementById('district');
     
    var province = "";
    var city = "";
    var district = "";
	
    //行政区划查询
    var opts = {
        subdistrict: 1,   //返回下一级行政区
        level: 'all'
    };
       
    district = new AMap.DistrictSearch(opts);//注意：需要使用插件同步下发功能才能这样直接使用    
    district.search('中国', function(status, result) {
        if(status=='complete'){
            getData(result.districtList[0]);
        }
    }); 
    function getData(data,level) {
        //清空下一级别的下拉列表
        if (level === 'province') {
            citySelect.innerHTML = '';
            districtSelect.innerHTML = '';
            province = data.name;
        } else if (level === 'city') {
            districtSelect.innerHTML = '';
            city = data.name;
        } 
        
        var subList = data.districtList;
        if (subList) {
            var contentSub = new Option('--请选择--');
            var curlevel = subList[0].level;
            var curList =  document.querySelector('#' + curlevel);
            curList.add(contentSub);
            for (var i = 0, l = subList.length; i < l; i++) {
                var name = subList[i].name;
                var levelSub = subList[i].level;
                var cityCode = subList[i].citycode;
                contentSub = new Option(name);
                contentSub.setAttribute("value", levelSub);
                contentSub.center = subList[i].center;
                contentSub.adcode = subList[i].adcode;
                curList.add(contentSub);
            }
        }
        console.log(data.level,data.name);
    };
    function search(obj) {
        //清除地图上所有覆盖物
        for (var i = 0, l = polygons.length; i < l; i++) {
            polygons[i].setMap(null);
        }
        var option = obj[obj.options.selectedIndex];
        var keyword = option.text; //关键字
        var adcode = option.adcode;
        district.setLevel(option.value); //行政区级别
        district.setExtensions('all');
        //行政区查询
        //按照adcode进行查询可以保证数据返回的唯一性
        district.search(adcode, function(status, result) {
            if(status === 'complete'){
                getData(result.districtList[0],obj.id);
            }
        });
    };
    
    function search1(obj){
    	var option = obj[obj.options.selectedIndex];
    	district = option.text;  	
    };
    
    //提交审核
    function submit1(){
		console.log("提交项目信息");
		var name = $("#project_name").val();
		var developer = $("#developer").val();
		var money = $("#money").val();
		var signer = $("#signer").val();
		var area = $("#area").val();
		var remark=$("#remark").val();
		//获取产品
		var productType=window.document.getElementsByName("product");
		var check=[];
		for(k=0;k<productType.length;k++){
      		if(productType[k].checked)
            check.push(productType[k].value);
  		}
  		//check1 = check1.subString(0,check1.lastIndexOf(","));
  		check = check.toString();
  		console.log(check.toString()+"is check");
		console.log(province+"---"+city+"----"+district);
		$.ajax({
			url:"<%=basePath%>project/create",
			type:"POST",
			data:{
				'name':name,
				'developer':developer,
				'money':money,
				'signer':signer,
				'area':area,
				'province':province,
				'city':city,
 				'district':district,
 				'remark':remark,
 				'product':check
			},	
			dataType:"json",
			success: function (data){
			  if (data.operFlag == '1000') {
			  	alert("SUCCESS");
			  	window.location.href="<%=basePath%>user/workbench";
			  } else if(data.operFlag =='1001') {
			      alert(data.errorMessage);
			  };
			},
			error:function(data){
				if(data.operFlag == '1001'){
					alert("Alter account exception,please try again later!");
				};
			}
			});
	};
	
</script>

</head>
<body>
<div class="div" style="overflow: auto;">
	<input type="text" id="test" value=${flag } style="display:none">
	<!-- 选项卡菜单start-->
	<ul id="myTab" class="nav nav-tabs" role="tablist" style="border: 0px;">
	    <li class="active li0" class="li0">
	    <a href="#bulletin" role="tab" data-toggle="tab" style="border: 0px;margin-top: 20px;">
	   		<span class="span1">1</span>
	   		<span>基本信息填写</span>
	    </a>
	    </li>
	    <li class="li0">
	    <a href="#rule" role="tab" data-toggle="tab" style="border: 0px;margin-top: 20px;">
	   		<span class="span1">2</span>
	   		<span>制作内容备注</span>
	    </a>
	    </li>
	    <li class="li0"><a href="#forum" role="tab" data-toggle="tab" style="border: 0px;margin-top: 20px;">
	    	<span class="span1">3</span>
	   		<span>制作说明书</span>
	    </a></li>
	</ul>
	<!-- 选项卡菜单end--> 
	<br>		
	<!-- 选项卡面板 -->
	<div id="myTabContent" class="tab-content" style="margin-top: 40px;">	
		<!-- depart1 -->
	    <div class="tab-pane fade in active" id="bulletin">
	    	<!-- depart 1.1进度条 -->
			<div class="progress" style="height: 8px;margin-bottom: 40px;">
				<div class="progress-bar" role="progressbar" aria-valuenow="40"
					 aria-valuemin="0" aria-valuemax="100" style="width: 33.3%;height: 8px;">
					<span class="sr-only">40% 完成</span>
				</div>
			</div>
			<!-- depart 1.2按钮 -->
			<!-- depart 1.3表单 -->
			<div>
			<div style="margin-bottom: 40px;height: 40px">							
				<button class="btn btn-success" onclick="nextPage1()" style="float: right;border-radius:0px;" type="submit">下一步</button>				
			</div>
			<!-- 基本信息内容 -->
			<form id="form_base" name="form_base">
				<!-- 合同类型 -->
				<div class="form-group div2">
					<span style="margin-right: 50px;">合同类型</span>					
					<span>
						<input name="contract" type="radio">房地产项目
						<input name="contract" type="radio">非房地产项目
					</span>
				</div>
				<div class="div2">
					<span>城市公司</span>
					<span style="color: #FF0000">*</span>
					<input value=${orgName } disabled class="input">
				</div>
				<!-- 项目名称 -->
				<div class="form-group div2">
					<span>项目名称</span>
					<span style="color: #FF0000">*</span>
					<input class="input" placeholder="请输入项目名称" name="project_name" id="project_name"/>
				</div>
				<!-- 开发商名称 -->
				<div class="form-group div2">
					<span>&nbsp&nbsp&nbsp开发商</span>
					<span style="color: #FF0000">*</span>
					<input class="input" placeholder="请选择开发商" id="developer" name="developer">
				</div>
				<!-- 甲方金额 -->
				<div class="form-group div2">
					<span>甲方金额</span>
					<span style="color: #FF0000">*</span>
					<input class="input" placeholder="请输入甲方金额" id="money" name="money">
				</div>
				<!-- 签单人 -->
				<div class="form-group div2">
					<span>签单人</span>
					<span style="color: #FF0000">*</span>
				 	<select name="signer" id="dealer_id" class="input" required data-live-search="true">
				    	<option value="" disabled selected hidden>--请选择或搜索签单人--</option>
					    <c:forEach items="${signer}" var="signer">
					       <option value="${signer.name }">${signer.name }</option>
					    </c:forEach>
				    </select>
				</div>
				<!-- 日历控件 -->
				<div class="form-group div2">
					<span>选择日期</span>
					<span style="color: #FF0000">*</span>
					<input placeholder="请选择日期" onclick="calendar()" id="date" class="input" value="" readonly="readonly">
					<div id='schedule-box' class="boxshaw" style="display: none;"></div>		
						<div style="display: none">
							<h3 id='h3Ele'></h3>
						</div>
				</div>
				<!-- 高德start -->				
				<div id="tip" class="form-group div2">
				<span>项目城市</span>
				<span style="color: #FF0000;margin-right: 30px;">*</span>
				    <select id='province' onchange='search(this)' class="city" name="province"></select>
				    <select id='city' onchange='search(this)' class="city" name="city"></select>
				    <select id='district' onchange='search1(this)' class="city" name="district"></select>
				</div>
				<!-- 高德end -->		
				<!-- 建筑面积 -->	
				<div class="form-group div2">
					<span>建筑面积</span>
					<span style="color: #FF0000">*</span>
					<input class="input" placeholder="请输入建筑面积" id="area" name="area"/>
				</div>
				<!-- 产品类型 -->
				<div class="form-group div2">
					<div style="float: left;margin-left: 26.5%;">
						<span>产品类型</span>
						<span style="color: #FF0000;margin-right: 1px;">*</span>
					</div>
					<div style="margin-right: 50%">
						<span name="productType">											
							<input name="product" type="checkbox" value="1" style="height: 15px;width: 15px;vertical-align: text-top;;margin-top: 0px;"> 美房圈&nbsp&nbsp					
							<input name="product" type="checkbox" value="2" style="height: 15px;width: 15px;vertical-align: text-top;;margin-top: 0px;"> HVR&nbsp&nbsp 
							<input name="product" type="checkbox" value="3" style="height: 15px;width: 15px;vertical-align: text-top;;margin-top: 0px;"> 定制化&nbsp&nbsp
							<input name="product" type="checkbox" value="4" style="height: 15px;width: 15px;vertical-align: text-top;;margin-top: 0px;"> 定制化HVR
						</span>
					</div>
				</div>
			</form>
			</div>
		</div>
		
		<!-- depart2 -->
	    <div class="tab-pane fade" id="rule">
		    <!-- depart 2.1进度条 -->
			<div class="progress" style="height: 8px;margin-bottom: 40px;">
				<div class="progress-bar" role="progressbar" aria-valuenow="40"
					 aria-valuemin="0" aria-valuemax="100" style="width: 67%;height: 8px;">
					<span class="sr-only">40% 完成</span>
				</div>
			</div>
			<!-- depart2.2 按钮 -->
			<div style="margin-bottom: 40px;height: 40px">							
					<button class="btn btn-success" onclick="nextPage2()" style="float: right;border-radius:0px;">下一步</button>				
					<button class="btn btn-success" onclick="priviousPage1()" style="float: right;border-radius:0px;">上一步</button>
			</div>
			<!-- depart2.2 制作内容 -->	
			<!-- 制作内容选项卡标签 -->
			<ul id="myTab_content" class="nav nav-tabs" style="border-bottom: 0px;">			  				  			  		  			
				<c:forEach var="productType" items="${productType}">	
					<c:choose>
					    <c:when test="${productType ==1}">
					       	<!-- MFQ制作内容标签 -->
				   			<li class="li-tab"><a href="#MFQ" data-toggle="tab" class="a-tab">美房圈</a></li>
					    </c:when>	
					    <c:when test="${productType ==2}">
					    	<!-- HVR制作内容标签 -->
				   			<li class="li-tab"><a href="#HVR" data-toggle="tab" class="a-tab">HVR</a></li>
					    </c:when>	
					    <c:when test="${productType ==3}">
					    	 <!-- 定制化制作内容标签 -->
				   			 <li class="li-tab"><a href="#Customization" data-toggle="tab" class="a-tab">定制化</a></li>
					    </c:when>
					    <c:when test="${productType ==4}">
					    	 <!-- 定制化HVR制作内容标签 -->
				   			 <li class="li-tab"><a href="#CustomizationHVR" data-toggle="tab" class="a-tab">定制化HVR</a></li>
					    </c:when>
					</c:choose>
				</c:forEach>
			</ul>
			<!-- 制作内容标签 -->		
<!-- 			<ul id="myTab_content" class="nav nav-tabs"> -->
			   <!-- HVR制作内容标签 -->
<!-- 			   <li class="active"><a href="#HVR" data-toggle="tab">HVR</a></li> -->
			   <!-- MFQ制作内容标签 -->
<!-- 			   <li><a href="#MFQ" data-toggle="tab">美房圈</a></li>	 -->
			   <!-- 定制化制作内容标签 -->
<!-- 			   <li><a href="#Customization" data-toggle="tab">定制化</a></li> -->
			   <!-- 定制化HVR制作内容标签 -->
<!-- 			   <li><a href="#CustomizationHVR" data-toggle="tab">定制化HVR</a></li>		   -->
<!-- 			</ul> -->
			<!-- 具体制作内容 -->
			<div id="myTab_contentContent" class="tab-content">		
				<!-- MFQ制作内容 -->
				<div class="tab-pane fade" id="MFQ">
					<ul class='nav nav-pills nav-stacked'>
						<li class='active'><a href='#tab1' data-toggle='tab'>MFQ基本制作内容</a></li>
						<li><a href='#tab2' data-toggle='tab'>MFQ制作要求备注</a></li>
					</ul>
					<div class='tab-content'>
					    <div class='tab-pane active' id='tab1'>MFQ制作要求内容
						    <c:forEach items="${productions }" var="production">
								<td>${production.productionName }</td>
							</c:forEach>
						</div>
					    <div class='tab-pane' id='tab2'>MFQ制作要求备注</div>
					</div>
				</div>
				<!-- HVR制作内容 -->
				<div class="tab-pane fade" id="HVR">
					<ul class='nav nav-pills nav-stacked'>
						<li class='active'><a href='#tab1' data-toggle='tab'>HVR基本制作内容</a></li>
						<li><a href='#tab2' data-toggle='tab'>HVR制作要求备注</a></li>
					</ul>
					<div class='tab-content'>
					    <div class='tab-pane active' id='tab1'>HVR
	  						<c:forEach items="${sessionScope.productions }" var="production">
								<td>${production.productionName }</td>
							</c:forEach>
						</div>
					    <div class='tab-pane' id='tab2'></div>
					</div>
				</div>
				<!-- 定制化制作内容 -->
				<div class="tab-pane fade" id="Customization">
					<p>上传定制化文件</p>
					<div class="file-loading"> 
					    <input id="input-b6" name="input-b6[]" type="file" multiple>
					</div>
				</div>
				<!-- 定制化HVR内容 -->
				<div class="tab-pane fade" id="CustomizationHVR">
					<p>上传定制化HVR文件</p>
					<input id="input-b2" name="input-b2" type="file" class="file" data-show-preview="false">
				</div>
			</div>
			<!-- 上传图片 -->
			
		</div>
		
		<!-- depart3 -->
	    <div class="tab-pane fade" id="forum">
	    	<!-- depart 3.1进度条 -->
			<div class="progress" style="height: 8px;margin-bottom: 40px;">
				<div class="progress-bar" role="progressbar" aria-valuenow="40"
					 aria-valuemin="0" aria-valuemax="100" style="width: 100%;height: 8px;">
					<span class="sr-only">40% 完成</span>
				</div>
			</div>
			<!-- depart3.2 按钮 -->
			<div style="margin-bottom: 40px;height: 40px">							
					<button class="btn btn-success" style="float: right;border-radius:0px;" id="btn" type="submit" onclick="submit1()">提交审核</button>		
					<button class="btn btn-success" onclick="priviousPage2()" style="float: right;border-radius:0px;">上一步</button>		
			</div>
			<!-- 3.3产品说明书 -->
			<div style="height: auto;width: auto;padding-left: 140px;"align="left">
				<div><span class="glyphicon glyphicon-home" style="color: rgb(58, 157, 167);font-size: 16px;"> 项目信息</span></div>
				<div class="div3">
					<label>项目名称：</label>
					<span id="name" style="width: auto"></span>
				</div>
				<div class="div3">
					<label>开发商：</label>
					<span id="developer0" style="width: auto;"></span>
				</div>
				<div class="div3">
					<label>产品类型：</label>
					<span id="productType0"></span>
				</div>
				<div class="div3">
					<label>项目城市：</label>
					<span id="city0" style="width: auto;"></span>
				</div>
				<div class="div3">
					<label>甲方金额：</label>
					<span id="money0" style="width: auto;"></span>
				</div>
				<div class="div3">
					<label>建筑面积：</label>
					<span id="area0" style="width: auto;"></span>
				</div>
			<hr style="padding-left: 140px;">
			</div>
			<div style="height: auto;width: auto;padding-left: 140px;"align="left">
				<div class="div3">
					<span class="glyphicon glyphicon-pencil" style="color: rgb(58, 157, 167);font-size: 16px"> 制作内容</span><br/>
					<span id="remark0" style="width: auto;"></span>
				</div>
			</div>
	    </div>
		</div>
		
    </div>	
    	
<!-- 表单验证 -->
<script type="text/javascript">
	//表单验证
	$(document).ready(function() {		
	    $('#form_base').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            project_name: {
	                validators: {
	                    notEmpty: {
	                        message: '傻啊，项目名没写看不着啊',
	                    },
	                    stringLength: {
	                    	max:10,
	                    	message: '长度10位以内，整那么长干啥',
	                    }
	                }
	            },
	            money: {
	                validators: {
	                    notEmpty: {
	                        message: '傻啊，甲方不给钱你给啊',
	                    },
	                }
	            },
	            signer: {
	                validators: {
	                    notEmpty: {
	                        message: '傻啊，签单人没写看不着啊',
	                    },
	                }
	            },
	            area: {
	                validators: {
	                    notEmpty: {
	                        message: '傻啊，建筑面积没写咋盖楼',
	                    },
	                }
	            },
	            province: {
	                validators: {
	                    notEmpty: {
	                        message: '大哥，把项目所在省写上',
	                    },
	                }
	            },
	            city: {
	                validators: {
	                    notEmpty: {
	                        message: '还有市',
	                    },
	                }
	            },
	            district: {
	                validators: {
	                    notEmpty: {
	                        message: '最后还有区',
	                    },
	                }
	            },
	            developer: {
	                validators: {
	                    notEmpty: {
	                        message: '傻啊，开发商没写看不着啊',
	                    },
	                    stringLength: {
	                    	max:16,
	                    	message: '啥破开发商，名整这么长',
	                    }
	                }
	            },
	            contract: {
	                validators: {
	                    notEmpty: {
	                        message: '选一个啊',
	                    },
	                }
	            },
	            product: {
	                validators: {
	                    notEmpty: {
	                        message: '选一个啊',
	                    },
	                }
	            },
	        }
	    });
	});
</script>

<!-- 日历  -->
<script>
	function calendar(){
		//取消冒泡事件
        event.stopPropagation();//这句是必须
		document.getElementById("schedule-box").style.display="";
		var mySchedule = new Schedule({
			el: '#schedule-box',
			//date: '2018-9-20',
			clickCb: function (y,m,d) {
				document.querySelector('#h3Ele').innerHTML = /* '日期：'+ */y+'-'+m+'-'+d	
			},
			nextMonthCb: function (y,m,d) {
				document.querySelector('#h3Ele').innerHTML = /* '日期：'+ */y+'-'+m+'-'+d	
			},
			nextYeayCb: function (y,m,d) {
				document.querySelector('#h3Ele').innerHTML =/*  '日期：'+ */y+'-'+m+'-'+d	
			},
			prevMonthCb: function (y,m,d) {
				document.querySelector('#h3Ele').innerHTML =/*  '日期：'+ */y+'-'+m+'-'+d	
			},
			prevYearCb: function (y,m,d) {
				document.querySelector('#h3Ele').innerHTML =/*  '日期：'+ */y+'-'+m+'-'+d	
			}
		});
			return false;
    };	
      //点击空白或者其他区域时divTop隐藏
      $("#schedule-box").click(function(event) {
        event.stopPropagation(); //阻止事件向上冒泡
    });
    $(document).click(function(){
	    $("#schedule-box").slideUp('slow');
	    var id=$("#h3Ele").text();
	    document.getElementById("date").value=id;
		console.log(id);
    });
</script>

<!-- 图片上传  -->
<script>
$(document).ready(function(){
    $("#input-b6").fileinput({
        showUpload: true,
        dropZoneEnabled: false,
        maxFileCount: 10,
        mainClass: "input-group-lg"
    });
});
</script>

</body>
</html>