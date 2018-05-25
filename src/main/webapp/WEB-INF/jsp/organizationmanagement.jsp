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

<title>Insert title here</title>
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
                //将treeNode的ItemName属性当做节点名称
                name: "orgName"        
            },
            simpleData: {
                //是否使用简单数据模式
                enable: true,
                //当前节点id属性  
                idKey: "id",
                //当前节点的父节点id属性 
                pIdKey: "parentId",
                //用于修正根节点父节点数据，即pIdKey指定的属性值
                rootPId: 0
            }
        },
        view: {
            //是否支持同时选中多个节点
            selectedMulti: false
        }
    };

    $(function () {
        $.post("organization", function (json) {
            var treeObj = $.fn.zTree.init($("#tree"), setting, json);               
       //默认展开所有节点
            treeObj.expandAll(true);                
        });
    });       
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
<script type="text/javascript">
    var setting = {
        data: {
            key: {
                //将treeNode的ItemName属性当做节点名称
                name: "ItemName"        
            },
            simpleData: {
                //是否使用简单数据模式
                enable: true,
                //当前节点id属性  
                idKey: "Id",
                //当前节点的父节点id属性 
                pIdKey: "pItemId",
                //用于修正根节点父节点数据，即pIdKey指定的属性值
                rootPId: 0
            }
        },
        view: {
            //是否支持同时选中多个节点
            selectedMulti: false
        }
    };

    $(function () {
        $.post("organization", function (json) {
            var treeObj = $.fn.zTree.init($("#tree"), setting, json);               
       //默认展开所有节点
            treeObj.expandAll(true);                
        });
    });       
</script>
</html>