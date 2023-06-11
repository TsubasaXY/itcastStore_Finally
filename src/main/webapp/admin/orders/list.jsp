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
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/findOrderByManyCondition" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
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
									订单编号</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									收件人：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="receiverName" size="15" value="" id="Form1_userName" class="bg" />
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;
									</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>订 单 列 表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right"></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="20%">订单编号</td>
								<td align="center" width="10%">收件人</td>
								<td align="center" width="15%">地址</td>
								<td align="center" width="10%">联系电话</td>
								<td width="11%" align="center">总价</td>
								<td width="8%" align="center">所属用户</td>
								<td width="10%" align="center">订单状态</td>
								<td width="7%" align="center">查看</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<c:forEach items="${orders}" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${order.receiverName}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">${order.receiverAddress }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${order.receiverPhone }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${order.money}</td>
									<td width="8%" align="center">${order.user.username}</td>
									<td width="10%" align="center">${order.paystate==0?"未支付":"已支付"}</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}&type=admin">
											<img src="${pageContext.request.contextPath}/admin/images/button_view.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
                                        <!--  已支付，弹出提示框由操作人确认 -->
									    <c:if test="${order.paystate!=0 }">
											<a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=admin" onclick="javascript:return o_del()">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if> 
										<!--  未支付 ，不能删除-->
										<c:if test="${order.paystate==0 }">
											<a href="javascript:alert('不能删除未支付订单')">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
		</div></div></div>
</body>
</HTML>