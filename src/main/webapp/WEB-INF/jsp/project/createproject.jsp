<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 这里要配置参数key,将其值设置为高德官网开发者获取的key -->

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
	li {
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
</style>
<script type="text/javascript">
	function nextPage1(){
		$("#myTab li:eq(1) a").tab('show');
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
    
//     function a(){
//     	 district = new AMap.DistrictSearch(opts);//注意：需要使用插件同步下发功能才能这样直接使用    
// 	    district.search('中国', function(status, result) {
// 	        if(status=='complete'){
// 	            getData(result.districtList[0]);
// 	        }
// 	    });
//     }
    
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
		/* var province = $("#province").val();
		var province = $("#province").data;
		var city = $("#city").val();
		var district = $("#district").val(); */
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
 				'remark':remark
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
<div class="div">
	<!-- 选项卡菜单start-->
	<ul id="myTab" class="nav nav-tabs" role="tablist" style="border: 0px;">
	    <li class="active li0" class="li0">
	    <a href="#bulletin" role="tab" data-toggle="tab" style="border: 0px;margin-top: 20px;">
	   		<span class="span1">1</span>
	   		<span>基本信息填写</span>
	    </a>
	    </li class="li0">
	    <li >
	    <a href="#rule" role="tab" data-toggle="tab" style="border: 0px;margin-top: 20px;">
	   		<span class="span1">2</span>
	   		<span>制作内容备注</span>
	    </a>
	    </li class="li0">
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
			<div style="margin-bottom: 40px;height: 40px">							
					<button class="btn btn-success" onclick="nextPage1()" style="float: right;border-radius:0px;">下一步</button>				
			</div>
			<!-- depart 1.3表单 -->
			<div>
			<form action="">
			<!-- 基本信息内容 -->
				<div class="div2">
					<span style="margin-right: 50px;">合同类型</span>
					<span>
						<input name="contract" type="radio">房地产项目
						<input name="contract" type="radio">非房地产项目
					</span>
				</div>
				<div class="div2">
					<span>项目名称</span>
					<input class="input" placeholder="请输入项目名称" id="project_name">
				</div>
				<div class="div2">
					<span>&nbsp&nbsp&nbsp开发商</span>
					<input class="input" placeholder="请选择开发商" id="developer">
				</div>
				<div class="div2">
					<span>甲方金额</span>
					<input class="input" placeholder="请输入甲方金额" id="money">
				</div>
				<div class="div2">
					<span>&nbsp&nbsp&nbsp签单人</span>
					<input class="input" placeholder="请输入签单人" id="signer">
				</div>
					<!-- 高德start -->				
					<div id="tip" class="div2">
					<span style="margin-right: 30px;">项目城市</span>
					    <select id='province' onchange='search(this)' class="city" name="province"></select>
					    <select id='city' onchange='search(this)' class="city"></select>
					    <select id='district' onchange='search1(this)' class="city"></select>
					</div>
					<!-- 高德end -->			
				<div class="div2">
					<span>建筑面积</span>
					<input class="input" placeholder="请输入建筑面积" id="area"/>
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
			<!-- depart3.2 制作内容文本框 -->			
				制作内容:<textarea style="height: 450px;width: 650px;" id="remark"></textarea>
			
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
					<button type="button" class="btn btn-success" style="float: right;border-radius:0px;" id="btn" onclick="submit1()">提交审核</button>		
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


</body>

</html>