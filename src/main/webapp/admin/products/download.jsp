<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="${pageContext.request.contextPath}/ShowProductByPageAdminServlet"><i class="icon-font">&#xe008;</i>商品管理</a></li>
					<li><a href="${pageContext.request.contextPath}/SalesList"><i class="icon-font">&#xe005;</i>销售榜单</a></li>
					<li><a href="${pageContext.request.contextPath}/findOrders"><i class="icon-font">&#xe006;</i>订单管理</a></li>
					<li><a href="${pageContext.request.contextPath}/ListNoticeServlet"><i class="icon-font">&#xe004;</i>公告管理</a></li>
				</ul>
			</li>

		</ul>
	</div>
</div>
<div style="display: flex;">
	<div class="main-warp" style="width: 100%;height: 100%">
		<div class="crumb-warp">
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/download" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<tbody>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>查 询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									请输入年份
								</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="year" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									请选择月份
								</td>
								<td class="ta_01" bgColor="#ffffff">
									<select name="month" id="month">
										<option value="0">--选择月份--</option>
										<option value="1">一月</option>
										<option value="2">二月</option>
										<option value="3">三月</option>
										<option value="4">四月</option>
										<option value="5">五月</option>
										<option value="6">六月</option>
										<option value="7">七月</option>
										<option value="8">八月</option>
										<option value="9">九月</option>
										<option value="10">十月</option>
										<option value="11">十一月</option>
										<option value="12">十二月</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01">
								</td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br /><br />
								</td>
								<td align="center" bgColor="#ffffff" class="ta_01">
									<input type="submit" id="search" name="search" value="下载" class="button_view"> 
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="重置" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
			</div>
		</div>
	</div>
</body>
</html>