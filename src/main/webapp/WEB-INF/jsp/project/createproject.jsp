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
	.div {
		height: 100%;
		width: 100%;
		background-color: #FFFFFF;
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
</style>

</head>
<body>
<div class="div">
	<!-- 选项卡菜单-->
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
	<br>
	<!-- 进度条 -->
	<div class="progress" style="height: 8px;margin-bottom: 40px;">
		<div class="progress-bar" role="progressbar" aria-valuenow="40"
			 aria-valuemin="0" aria-valuemax="100" style="width: 33.3%;height: 8px;">
			<span class="sr-only">40% 完成</span>
		</div>
	</div>
	<div style="height:5px;width: 100%;">
		<button type="button" class="btn btn-success" style="float: right;border-radius:0px;margin-right: 30px;" id="btn" onclick="submit1()">确认提交</button>
	</div>
		
	<!-- 选项卡面板 -->
	<div id="myTabContent" class="tab-content" style="margin-top: 40px;">
	<form action="">
		<!-- 基本信息内容 -->
	    <div class="tab-pane fade in active" id="bulletin">
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
				    <select id='province' onchange='search(this)' class="city"></select>
				    <select id='city' onchange='search(this)' class="city"></select>
				    <select id='district' class="city"></select>
				</div>
				<!-- 高德end -->			
			<div class="div2">
				<span>建筑面积</span>
				<input class="input" placeholder="请输入建筑面积" id="area"/>
			</div>
			</div>
		</form>
		</div>
	    <div class="tab-pane fade" id="rule">规则内容面板</div>
	    <div class="tab-pane fade" id="forum">论坛内容面板</div>
	</div>
</div>

<script type="text/javascript">

	//setTimeout("a()",400);//延时2秒 
    var map, district, polygons = [], citycode;
    var citySelect = document.getElementById('city');
    var districtSelect = document.getElementById('district');

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
        } else if (level === 'city') {
            districtSelect.innerHTML = '';
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
</script>

<script type="text/javascript">
	function submit1(){
		console.log("提交项目信息");
		var name = $("#project_name").val();
		var developer = $("#developer").val();
		var money = $("#money").val();
		var signer = $("#signer").val();
		var area = $("#area").val();
		var province = $("#province").val();
		var city = $("#city").val();
		var district = $("#district").val();
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
				'district':district
			},	
			dataType:"json",
			success: function (data){
			  if (data.operFlag == '1000') {
			  	alert("SUCCESS");
// 			  	window.location.href="<%=basePath%>account/getAllAccount";
			  } else if(data.operFlag =='1001') {
			      alert(data.errorMessage);
			  };
			},
			error:function(data){
				if(data.operFlag == '1001'){
					alert("Alter account excetion,please try again later!");
				};
			}
			});
	};
</script>
</body>

</html>