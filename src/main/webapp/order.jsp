<%--
  Created by IntelliJ IDEA.
  User: Tsubasa
  Date: 2022/6/2
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <title>电子书城</title>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
        <script>
            var receiverAddressObj;
            var receiverNameObj;
            var receiverPhoneObj;

            window.onload = function() {	// 页面加载之后, 获取页面中的对象
                receiverAddressObj = document.getElementById("receiverAddress");
                receiverNameObj = document.getElementById("receiverName");
                receiverPhoneObj = document.getElementById("receiverPhone");
            };

            function checkOnSubmit() {			// 验证整个表单
                var receiverAddress = checkReceiverAddress();
                var receiverName = checkReceiverName();
                var receiverPhone = checkReceiverPhone();
                if(receiverAddress && receiverName && receiverPhone){
                    document.getElementById("orderForm").submit();
                }else{
                    return "";
                }
            }

            function checkReceiverAddress() {			// 验证收获地址
                var value =receiverAddressObj.value;
                var msg = "";
                if (!value)
                    msg = "收获地址必须填写";
                receiverAddressMsg.innerHTML = msg;
                receiverAddressObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
                return msg == "";
            }

            function checkReceiverName() {		// 验证收货人
                var value =receiverNameObj.value;
                var msg = "";
                if (!value)
                    msg = "收获人必须填写";
                receiverNameMsg.innerHTML = msg;
                receiverNameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
                return msg == "";
            }

            function checkReceiverPhone() {		// 验证联系方式
                var regex =/^1[3,5,8]\d{9}$/;	//以13、15、18开头的手机号
                var value =receiverPhoneObj.value;
                var msg = "";
                if (!value)
                    msg = "联系方式必须填写";
                else if (!regex.test(value))
                    msg = "手机号码不合法：";
                receiverPhoneMsg.innerHTML = msg;
                receiverPhoneObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
                return msg == "";
            }

        </script>
    <style>
        /* CSS Document */
        .main {
            margin: 0px 0px 30px 0px;
            padding: 0px 0px 0px 0px;
            background: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 150%;
            color: #000000; /*#666666*/
            text-align: center;
            vertical-align: top;
        }

        a {
            font-size: 12px;
            color: #0066FF; /*#1E33F7*/
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
            color: #0066FF;
        }

        a:hover {
            text-decoration: none;
            color: #990099; /*颜色变换*/
        }

        a:active {
            text-decoration: none;
            color: #0066FF;
        }

        td {
            vertical-align: top;
            text-align: left;
            font-size: 12px;
        }

        hr {
            color: #CCCCCC;
            height: 1px;
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
            overflow: hidden;
        }

        h1 {
            font-size: 14px;
            color: #000000;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
            display: inline;
        }

        .bookname {
            font-size: 16px;
            color: #194105;
            text-align: left;
            margin-bottom: 5px;
            display: inline;
        }

        #divhead {
            width: 100%;
        }

        .headtable {
            width: 100%;
        }

        .headtable td {
            padding: 10px 50px 25px 135px;
        }

        #divmenu {
            width: 100%;
            border-top-width: 4px;
            border-top-style: solid;
            border-top-color: #b4d76d;
            background-color: #000000;
            text-align: center;
            padding: 10px 0px 10px 0px;
            font-size: 14px;
        }

        #divmenu a {
            font-size: 14px;
            color: #FFFFFF; /*#1E33F7*/
            font-weight: bold;
            padding: 10px 10px 10px 10px;
        }

        #divmenu a:link {
            text-decoration: none;
            font-weight: bold;
        }

        #divmenu a:visited {
            text-decoration: none;
            color: #FFFFFF;
            font-weight: bold;
        }

        #divmenu a:hover {
            text-decoration: none;
            color: #999999; /*颜色变换*/
            font-weight: bold;
        }

        #divmenu a:active {
            text-decoration: none;
            color: #FFFFFF;
            font-weight: bold;
        }

        #divsearch {
            width: 100%;
            background-color: #f59f1d;
            text-align: center;
            padding: 5px 0px 5px 0px;
            color: #FFFFFF;
            font-weight: bold;
        }

        #divad {
            width: 900px;
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }

        #divcontent {
            width: 900px;
            background-color: #FCFDEF;
            border: 1px solid #EEEDDB;
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }

        #divpagecontent {
            width: 900px;
            margin-top: 10px;
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }

        .listtitle {
            padding: 5px 0px 5px 5px;
            border-bottom-width: 2px;
            border-bottom-style: solid;
            border-bottom-color: #CCCCCC;
            font-size: 14px;
            font-weight: bold;
            color: #1C3F09;
        }

        .listtd {
            padding: 5px 0px 5px 30px;
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: #CCCCCC;
        }

        .listcontent {
            background-color: #FCFDEF;
            border: 1px solid #CCCCCC;
            margin-left: 5px;
            width: 99%;
        }

        .listcontent td {
            padding: 20px;
        }

        .infocontent {
            background-color: #FCFDEF;
            border: 1px solid #CCCCCC;
            margin-left: 5px;
            width: 99%;
        }

        .infocontent td {
            padding: 5px;
        }

        .booklist {
            width: 100%;
            margin: 0px;
            padding: 0px;
        }

        .booklist td {
            /* text-align: center; */
            width: 25%;
            margin: 0px;
            padding: 10px 0 10px 40px;
        }

        .divbookpic {
            width: 131px;
            height: 145px;
            border: 1px solid #CCCCCC;
            background-color: #FFFFFF;
            margin-bottom: 8px;
            overflow: hidden;
            display: table-cell;
            position: relative;
            text-align: center;
            vertical-align: middle;
        }

        .divbookpic img {
            position: static;
            position: relative;
            top: 5%;
        }

        .divbookcover {
            width: 300px;
            height: 300px;
            border: 3px solid #F3F2DE;
            background-color: #FFFFFF;
            margin: 8px;
            overflow: hidden;
            position: relative;
            display: table-cell;
            text-align: center;
            vertical-align: middle;
        }

        .divbookcover img {
            position: static;
            position: relative;
            top: 5%;
            padding-left: 20px;
            padding-right: 20px;
        }

        .divlisttitle {
            line-height: 120%;
            text-align: left;
        }

        #divfoot {
            width: 100%;
            clear: both;
            background-color: #efefef;
            margin-top: 15px;
        }

        .ctl {
            width: 490px;
            margin-top: 2px;
            margin-left: 2px;
            table-layout: fixed;
        }

        .ctl td {
            text-align: left;
            /* 	text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap; */
            padding: 3px;
        }

        .inputtable {
            width: 130px;
            height: 18px;
            border: 1px solid #999999;
        }

        .inputbutton {
            color: #000000;
            background-color: #FFFFFF;
            padding: 1px;
            border: 1px solid #999999;
        }

        /*分页*/
        .pagination {
            padding: 5px;
            width: 790px;
            margin: 5px auto;
            text-align: center;
        }

        .pagination ul {
            /* width:270px; */
            width: 300px;
            margin: 5px auto;
            padding: 5px;
            font-size: 12px;
        }

        .pagination li {
            list-style-type: none;
            float: left;
            padding: 1px;
            margin: 1px;
        }

        .pagination a, .pagination a:visited {
            padding: 5px;
            border: 1px solid #9aafe5;
            text-decoration: none;
            color: #2e6ab1;
        }


        .pagination li.currentpage {
            font-weight: bold;
            padding: 5px;
            border: 1px solid navy;
            background-color: #2e6ab1;
            color: #FFF;
        }

        .disablepage_a {
            display: block;
            width: 75px;
            height: 15px;
        }

        .disablepage_a:link, .disablepage_a:visited {
        !important;
            padding: 0;
            border: 0;
        }

        .disablepage_a:hover {
        !important;
            padding: 0;
            border: 0;
            background: none;
        }

        .pagination li.disablepage_p {
            width: 75px;
            height: 15px;
            padding: 5px;
            color: #929292;
            background: url(./images/previous_page.png) no-repeat center center;
        }

        .pagination li.disablepage_p2 {
            width: 75px;
            height: 15px;
            padding: 5px;
            color: #929292;
            background: url(./images/previous_page2.png) no-repeat center center;
        }

        .pagination li.disablepage_n {
            width: 75px;
            padding: 5px;
            color: #929292;
            background: url(./images/next_page.png) no-repeat center center;
        }

        .pagination li.disablepage_n2 {
            width: 75px;
            height: 15px;
            padding: 5px;
            color: #929292;
            background: url(./images/next_page2.png) no-repeat center center;
        }

        .pagination li.nextpage {
            font-weight: bold;
            padding: 5px;
        }

        /*分页*/
        .upline {
            border-bottom-width: 1px;
            border-bottom-style: dashed;
            border-bottom-color: #B0BEC7;
            padding-top: 5px;
            padding-bottom: 5px;
            margin: 20px;
        }

        .textinput {
            margin-left: 10px;
            font-size: 12px;
            width: 150px;
            height: 18px;
            border: 1px solid #A4B5BD;
        }

        .textarea {
            margin-left: 10px;
            font-size: 12px;
            width: 350px;
            height: 75px;
            border: 1px solid #A4B5BD;
        }

        #logindiv {
            background-image: url(./images/loginbg.gif);
            width: 305px;
            height: 361px;
            background-repeat: no-repeat;
            margin: 20px;
        }

        .carttable {
            border: 1px solid #CCCCCC;
            width: 100%;
            background-color: #E1FFE1;
        }

        .tableopen {
            text-align: center;
        }

        .tableopentd01 {
            text-align: center;
            border: 1px solid #FFFFFF;
        + padding: 3 px;
            color: #FFFFFF;
        }

        .tableopentd02 {
            text-align: center;
            padding: 3px;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: none;
            border-top-color: #C5E0E2;
            border-right-color: #C5E0E2;
            border-bottom-color: #C5E0E2;
            border-left-color: #C5E0E2;
        }

        .tableopentd03 {
            text-align: center;
            padding: 3px;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: solid;
            border-left-style: none;
            border-top-color: #C5E0E2;
            border-right-color: #C5E0E2;
            border-bottom-color: #C5E0E2;
            border-left-color: #C5E0E2;
        }

        .searchtable {
            width: 100%;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #CCCCCC;
        }
    </style>
