<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目详情</title>
<style type="text/css">
	.project {
		height: 100%;
		width: 100%;	
		background-color:#FBFBFF;
	}
	.operate {
		width: 10%;
		background-color:#E0E0E0;
		height: 100%;
		float: left;
	}
	.base {
		width: 90%;
		padding: 20px;
		float: right;
		height: 100%;
	}
	.baseInfo {
		height: 100%;
		width: 70%;
/* 		background-color: #FFFFFF; */
/* 		padding: 16px; */
	}
	.baseInfo>.task {
		background-color: #FFFFFF;
		height: 15%;
		border: 1px solid #F0F0F0;
		margin-bottom: 18px;
		padding: 16px;
	}
	.baseInfo>.node {
		height: auto;
		background-color: #FFFFFF;
		padding: 16px;
	}
	.glyphicon {
		float: left;
		margin-right: 5px;
		color: rgb(0, 100, 0);
	}
	.projectDetail {
		height: 25%;
		background-color: #FFFFFF;
		padding: 16px;
		margin-bottom: 18px;
		border: 1px solid #F0F0F0;
	}
	.projectDetail>p {
		
	}
</style>
</head>

<body>
	<div class="project">
		<!-- part1:左侧操作列表 -->
		<div class="operate">
			
		</div>
		<!-- part2：右侧主题内容 -->
		<div class="base">
			<!-- part2.1 -->
			<div class="baseInfo">
				<!-- part2.1.1：基本信息 -->
				<div class="projectDetail">
					<div style="height: 6%;">
						<span class="glyphicon glyphicon-th-list"></span>
						<p style="float: left;font-size: 14px;margin-bottom: 0;text-align: center;line-height: 16px;">基本信息</p>	
					</div>
					<hr>
					<div>
						
					</div>				
				</div>
				<!-- part2.1.2：任务区 -->
				<div class="task">
					<span class="glyphicon glyphicon-time"></span>
					<p style="float: left;font-size: 14px;margin-bottom: 0;text-align: center;line-height: 16px;">任务区</p>
					<hr>
				</div>
				<!-- part2.1.3：流程节点 -->
				<div class="node">
					<span class="glyphicon glyphicon-star"></span>
					<p style="float: left;font-size: 14px;margin-bottom: 0;text-align: center;line-height: 16px;">流程节点</p>
					<hr>
				</div>
			</div>
		</div>
	</div>
</body>
</html>