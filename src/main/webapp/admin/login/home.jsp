<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.TimeZone" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>传智书城-后台管理</title>
    <link rel="stylesheet" type="text/css" href="/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/main.css"/>
    <script type="text/javascript" src="/admin/js/libs/modernizr.min.js"></script>
    <script type="text/javascript">
        function exitSys() {
            var flag = window.confirm("确认退出系统吗?");
            if (flag) {
// window.top.open('', '_parent', '');
// window.top.close();
                window.parent.location.href = "../../mylogin.jsp";
            }
//如果你使用的是firefox浏览器必须要做以下设置
//1、在地址栏输入about:config然后回车，警告确认
//2、在过滤器中输入”dom.allow_scripts_to_close_windows“，双击即可将此值设为true 即可完成了

        }

        function updateTime() {
            var date = new Date(); // 获取本地时间
            var utc = date.getTime() + (date.getTimezoneOffset() * 60000); // 计算UTC时间
            var beijingTime = new Date(utc + (3600000 * 8)); // 计算北京时间
            var span = document.getElementById("beijing-time"); // 获取span元素
            span.innerHTML = beijingTime.toLocaleString(); // 将北京时间添加到span中
        }

        // 每秒钟更新一次时间
        setInterval(updateTime, 1000);

    </script>


</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.jsp" class="navbar-brand">传智书城-后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.jsp">首页</a></li>
                <li><a href="/getRecentNotice" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="javascript:void(0)" onclick="exitSys()">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/ShowProductByPageAdminServlet"><i
                                class="icon-font">&#xe008;</i>商品管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/SalesList"><i class="icon-font">&#xe005;</i>销售榜单</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/findOrders"><i class="icon-font">&#xe006;</i>订单管理</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/ListNoticeServlet"><i
                                class="icon-font">&#xe004;</i>公告管理</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>欢迎使用传智书城后台管理 用户:${user.username}</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="/admin/notices/add.jsp"><i class="icon-font">&#xe001;</i>新增公告</a>
                    <a href="/findOrders"><i class="icon-font">&#xe005;</i>查找订单</a>
                    <a href="/ShowProductByPageAdminServlet"><i class="icon-font">&#xe048;</i>管理商品</a>
                    <a href="/SalesList"><i class="icon-font">&#xe041;</i>销售榜单</a>
                </div>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>欢迎你：</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">操作系统：</label><span class="res-info">WINNT</span>
                    </li>
                    <li>
                        <label class="res-lab">运行环境：</label><span class="res-info">Apache Tomcat</span>
                    </li>
                    <li>
                        <label class="res-lab">运行方式：</label><span class="res-info">apache Tomcat</span>
                    </li>
                    <li>
                        <label class="res-lab">上传附件限制：</label><span class="res-info">10M</span>
                    </li>
                    <li>
                        <label class="res-lab">当前北京时间：</label><span id="beijing-time" class="res-info"></span>
                    </li>
                    <li>
                        <label class="res-lab">服务器域名/IP：</label><span
                            class="res-info">localhost [ 127.0.0.1 ]</span>
                    </li>
                    <li>
                        <label class="res-lab">Host：</label><span class="res-info">127.0.0.1</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>使用帮助</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">作者</label><span class="res-info"><a href="XXX/"
                                                                                     target="_blank">Tsubasa</a></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>