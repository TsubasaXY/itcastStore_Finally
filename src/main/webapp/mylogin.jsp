<%--
  Created by IntelliJ IDEA.
  User: Tsubasa
  Date: 2022/3/29
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@include file="test.html"%>--%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">


    <meta charset="UTF-8">
    <title>传智书城--登录</title>
    <script>
        window.onload = function () {
            var mycode = document.getElementById("mycode");
            mycode.onclick = function () {
                var curttime = new Date();

                // alert("hi,you click me");
                mycode.src = "CodeServlet?k=" + curttime;//保证每次点击图片都会向服务器发出请求，请求CodeServlet
            }
        }
    </script>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        html,
        body {
            width: 100%;
            height: 100%;
        }

        .cms_login {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            background-repeat: no-repeat;
            background-image: url(images/sign-in.jpg);
            background-size: 100% 100%;
        }

        .flexCenter {
            text-align: center;
            margin: auto;
        }

        .cms_login_container {
            width: 70%;
            height: 70%;
            display: flex;
            justify-content: center;
        }

        .cms_login_image {
            width: 60%;
            height: 100%;
        }

        .cms_login_from {
            width: 40%;
            height: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }

        /* .cms_login_container {
            width: 30%;
            height: 70%;
            border: 1px solid red;
        } */

        img {
            width: 100%;
            height: 100%;
        }

        .divBox {
            display: flex;
            justify-content: center;
            width: 80%;
            height: 46px;
            margin-top: 20px;
            margin-left: 10%;
            position: relative;
        }

        .cms_login_logo {
            display: flex;
            justify-content: center;
            width: 80%;
            height: 60px;
            /* border: 1px solid green; */
            margin-left: 10%;
            margin-bottom: 22px;
            margin-top: 25px;
        }

        .cms_login_img {
            width: 44px;
            height: 44px;
            position: absolute;
            top: 1px;
            left: 1px;
        }

        .cms_login_ipt {
            width: 100%;
            outline: none;
            padding-left: 50px;
        }

        .cms_login_ipt60 {
            width: 60%;
            outline: none;
            padding-left: 50px;
        }

        .cms_login_ver {
            width: 30%;
            outline: none;
            margin-left: 8%;
            border: 1px solid #c32c2c;
            background-color: #bd7070;
            line-height: 46px;
            letter-spacing: 4px;
            border-radius: 4px;
            cursor: default;
            color: white;
        }

        .margin_top60 {
            margin-top: 40px;
        }

        .login_btn {
            width: 100%;
            height: 60px;
            letter-spacing: 10px;
            font-size: 24px;
            background-color: cornflowerblue;
            border: none;
            outline: none;
            border-radius: 10px;
            color: white;
        }

        .login_btn:hover {
            background-color: #044468;
            border: none;
            outline: none;
        }
    </style>
</head>

<body>
<div class="cms_login">
    <div class="cms_login_container flexCenter" style="min-height:390px;">
        <div class="cms_login_image" style="min-width: 380px;">
            <!-- <img src="./leftimg_04.png" alt=""> -->
        </div>

        <div class="cms_login_from" style="min-width: 380px;" >
            <form  action="MyLoginServlet" method="post">
                <div class="cms_login_logo"><span style="font-size:24px;">传智书城--登录</span></div>
                <div class="divBox"><img class="cms_login_img" src="${pageContext.request.contextPath}/img/username_mark.png"> <input
                        class="cms_login_ipt" type="text" placeholder="请输入账号" id="cms_login_username" name="username"></div>
                <div class="divBox"><img class="cms_login_img" src="img/password_mark.png">
                    <input type="password" placeholder="请输入密码" class="cms_login_ipt" id="cms_login_passward" name="password">
                </div>
                <div class="divBox"><img class="cms_login_img" src="img/verify_mark.png">
                    <input type="text" placeholder="请输入验证码" class="cms_login_ipt60" id="cms_login_ver_ipt" name="chkde">
                    <img src="CodeServlet" alt="" id="mycode">
                </div>
                <div>   <input type="checkbox" name="remember" id="" value="checked">十天内免登录<br/></div>
                <div class="divBox margin_top60" style="border:none;">

                    <input class="login_btn" type="submit" value="登录" name="submit">
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
