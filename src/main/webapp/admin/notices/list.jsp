<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/main.css"/>
    <script type="text/javascript" src="/admin/js/libs/modernizr.min.js"></script>
    <script language="javascript" src="/admin/js/public.js"></script>
    <script type="text/javascript">
        function addNotice() {
            window.location.href = "${pageContext.request.contextPath}/admin/notices/add.jsp";
        }

        //添加商品
        <%--function addProduct() {--%>
        <%--	window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";--%>
        <%--}--%>
        //删除商品
        function p_del() {
            var msg = "您确定要删除该商品吗？";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }
        }

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
    </script>
</HEAD>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">传智书城-后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="#">首页</a></li>
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


<div class="sidebar-wrap">
    <div class="sidebar-title">
        <h1>菜单</h1>
    </div>
    <div class="sidebar-content">
        <ul class="sidebar-list">
            <li>
                <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                <ul class="sub-menu">
                    <li><a href="${pageContext.request.contextPath}/ShowProductByPageAdminServlet"><i class="icon-font">&#xe008;</i>商品管理</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/SalesList"><i class="icon-font">&#xe005;</i>销售榜单</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/findOrders"><i class="icon-font">&#xe006;</i>订单管理</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/ListNoticeServlet"><i class="icon-font">&#xe004;</i>公告管理</a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</div>

<div style="display: flex;">
    <div class="main-warp" style="width: 100%;height: 100%">
        <div class="crumb-warp">
            <form id="Form1" name="Form1" action="" method="post">
                <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
                    <tbody>
                    <tr>
                        <td class="ta_01" align="center" bgColor="#afd1f3">
                            <strong>公 告 列 表</strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="ta_01" align="right">
                            <button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add"
                                    onclick="addNotice()">
                                &#28155;&#21152;
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td class="ta_01" align="center" bgColor="#f5fafe">
                            <table cellspacing="0" cellpadding="1" rules="all"
                                   bordercolor="gray" border="1" id="DataGrid1"
                                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                                <tr
                                        style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                                    <td align="center" width="12%">公告编号</td>
                                    <td align="center" width="12%">公告标题</td>
                                    <td align="center" width="24%">公告内容</td>
                                    <td align="center" width="8%">时间</td>
                                    <td width="8%" align="center">编辑</td>
                                    <td width="8%" align="center">删除</td>
                                </tr>
                                <c:forEach items="${notices}" var="n">
                                    <tr onmouseover="this.style.backgroundColor = 'white'"
                                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="23">${n.n_id }</td>
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="18%">${n.title }</td>
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="8%">${n.details }</td>
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="8%">${n.n_time }</td>
                                        <td align="center" style="HEIGHT: 22px" width="7%">
                                            <a href="${pageContext.request.contextPath}/FindByIdNoticeServlet?id=${n.n_id}">
                                                <img src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
                                                     border="0" style="CURSOR: hand">
                                            </a>
                                        </td>
                                        <td align="center" style="HEIGHT: 22px" width="7%">
                                            <a href="${pageContext.request.contextPath}/DeleteNoticeServlet?id=${n.n_id}">
                                                <img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
                                                     width="16" height="16" border="0" style="CURSOR: hand">
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                    </TBODY>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</HTML>