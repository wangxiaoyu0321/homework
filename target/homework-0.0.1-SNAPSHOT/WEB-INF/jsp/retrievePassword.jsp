<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Retrieve Password</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="ajax方式">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
        function submit(){
            var name = $("#input1").val();
            var pwd = $("#input2").val();
            var pwd1 = $("#input3").val();
            if(pwd == pwd1){
                alert("修改后的密码不可以与原始密码一致");
                return false;
            }
            $.ajax({
                type:"POST",
                dataType:"json",
                url: "<%=basePath%>/user/retrievePassword",
                data: {
                    'name':name,
                    'password':pwd,
                    'change':pwd1
                },
                success: function (data) {
                    console.log(data);//打印服务端返回的数据(调试用)
                    if (data.operFlag == '1000') {
                        window.location.href="<%=basePath%>/user/regist_success";
                    }else if(data.operFlag == '1001'){
                        $(".abc").html(data.errorMessage);
                        $(".abc").show();
                    };
                },
                error : function(request) {
                    alert("异常！");
                }
            });
        }
    </script>
    <style type="text/css">
        #content{
            background: transparent; /*背景透明*/
            border: 2px solid rgba(255,255,255,0.3); /*边框半透明*/
            box-shadow: inset 0 0 4px rgba(255,255,255,0.2),0 0 4px rgba(255,255,255,0.2);  /*内外渐变阴影*/
            position:absolute;
            top:38%;
            left:43%;
            margin:-50px 0 0 -100px;
            height:280px;
            width:340px;
        }
        input,textarea {
            font-size: 16px;
            color: white;
        }
        #input1 {
            height:30px;
            width: 280px;
            background: transparent; /*背景透明*/
            border: 2px solid rgba(255,255,255,0.3); /*边框半透明*/
            box-shadow: inset 0 0 4px rgba(255,255,255,0.2),0 0 4px rgba(255,255,255,0.2);  /*内外渐变阴影*/
        }
        #input2 {
            height:30px;
            width: 280px;
            background: transparent; /*背景透明*/
            border: 2px solid rgba(255,255,255,0.3); /*边框半透明*/
            box-shadow: inset 0 0 4px rgba(255,255,255,0.2),0 0 4px rgba(255,255,255,0.2);  /*内外渐变阴影*/
        }
        #input3 {
            height:30px;
            width: 280px;
            background: transparent; /*背景透明*/
            border: 2px solid rgba(255,255,255,0.3); /*边框半透明*/
            box-shadow: inset 0 0 4px rgba(255,255,255,0.2),0 0 4px rgba(255,255,255,0.2);  /*内外渐变阴影*/
        }
        #button1 {
            height:40px;
            width: 284px;
            border-radius:4px;
            background-color:#4169E1;
            color:#F0FFF0;
            padding: 0px;
            border: 0px;
            margin-left: 28px;
            margin-right: 28px;
            margin-top: 15px;
        }
        a {
            color: #F0F0F0;
            font-size: 14px;
            margin-left: 190px;
        }
        input::-webkit-input-placeholder {
            /* placeholder颜色  */
            color: #F0FFF0;
            /* placeholder字体大小  */
            font-size: 14px;
            /* placeholder位置  */
            text-align: left;
        }
    </style>
</head>
<body style="background:url(../image/11.jpg);height: auto;width: auto;">
<img src="../image/head_.jpg" style="border-radius: 50%;position:absolute; top:20%; left:44.5%; height: 10%">
<div id="content" align="center">
    <div id="form-div" style="margin: auto">
        <div style="color:red;">
            <strong>${message}</strong>
        </div>
        <form id="form1">
            <h2 class="form-signin-heading" align="center" style="color:#DAA520">找回密码</h2>
            <input type="text" name="name" placeholder="请输入用户名。。。" id="input1"/><br><br>
            <input type="password" name="original-password" placeholder="请输入原始密码。。。" id="input2"/><br><br>
            <input type="password" name="change-password" placeholder="请输入新密码。。。" id="input3"/><br>
            <div>
                <a type="reset">重置</a>
            </div>

        </form>

        <button type="button" value="login" onclick="submit()" id="button1">找回密码</button>
    </div>
</div>
</body>
</html>
