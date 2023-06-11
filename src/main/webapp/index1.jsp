<%@ page import="com.itcast.itcaststore.domain.WeekHotProduct" %>
<%@ page import="com.itcast.itcaststore.domain.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tsubasa
  Date: 2022/6/5
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>传智书城--首页</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
    <script>

        function confirm_logout() {
            var msg = "您确定要退出登录吗？";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }

        }

        function my_click(obj, myid) {
            //点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
            if (document.getElementById(myid).value == document.getElementById(myid).defaultValue) {
                document.getElementById(myid).value = '';
                obj.style.color = '#000';
            }
        }

        //鼠标不聚焦在搜索框时执行
        function my_blur(obj, myid) {
            //鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
            if (document.getElementById(myid).value == '') {
                document.getElementById(myid).value = document.getElementById(myid).defaultValue;
                obj.style.color = '#999';
            }
        }

        /**
         * 点击搜索按钮执行的函数
         */
        function search() {
            document.getElementById("searchform").submit();
        }
    </script>
    <style>
        a:focus {
            text-decoration: none
        }

        u
    </style>

</head>
<input type="hidden" value=" ${pageContext.request.contextPath}" id="webPath">
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="index.jsp">首页</a>
                </li>
                <li>
                    <a href="mylogin.jsp">登录</a>
                </li>
                <li class>
                    <a href="register.jsp">新用户注册</a>
                </li>
                <li class>
                    <a href="DeleteCurrentUserServlet " onclick="javascript:return confirm_logout()">退出</a>
                </li>
                <li class="dropdown pull-right">
                    <a href="#">欢迎你:${user.username}</a>

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
                <li class="dropdown pull-right">
                    <a href="/AddCartServlet">购物车</a>

                </li>
                <form class="form-search" style="text-align: right;"
                      action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
                    <input class="input-medium search-query" type="text" name="textfield" id="textfield"
                           value="请输入书名"
                           onclick="my_click(this, 'textfield');"
                           onBlur="my_blur(this, 'textfield');"/>

                    <button type="submit" class="btn">查找</button>
                </form>
            </ul>

            <div class="row">

                <div class="col-lg-2">
                    <div class="span2">
                        <ul class="unstyled">
                            <li>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=文学"
                                       style="color: black"><strong><em>文学</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活"
                                       style="color: black"><strong><em>生活</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=计算机"
                                       style="color: black"> <strong><em>计算机</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=外语"
                                       style="color: black"> <strong><em>外语</em></strong></a>
                                </p>
                                <p>
                                    <a href=${pageContext.request.contextPath}/ShowProductByPageServlet?category=经营"
                                       style="color: black"><strong><em>经营</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=励志"
                                       style="color: black"><strong><em>励志</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=社科"
                                       style="color: black"><strong><em>社科</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=学术"
                                       style="color: black"><strong><em>学术</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=少儿"
                                       style="color: black"><strong><em>少儿</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=艺术"
                                       style="color: black"> <strong><em>艺术</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=原版"
                                       style="color: black"> <strong><em>原版</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=科技"
                                       style="color: black"> <strong><em>科技</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=考试"
                                       style="color: black"> <strong><em>考试</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活百科"
                                       style="color: black"><strong><em>生活百科</em></strong></a>
                                </p>
                                <p>
                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet"
                                       style="color:black"> <strong><em>全部商品</em></strong></a>
                                </p>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" >
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">

                                <img src="${pageContext.request.contextPath}/ad/index_ad1.jpg" alt="..." width="900" height="350">
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/ad/index_ad0.jpg" alt="..." width="900" height="350">
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/ad/index_ad3.jpg" alt="..." width="900" height="350">
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/ad/index_ad4.jpg" alt="..." width="900" height="350">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/ad/index_ad5.jpg" alt="..." width="900" height="350">
                                <div class="carousel-caption">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <div class="alert">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <h4>
                    公告板
                </h4> <strong>${notice.title}：</strong> ${notice.details}
            </div>
            <div class="row">
                <table width="100%" border="0" cellspacing="0">
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}/images/hottitle.gif" width="126" height="29"/>
                        </td>
                    </tr>
                </table>

                <%--               <%--热销展示--%>
                <table width="100%" border="0" cellspacing="0">
                    <tr>

                        <c:forEach items="${pList}" var="p">
                            <td style="width:80px; text-align:center">
                                <img src="${p.product.imgurl}" style="width: 150px"
                                     height="150px" ;/><br/>
                                <a> ${p.product.name}</a><br/>
                                    <%--                                            <a href="${pageContext.request.contextPath}/ShowNoticeServlet?id=${p.product.name}">${pArray.product.name}--%>
                                    <%--                                                <img src="${pageContext.request.contextPath}/${p.product.imgurl}" width="102" height="130" border="0" />--%>
                                    <%--                                            </a>--%>

                                    <%--                                            <a href="${pageContext.request.contextPath}/ShowNoticeServlet?id=${pArray[0]}">${pArray[1]}</a>--%>
                                    <%-- <br />作者:${pArray[2] } --%>
                            </td>
                        </c:forEach>

                    </tr>
                </table>


            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>
</div>
<div class="col-lg-3"></div>

<div class="col-md-6 col-xs-6 col-sm-6">
    <p style="font-weight: bold">CONTACTUS</p>
    <strong style="color: #9d9d9d">COPYRIGHT 2023◎BookStore All Rights RESERVED.</strong>
</div>
<div class="col-lg-3"></div>
</body>

</html>