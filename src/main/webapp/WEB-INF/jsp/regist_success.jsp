<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="5;url=<%=basePath%>/user/toLogin">
<title>Registered successfully</title>
</head>
<script type="text/javascript">  
        window.onload = function () {  
            var i = 4;  
            var tim = document.getElementById("timers");  
            var timer = setInterval(function () {  
                if (i == -1) {  
                    window.location.href="<%=basePath%>/user/toLogin";  
                    clearInterval(timer);  
                } else {  
                    tim.innerHTML = i;  
                    --i;  
                }  
            }, 1000);  
  
        };  
</script>
<body>
	<img src="../image/a.jpg" width="55px" height="55px" style="position:absolute; top:63%;left:28%">
	<div>
		<a href="<%=basePath%>/user/toLogin" style="margin-left: 80px;">返回登录</a>
	
		<p>您将在 <span class="timeShow" id="timers">5</span> 秒内被重定向到登录地址。</p>  
	  
		<p>如果超过 5 秒后您仍然看到本消息，请点击返回登录。</p>  
	</div>
	<div>
		<h1 align="center" style="position:absolute; top:60%;left:35%">注册成功！你是有身份的人啦~</h1>
	</div>	
</body>
</html>