</head>
<body class="main">

<jsp:include page="head.jsp"/>
<jsp:include page="menu_search.jsp"/>
<div class="row">
    <div class="col-md-8 col-md-offset-2"><br>
        <div id="divpagecontent">
            <table width="100%" border="0" cellspacing="0">
                <tr>
                    <td>
                        <div style="text-align:right; margin:5px 10px 5px 0px">
                            <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/cart.jsp">&nbsp;购物车</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
                        </div>
                        <form id="orderForm" action="${pageContext.request.contextPath}/CreateOrderServlet"
                              method="post">
                            <table cellspacing="0" class="infocontent">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td><img src="images/buy2.gif" width="635" height="38"/>
                                                    <p>你好，${user.username}！欢迎您来到网上书城结算中心</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table cellspacing="1" class="carttable">
                                                        <tr>
                                                            <td width="10%">序号</td>
                                                            <td width="40%">商品名称</td>
                                                            <td width="10%">价格</td>
                                                            <td width="10%">类别</td>
                                                            <td width="10%">数量</td>
                                                            <td width="10%">小计</td>
                                                        </tr>
                                                    </table>
                                                    <c:set value="0" var="totalPrice"/>
                                                    <c:forEach items="${cart}" var="entry" varStatus="vs">
                                                        <table width="100%" border="0" cellspacing="0">
                                                            <tr>
                                                                <td width="10%">${vs.count}</td>
                                                                <td width="40%">${entry.key.name }</td>
                                                                <td width="10%">${entry.key.price }</td>
                                                                <td width="10%">${entry.key.category}</td>
                                                                <td width="10%">
                                                                    <input name="text" type="text"
                                                                           value="${entry.value}" style="width:20px"
                                                                           readonly="readonly"/>
                                                                </td>
                                                                <td width="10%">${entry.key.price*entry.value}</td>
                                                            </tr>
                                                        </table>
                                                        <c:set var="totalPrice"
                                                               value="${totalPrice+entry.key.price*entry.value}"/>
                                                    </c:forEach>

                                                    <table cellspacing="1" class="carttable">
                                                        <tr>
                                                            <td style="text-align:right; padding-right:40px;"><font
                                                                    style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}元</font>
                                                                <input type="hidden" name="money" value="${totalPrice}">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <p>
                                                        收货地址：<input id="receiverAddress" name="receiverAddress"
                                                                    type="text" value="" style="width:350px"
                                                                    onkeyup="checkReceiverAddress();"/>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <span id="receiverAddressMsg"></span>
                                                        <br/>
                                                        收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName"
                                                                                           name="receiverName"
                                                                                           type="text"
                                                                                           value="${user.username}"
                                                                                           style="width:150px"
                                                                                           onkeyup="checkReceiverName();"/>
                                                        <span id="receiverNameMsg"></span>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <br/>
                                                        联系方式：<input type="text" id="receiverPhone" name="receiverPhone"
                                                                    value="${user.telephone}" style="width:150px"
                                                                    onkeyup="checkReceiverPhone();"/>
                                                        <span id="receiverPhoneMsg"></span>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </p>
                                                    <hr/>
                                                    <button type="submit">
                                                        <p style="text-align:right">
                                                            <img src="images/gif53_029.gif" width="204" height="51"
                                                                 border="0" onclick="checkOnSubmit();"/>
                                                        </p>
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>
