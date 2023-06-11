<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>书城列表</title>
<%--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>

<%--    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
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
<header>
    <input type="hidden" value="${pageContext.request.contextPath}" id="webPath">
    <div class="container" style="height:80px ">
        <div class="row">
            <div class="col-sm-4 col-xs-4"><a href="${pageContext.request.contextPath}/index.jsp"><img
                    src="images/logo.png" alt=""></a></div>
            <div class="col-sm-4 col-lg-offset-4 col-xs-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
                <img src="images/cart.gif" alt="">
                <a href="#">欢迎你:${user.username}</a>
                <a href="cart.jsp" style="border-right: 2px solid white">购物车</a>|
                <a href="" style="border-right: 2px solid white">帮助中心</a>|
                <a href="" style="border-right: 2px solid white">我的账户</a>|
                <a href="">新用户注册 </a>
                <a href="DeleteCurrentUserServlet" onclick="javascript:return confirm_logout()">退出</a>
            </div>
        </div>
    </div>
    <!--   -->
    <div style="background-color: #419641;height: 3px;margin-top: 20px;"></div>
    <div class="row" style="background-color: black;height: 50px;">
        <div class="menu">
            <ul class="nav navbar-nav" style="margin-left: 300px" id="allp">
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=文学">文学</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活">生活</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=计算机">计算机</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=外语">外语</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=经营">经管</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=励志">励志</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=社科">社科</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=学术">学术</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=少儿">少儿</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=艺术">艺术</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=原版">原版</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=科技">科技</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=考试">考试</a></li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活百科">生活百科</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet"
                       style="color:#b4d76d">全部商品</a></li>
            </ul>
        </div>
    </div>


    <div class="row" style="background-color: orange;margin-bottom: 20px;">
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


</header>


<div class="container row-fluid">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">
        <table>
            <tr>
                <td>
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${bean.category}
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                        图书列表
                    </div>
                    <table cellspacing="0" class="listcontent">
                        <tr>


                            <td>
                                <h1>商品目录</h1>


                                <hr/>
                                <h2>${bean.category}</h2>&nbsp;&nbsp;&nbsp;&nbsp;共${bean.totalCount}种商品
                                <hr/>
                                <div style="margin-top:20px; margin-bottom:5px">
                                    <img src="images/productlist.gif" width="100%" height="38"/>
                                </div>
                                <table class="booklist">
                                    <tr>

                                        <c:forEach items="${bean.ps}" var="p" varStatus="vs">

                                            <td style="margin:500px">
                                                <div class="divbookpic">
                                                    <p>
                                                        <a href="${pageContext.request.contextPath}/ShowProductByIdServlet?id=${p.id}">
                                                            <img src="${pageContext.request.contextPath}${p.imgurl}"
                                                                 width="115" height="129" border="0"/>
                                                        </a>
                                                    </p>
                                                </div>
                                                <div class="divlisttitle">
                                                    <a href="${pageContext.request.contextPath}/ShowProductByIdServlet?id=${p.id}">书名： ${p.name}<br/>售价：￥${p.price}
                                                    </a>
                                                </div>
                                            </td>
                                        </c:forEach>
                                    </tr>
                                </table>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <c:if test="${bean.currentPage==1}">
                                            <li class="disabled"><a
                                                    href="#"
                                                    aria-label="Previous"><span
                                                    aria-hidden="true">&laquo;</span></a>
                                            </li>
                                        </c:if>
                                        <%--    上一页--%>
                                        <c:if test="${bean.currentPage!=1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?currentPage=${bean.currentPage-1}&category=${bean.category}"
                                                   aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${bean.totalPage}" var="pageNum">
                                            <c:if test="${bean.currentPage==pageNum}">
                                                <li class="active">
                                                    <a>${pageNum}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageNum!=bean.currentPage}">

                                                <li>
                                                    <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?currentPage=${pageNum}&category=${bean.category}">${pageNum}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${bean.currentPage==bean.totalPage||bean.totalPage==0}">
                                            <li class="disabled"><a
                                                    href="#" aria-label="Previous"><span
                                                    aria-hidden="true">&raquo;</span></a>
                                            </li>
                                        </c:if>
                                        <c:if test="${bean.currentPage!=bean.totalPage&&bean.totalPage!=0}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?currentPage=${bean.currentPage+1}&category=${bean.category}"
                                                   aria-label="Previous"><span aria-hidden="true">&raquo;</span></a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="col-lg-2"></div>

</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
