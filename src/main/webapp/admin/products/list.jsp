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
	    //添加商品
		<%--function addProduct() {--%>
		<%--	window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";--%>
		<%--}--%>
		//删除商品
		function p_del() {   
			var msg = "您确定要删除该商品吗？";   
			if (confirm(msg)==true){   
			return true;   
			}else{   
			return false;   
			}   
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
			<form id="Form1" name="Form1"
				  action="${pageContext.request.contextPath}/findProductByManyCondition"
				  method="post" style="width: auto;height: auto">
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
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品编号</td>
									<td class="ta_01" bgColor="#ffffff">
										<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
									</td>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">类别：</td>
									<td class="ta_01" bgColor="#ffffff">
										<select name="category" id="category">
											<option value="" selected="selected">--选择商品类别--</option>
											<option value="文学">文学</option>
											<option value="生活">生活</option>
											<option value="计算机">计算机</option>
											<option value="外语">外语</option>
											<option value="经营">经营</option>
											<option value="励志">励志</option>
											<option value="社科">社科</option>
											<option value="学术">学术</option>
											<option value="少儿">少儿</option>
											<option value="艺术">艺术</option>
											<option value="原版">原版</option>
											<option value="科技">科技</option>
											<option value="考试">考试</option>
											<option value="生活百科">生活百科</option>
										</select>
									</td>
								</tr>
								<tr>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
									<td class="ta_01" bgColor="#ffffff">
										<input type="text" name="name" size="15" value="" id="Form1_userName" class="bg" />
									</td>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">价格区间(元)：</td>
									<td class="ta_01" bgColor="#ffffff">
										<input type="text" name="minprice" size="10" value="" />
										-
										<input type="text" name="maxprice" size="10" value="" />
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
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商 品 列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<%--						<button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">--%>
							<%--							&#28155;&#21152;--%>
							<%--						</button>--%>
							<button type="button" id="add" name="add" value="&#28155;&#21152;"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
								&#28155;&#21152;
							</button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								   bordercolor="gray" border="1" id="DataGrid1"
								   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
									<td align="center" width="24%">商品编号</td>
									<td align="center" width="18%">商品名称</td>
									<td align="center" width="9%">商品价格</td>
									<td align="center" width="9%">商品数量</td>
									<td width="8%" align="center">商品类别</td>
									<td width="8%" align="center">编辑</td>
									<td width="8%" align="center">删除</td>
								</tr>
								<!--  循环输出所有商品 -->
								<c:forEach items="${bean.ps}" var="p">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${p.id }</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${p.name }</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.price }</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.pnum }</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center">${p.category}</td>
										<td align="center" style="HEIGHT: 22px" width="7%">
											<a href="${pageContext.request.contextPath}/findProductById?id=${p.id}&type=admin">
												<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">
											</a>
										</td>
										<td align="center" style="HEIGHT: 22px" width="7%">
											<a href="${pageContext.request.contextPath}/deleteProduct?id=${p.id}" onclick="javascript:return p_del()">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
													 width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</td>
									</tr>
								</c:forEach>
							</table>
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${bean.currentPage==1}">
										<li class="disabled"><a
												href="#"
												aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
										</li>
									</c:if>
									<%--    上一页--%>
									<c:if test="${bean.currentPage!=1}">
										<li>
											<a href="${pageContext.request.contextPath}/ShowProductByPageAdminServlet?currentPage=${bean.currentPage-1}"
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
												<a href="${pageContext.request.contextPath}/ShowProductByPageAdminServlet?currentPage=${pageNum}">${pageNum}</a>
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
											<a href="${pageContext.request.contextPath}/ShowProductByPageAdminServlet?currentPage=${bean.currentPage+1}"
											   aria-label="Previous"><span aria-hidden="true">&raquo;</span></a>
										</li>
									</c:if>
								</ul>
							</nav>
						</td>
					</tr>
					</TBODY>
				</table>
			</form>

		</div>
	</div>
</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">

					<form id="userAction_save_do" name="Form1"
						  action="${pageContext.request.contextPath}/addProduct" method="post"
						  enctype="multipart/form-data">
						&nbsp;
						<table cellSpacing="1" cellPadding="5" width="100%" align="center"
							   bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
							<tr>
								<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
									height="26"><strong><STRONG>添加商品</STRONG> </strong>
								</td>
							</tr>
							<tr>
								<td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text" name="name" class="bg" /></td>
								<td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="price" class="bg" />
								</td>
							</tr>
							<tr>
								<td align="center" bgColor="#f5fafe" class="ta_01">商品数量：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="pnum" class="bg" />
								</td>
								<td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
								<td class="ta_01" bgColor="#ffffff">
									<select name="category" id="category">
										<option value="" selected="selected">--选择商品类加--</option>
										<option value="文学">文学</option>
										<option value="生活">生活</option>
										<option value="计算机">计算机</option>
										<option value="外语">外语</option>
										<option value="经营">经营</option>
										<option value="励志">励志</option>
										<option value="社科">社科</option>
										<option value="学术">学术</option>
										<option value="少儿">少儿</option>
										<option value="艺术">艺术</option>
										<option value="原版">原版</option>
										<option value="科技">科技</option>
										<option value="考试">考试</option>
										<option value="生活百科">生活百科</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="center" bgColor="#f5fafe" class="ta_01">商品图片：</td>
								<td class="ta_01" bgColor="#ffffff" colspan="3">
									<input type="file" name="upload" size="30" value="" />
								</td>
							</tr>
							<TR>
								<TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
								<TD class="ta_01" bgColor="#ffffff" colSpan="3">
									<textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
								</TD>
							</TR>

							<tr>
								<td class="ta_01" style="WIDTH: 100%" align="center"
									bgColor="#f5fafe" colSpan="4">
									<input type="submit" class="button_ok" value="确定">
									<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
									<input type="reset" value="重置" class="button_cancel">
									<FONT face="宋体">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</FONT>
									<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
									<span id="Label1"></span>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

</HTML>