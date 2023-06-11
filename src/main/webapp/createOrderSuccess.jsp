<%--
  Created by IntelliJ IDEA.
  User: Tsubasa
  Date: 2022/6/2
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <title>电子书城</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/main.css" type="text/css" />
<%--    <script type="text/javascript" src="js/my.js">--%>
    <script>
        var interval;
        window.onload = function() {
            alert("5秒后返回主页");
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
<body class="main">
<jsp:include page="head.jsp" />
<jsp:include page="menu_search.jsp" />
<div id="divcontent">
    <table width="850px" border="0" cellspacing="0">
        <tr>
            <td style="padding:30px; text-align:center">
                <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
                    <tr>
                        <td style="width:98px">
                            <img src="images/IconTexto_WebDev_009.jpg" width="128" height="128" />
                        </td>
                        <td style="padding-top:30px">
                            <font style="font-weight:bold; color:#FF0000">亲，订单生成成功，请到“我的账户”-“订单查询”中支付！</font><br /> <br />
                            <a href="${pageContext.request.contextPath}/getRecentNotice">
                                <span id="second">5</span>秒后自动为您转跳回首页</a>
                        </td>
                    </tr>
                </table>
                <h1>&nbsp;</h1>
            </td>
        </tr>
    </table>
</div>
<jsp:include page="foot.jsp" />
</body>
</html>
