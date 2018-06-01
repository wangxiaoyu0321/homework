<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> 
	<script src="<%=basePath %>js/jquery-1.4.4.min.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.all.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.all.min.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.core.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.core.min.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.excheck.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.excheck.min.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.exedit.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.exedit.min.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.exhide.js"></script> 
	<script src="<%=basePath %>js/jquery.ztree.exedit.min.js"></script> 
	<link rel="stylesheet" href="../CSS/zTreeStyle.css" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>组织管理</title>
<style type="text/css">
	.div1 {
		padding:10px 30px;
	}
	h3 {
		font-size: 17px;
	}
</style>
<script type="text/javascript">
    var setting = {
        data: {
            key: {              
                name: "orgname"   //将treeNode的ItemName属性当做节点名称    
            },
            simpleData: {               
                enable: true,//是否使用简单数据模式               
                idKey: "id",//当前节点id属性                  
                pIdKey: "parentid",//当前节点的父节点id属性                
                rootPId: "" //用于修正根节点父节点数据，即pIdKey指定的属性值
            }
        },
        view: {          
            selectedMulti: false //是否支持同时选中多个节点
        }
    };
	$(document).ready(function() { 
	    onloadZTree();
	});
/* 	var demoIframe; */
     //加载ztree  
     function onloadZTree(){
            var ztreeNodes;  
            $.ajax( {  
                async : true, //是否异步  
                cache : false, //是否使用缓存  
                type : 'post', //请求方式,post  
                dataType : "json", //数据传输格式  
                url : "<%=basePath %>library/findAllLibrary ", //请求链接  
                error : function() {  
                     alert('亲，网络有点不给力呀！');  
                },  
                success : function(data) {
                	/* console.log(data.orgList);  */ 
                	ztreeNodes = eval(data.orgList);
                     /* ztreeNodes = eval( "["+data.orgList+"]" ); //将string类型转换成json对象   */
                     /* console.log(ztreeNodes);    */           
                     $.fn.zTree.init($( "#tree"), setting, ztreeNodes);  
                     /* zTree_Menu = $.fn.zTree.getZTreeObj("tree");  
                     demoIframe = demoIframe =  $("#testIframe");
                     demoIframe.bind("load", loadReady);
					 var zTree = $.fn.zTree.getZTreeObj("tree");
					 zTree.selectNode(zTree.getNodeByParam("id", 10000)); */
                     
                     /* $( ".div1").bind("load" , selectAll);  
                     expandAllFlag();  
                     addClick();   */
                }  
           });  
     };
     
</script>
</head>
<body>
	<div class="div1">
		<h3>组织管理</h3>
		<hr>
		<div style="margin:0 auto;border:1px solid #617775;background:#f0f6e4;width:578px;height:460px;  overflow:auto;">
		    <ul id="tree" class="ztree"></ul>
		</div>
		
	</div>
</body>
</html>