<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>电子书城</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
    <script type="text/javascript">
        //删除订单
        function o_del() {
            var msg = "您确定要删除该订单吗？";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }
        }
    </script>
    <%--	<style>--%>
    <%--		.main{background-image: url(../img/background.png);background-attachment: fixed; }--%>
    <%--		.main img {--%>
    <%--			opacity: 0.9; /* 设置图片的不透明度为50% */--%>
    <%--		}--%>
    <%--	</style>--%>
</head>
<body class="main"
      style="background-image: url(../img/background.png);background-attachment: fixed; background-imageopacity: 0.5;">

<!-- 使用了自定义标签 -->
<p:user/>
<jsp:include page="../head.jsp"/>

<div id="divpagecontent">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td width="25%">
                <table width="100%" border="0" cellspacing="0" style="margin-top:30px">
                    <tr>
                        <td class="listtitle">我的帐户</td>
                    </tr>
                    <tr>
                        <td class="listtd">
                            <img src="${pageContext.request.contextPath }/images/icon1.png" width="15" height="10"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath }/client/modifyuserinfo.jsp">用户信息修改</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="listtd">
                            <img src="${pageContext.request.contextPath }/images/icon2.png" width="15" height="10"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/findOrderByUser">订单查询</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="listtd">
                            <img src="${pageContext.request.contextPath }/images/icon3.png" width="15" height="10"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/logout">用户退出</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;我的帐户</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                    订单查询
                </div>
                <table cellspacing="0">
                    <tr>
                        <td style="padding:20px"><p><b>我的订单</b></p>
                            <p>
                                共有<font style="color:#FF0000">${orders.size()}</font>订单
                            </p>
                            <table class="table table-hover">
                                <tr>
                                    <td bgcolor="#A3E6DF">订单号</td>
                                    <td bgcolor="#A3D7E6">收件人</td>
                                    <td bgcolor="#A3CCE6">订单时间</td>
                                    <td bgcolor="#A3B6E6">状态</td>
                                    <td bgcolor="#A3E2E6">操作</td>
                                </tr>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td class="tableopentd02">${order.id}</td>
                                        <td class="tableopentd02">${order.receiverName }</td>
                                        <td class="tableopentd02">${order.ordertime}</td>
                                        <td class="tableopentd02">${order.paystate==0?"未支付":"已支付"}</td>
                                        <td class="tableopentd03">
                                            <a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}">查看</a>&nbsp;&nbsp;
                                            <c:if test="${order.paystate==0 }">
                                                <a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}"
                                                   onclick="javascript:return o_del()">刪除</a>
                                            </c:if>
                                            <c:if test="${order.paystate!=0 }">
                                                <a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=client"
                                                   onclick="javascript:return o_del()">刪除</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<%@ include file="../foot.jsp" %>
</body>
</html>
