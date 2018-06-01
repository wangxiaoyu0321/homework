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

<script type="text/javascript">
    var map, district, polygons = [], citycode;
    var citySelect = document.getElementById('city');
    var districtSelect = document.getElementById('district');
    var areaSelect = document.getElementById('street');

    map = new AMap.Map('mapContainer', {
        resizeEnable: true,
        center: [116.30946, 39.937629],
        zoom: 3
    });
    //行政区划查询
    var opts = {
        subdistrict: 1,   //返回下一级行政区
        showbiz:false  //最后一级返回街道信息
    };
    district = new AMap.DistrictSearch(opts);//注意：需要使用插件同步下发功能才能这样直接使用
    district.search('中国', function(status, result) {
        if(status=='complete'){
            getData(result.districtList[0]);
        }
    });
    function getData(data,level) {
        var bounds = data.boundaries;
        if (bounds) {
            for (var i = 0, l = bounds.length; i < l; i++) {
                var polygon = new AMap.Polygon({
                    map: map,
                    strokeWeight: 1,
                    strokeColor: '#CC66CC',
                    fillColor: '#CCF3FF',
                    fillOpacity: 0.5,
                    path: bounds[i]
                });
                polygons.push(polygon);
            }
            map.setFitView();//地图自适应
        }
       
       
        
        //清空下一级别的下拉列表
        if (level === 'province') {
            citySelect.innerHTML = '';
            districtSelect.innerHTML = '';
            areaSelect.innerHTML = '';
        } else if (level === 'city') {
            districtSelect.innerHTML = '';
            areaSelect.innerHTML = '';
        } else if (level === 'district') {
            areaSelect.innerHTML = '';
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
        
    }
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
    }
    function setCenter(obj){
        map.setCenter(obj[obj.options.selectedIndex].center)
    }
</script>
<script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>


<!-- 引入bootstrap -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.6&key=54ca3bd745db31feccc76bd2f761289b"></script>
<script type="text/javascript">
	function submit1(){
		console.log("提交项目信息");
		var name = $("#project_name").val();
		var developer = $("#developer").val();
		var money = $("#money").val();
		var signer = $("#signer").val();
		var area = $("#area").val();
		$.ajax({
			url:"<%=basePath%>project/create",
			type:"POST",
			data:{
				'name':name,
				'developer':developer,
				'money':money,
				'signer':signer,
				'area':area
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
			<div class="div2">
				<span>项目城市</span>
				<select style="height: 34px;width: 110px;"><option>--请选择省份--</option></select>
				<select style="height: 34px;width: 110px;"><option>--请选择城市--</option></select>
				<select style="height: 34px;width: 110px;"><option>--请选择地区--</option></select>
				
				<!-- 自定义start -->
				<div id="mapContainer"></div>
				<div id="tip">
				    省：<select id='province' style="width:100px" onchange='search(this)'></select>
				    市：<select id='city' style="width:100px" onchange='search(this)'></select>
				    区：<select id='district' style="width:100px" onchange='search(this)'></select>
				    街道：<select id='street' style="width:100px" onchange= 'setCenter(this)'></select>
				</div>
				<!-- 自定义end -->
			</div>
			<div class="div2">
				<span>建筑面积</span>
				<input class="input" placeholder="请输入建筑面积" id="area"/>
			</div>
		</div>
	    <div class="tab-pane fade" id="rule">规则内容面板</div>
	    <div class="tab-pane fade" id="forum">论坛内容面板</div>
	</div>
</div>
</body>

</html>