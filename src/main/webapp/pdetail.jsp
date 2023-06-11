<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>书城列表</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
    <script>
        //退出登录
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
</head>

<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="webPath">
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle
								navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span
                            class="icon-bar"></span></button>
                    <a class="navbar-brand" href="index.jsp">BookStore</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/ShowProductByPageServlet">全部商品</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">类别1<strong
                                    class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=文学">文学</a>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活">生活</a>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=计算机">计算机</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=外语">外语</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=经管">经管</a>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=励志">励志</a>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=社科">社科</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">类别2<strong
                                    class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=学科">学术</a>
                                </li>
                                <li>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=少儿">少儿</a>
                                </li>
                                <li>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=艺术">艺术</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=原版">原版</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=科技">科技</a>
                                </li>
                                <li>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=考试">考试</a>
                                </li>
                                <li>
                                </li>
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活百科">生活百科</a>
                                </li>

                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search"
                          action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
                        <div class="form-group">
                            <input type="text" class="form-control" name="textfield" id="textfield"
                                   placeholder="请输入书名"/>
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="">欢迎你:${user.username}</a>

                        </li>
                        <li>
                            <a href="/cart.jsp">购物车</a>
                        </li>
                        <li>
                            <a href="DeleteCurrentUserServlet" onclick="javascript:return confirm_logout()">退出</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多<strong
                                    class="caret"></strong></a>
                            <ul class="dropdown-menu">

                                <li>
                                    <a href="#">帮助中心</a>
                                </li>
                                <li>
                                    <a href="/client/myAccount.jsp">我的账户</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="register.jsp">新用户注册</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </nav>
            <div style="text-align:right; margin:5px 10px 5px 0px">
                <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                ${p.category}
                &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                图书详情
            </div>
        </div>
    </div>


    <div class="row" style="margin-top: 20px;margin-bottom: 20px;">
        <div class="col-lg-5">
         <div class="thumbnail">
                        <img width="250" height="250" src="${p.imgurl}" alt="...">
                        <div class="caption">
                            <h3>${p.name}</h3>
                            <p>${p.description}</p>
                            <p><a href="${pageContext.request.contextPath }/AddCartServlet?id=${p.id}"
                                  class="btn btn-default" role="button">加入购物车</a></p>
                        </div>


         </div>
        </div>
        <img src="images/04.jpg" alt="" height="350px" width="600px">
        <div class="col-lg-2">

        </div>
    </div>


</div>

<div class="row">
    <div class="col-lg-3"></div>
    <div class="col-md-6 col-xs-6 col-sm-6">
        <p style="font-weight: bold">CONTACTUS</p>
        <strong style="color: #9d9d9d">COPYRIGHT 2023◎BookStore All Rights RESERVED.</strong>
    </div>
    <div class="col-lg-3"></div>
</div>
</body>

</html>