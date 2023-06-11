<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电子书城</title>
    <link rel="stylesheet" href="css/main.css" type="text/css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
    <script>
        var interval;
        window.onload = function() {
            alert("返回主页");
            interval = window.setInterval("changeSecond()", 1000);
        };
        function changeSecond() {
            var second = document.getElementById("second");
            var svalue = second.innerHTML;
            svalue = svalue - 1;
            if (svalue == 0) {
                location.href="getRecentNotice"
                return;
            }
            second.innerHTML = svalue;
        }

    </script>
</head>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <img src="images/logo.png" alt="">
        </div>
        <div class="col-md-4 col-md-offset-4">
            <ul class="list-inline">
                <li role="presentation"><a href="">  <img src="images/cart.gif" alt="">购物车 | </a></li>
                <li role="presentation"><a href="">帮助中心 | </a></li>
                <li role="presentation"><a href="">我的账户 | </a></li>
                <li role="presentation"><a href="">新用户注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="background-color: #419641;height: 3px;margin-top: 20px;"></div>

<div class="row" style="background-color: black;height: 50px;">
    <nav class="navbar navbar-default" role="navigation" style="background-color: black;">
        <div class="container-fluid col-md-10 col-md-offset-1">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"></a>

            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#" style="color: white">文学</a></li>
                    <li><a href="#" style="color: white">生活</a></li>
                    <li><a href="#" style="color: white">计算机</a></li>
                    <li><a href="#" style="color: white">外语</a></li>
                    <li><a href="#" style="color: white">经管</a></li>
                    <li><a href="#" style="color: white">励志</a></li>
                    <li><a href="#" style="color: white">社科</a></li>
                    <li><a href="#" style="color: white">学术</a></li>
                    <li><a href="#" style="color: white">少儿</a></li>
                    <li><a href="#" style="color: white">艺术</a></li>
                    <li><a href="#" style="color: white">原版</a></li>
                    <li><a href="#" style="color: white">科技</a></li>
                    <li><a href="#" style="color: white">考试</a></li>
                    <li><a href="#" style="color: white">生活百科</a></li>
                    <li><a href="#" style="color: yellow">全部商品目录</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="row" style="background-color: orange;">
    <div class="col-md-6 col-md-offset-5">
        <form class="navbar-form navbar-right">
            <div class="form-group">
                <label for="exampleInputEmail2" style="color: white">Search</label>
                <input style="height: 24px;width: 150px;" type="email" class="form-control" id="exampleInputEmail2"
                       placeholder="请输入书名">
            </div>
            <!--                <button type="submit" class="btn btn-default" style="background-color: #419641;color: white">搜索</button>-->
            <img src="images/serchbutton.gif" alt="">
        </form>
    </div>
</div>


<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">
    <table width="850px" border="0" cellspacing="0">
        <tr>
            <td style="padding:30px; text-align:center">
                <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
                    <tr>
                        <td style="width:98px">
                            <img src="images/IconTexto_WebDev_009.jpg" width="128" height="128" />
                        </td>
                        <td style="padding-top:30px">
                            <font style="font-weight:bold; color:#FF0000">注册成功,别忘记激活帐户啊！</font><br />
                            <br />
                            <a href="${pageContext.request.contextPath}/getRecentNotice">
                                <span id="second">5</span>秒后自动为您转跳回首页
                            </a>
                        </td>
                    </tr>
                </table>
                <h1>&nbsp;</h1></td>
        </tr>
    </table>
    </div>
    <div class="col-lg-2"></div>
</div>
<footer style="margin-top: 15px">
    <div style="background-color: #c0c0c0;height: 65px;">
        <div class="row">
            <div class="col-md-3 col-lg-offset-1 col-xs-3 col-sm-3 col-md-offset-1 col-xs-offset-1 col-sm-offset-1 ">
                <img src="images/logo.png" style="height: 55px"></div>
            <div class="col-md-6 col-xs-6 col-sm-6">
                <p style="font-weight: bold">CONTACTUS</p>
                <strong style="color: #9d9d9d">COPYRIGHT 2015◎BookStore All Rights RESERVED.</strong>
            </div>
        </div>

    </div>
</footer>
</body>
</html>
