<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    //退出确认框
    function confirm_logout() {
        var msg = "您确定要退出登录吗？";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
<input type="hidden" value=" ${pageContext.request.contextPath}" id="webPath">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
<%--<div class="container" style="height:80px ">--%>
<%--  <div class="row">--%>

<%--    <div class="col-sm-4 col-lg-offset-4 col-xs-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">--%>
<%--      <img src="images/cart.gif" alt="">--%>

<%--      <a href="#">欢迎你:${user.username}</a>--%>
<%--      <a href="" style="border-right: 2px solid white">购物车</a>|--%>
<%--      <a href="" style="border-right: 2px solid white">帮助中心</a>|--%>
<%--      <a href="myAccount.jsp" style="border-right: 2px solid white">我的账户</a>|--%>
<%--      <a href="register.jsp">新用户注册 </a>--%>

<%--      <a href="DeleteCurrentUserServlet " onclick="javascript:return confirm_logout()">退出</a>--%>
<div class="col-lg-2"></div>
<div class=" col-lg-8">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="index.jsp">首页</a>
        </li>
        <li>
            <a href="mylogin.jsp">登录</a>
        </li>
        <li class="disabled">
            <a href="register.html">新用户注册</a>
        </li>
        <li class="dropdown pull-right">
            <a href="#">欢迎你:</a>
        </li>
        <li class="dropdown pull-right">
            <a href="#" data-toggle="dropdown" class="dropdown-toggle">更多<strong class="caret"></strong></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="#">帮助中心</a>
                </li>
                <li>
                    <a href="myAccount.jsp">我的账户</a>
                </li>

            </ul>
        </li>
        <form class="form-search" style="text-align: right;">
            <input class="input-medium search-query" type="text" /> <button type="submit" class="btn">查找</button>
        </form>
    </ul>
</div>
<div class="col-lg-2"></div>