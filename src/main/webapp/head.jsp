<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<script type="text/javascript">--%>
<%--  //退出确认框--%>
<%--  function confirm_logout() {--%>
<%--    var msg = "您确定要退出登录吗？";--%>
<%--    if (confirm(msg)==true){--%>
<%--      return true;--%>
<%--    }else{--%>
<%--      return false;--%>
<%--    }--%>
<%--  }--%>
<%--</script>--%>
<%--<input type="hidden" value=" ${pageContext.request.contextPath}" id="webPath">--%>
<%--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
<%--<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>--%>
<%--<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">--%>
<%--<div class="container" style="height:80px ">--%>
<%--  <div class="row">--%>
<%--    <div class="col-sm-4 col-xs-4"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""></a></div>--%>
<%--    <div class="col-sm-4 col-lg-offset-4 col-xs-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">--%>
<%--      <img src="${pageContext.request.contextPath}/images/cart.gif" alt="">--%>

<%--      <a href="#">欢迎你:${user.username}</a>--%>
<%--      <a href="" style="border-right: 2px solid white">购物车</a>|--%>
<%--      <a href="" style="border-right: 2px solid white">帮助中心</a>|--%>
<%--      <a href="myAccount.jsp" style="border-right: 2px solid white">我的账户</a>|--%>
<%--      <a href="register.jsp">新用户注册 </a>--%>

<%--      <a href="../DeleteCurrentUserServlet" onclick="javascript:return confirm_logout()">退出</a>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
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
    //当商品数量发生变化时触发该方法
    function changeProductNum(count, totalCount, id) {
      count = parseInt(count);
      totalCount = parseInt(totalCount);
      //如果数量为0，判断是否要删除商品
      if (count == 0) {
        var flag = window.confirm("确认删除商品吗?");

        if (!flag) {
          count = 1;
        }
      }
      if (count > totalCount) {
        alert("已达到商品最大购买量");
        count = totalCount;
      }
      location.href = "${pageContext.request.contextPath}/ChangeCartServlet?id="
              + id + "&count=" + count;
    }
    //删除购物车中的商品
    function cart_del() {
      var msg = "您确定要删除该商品吗？";
      if (confirm(msg)==true){
        return true;
      }else{
        return false;
      }
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
                                        navigation</span><span class="icon-bar"></span><span
                  class="icon-bar"></span><span class="icon-bar"></span></button>
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
              <a href="DeleteCurrentUserServlet"
                 onclick="javascript:return confirm_logout()">退出</a>
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
    </div>
  </div></div>
