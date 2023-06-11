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
	<table cellSpacing="1" cellPadding="5" width="100%" align="center"
		bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
				<strong>
					订单详细信息
				</strong>
			</td>
		</tr>
		<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">订单编号：</td>
			<td class="ta_01" bgColor="#ffffff">${order.id}</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">所属用户：</td>
			<td class="ta_01" bgColor="#ffffff">${order.user.username }</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">收件人：</td>
			<td class="ta_01" bgColor="#ffffff">${order.receiverName }</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">联系电话：</td>
			<td class="ta_01" bgColor="#ffffff">${order.receiverPhone }</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">送货地址：</td>
			<td class="ta_01" bgColor="#ffffff">${order.receiverAddress}</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">总价：</td>
			<td class="ta_01" bgColor="#ffffff">${order.money }</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">下单时间：</td>
			<td class="ta_01" bgColor="#ffffff" colSpan="3">${order.ordertime}</td>
		</tr>
		<TR>
			<TD class="ta_01" align="center" bgColor="#f5fafe">商品信息</TD>
			<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
					style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
					<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
						<td align="center" width="7%">序号</td>
						<td width="8%" align="center">商品</td>
						<td align="center" width="18%">商品编号</td>
						<td align="center" width="10%">商品名称</td>
						<td align="center" width="10%">商品价格</td>
						<td width="7%" align="center">购买数量</td>
						<td width="7%" align="center">商品类别</td>
						<td width="31%" align="center">商品描述</td>
					</tr>
					<c:forEach items="${orderitem}" var="item" varStatus="vs">
						<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #eeeeee">
							<td align="center" width="7%">${vs.count }</td>
							<td width="8%" align="center">
								<img src="${pageContext.request.contextPath}${item.p.imgurl}" width="50" height="50">
							</td>
							<td align="center" width="18%">${item.p.id }</td>
							<td align="center" width="10%">${item.p.name }</td>
							<td align="center" width="10%">${item.p.price }</td>
							<td width="7%" align="center">${item.buynum }</td>
							<td width="7%" align="center">${item.p.category }</td>
							<td width="31%" align="center">${item.p.description}</td>
						</tr>
					</c:forEach>
				</table>
			</TD>
		</TR>
		<TR>
			<td align="center" colSpan="4" class="sep1"><img
				src="${pageContext.request.contextPath}/admin/images/shim.gif">
			</td>
		</TR>
		<TR>
			<td class="ta_01" style="WIDTH: 100%" align="right" bgColor="#f5fafe" colSpan="4">
				<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
				<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" /> 
				<span id="Label1"></span>
			</td>
		</TR>
	</table>
		</div></div></div>
</body>
</HTML>