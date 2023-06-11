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
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="#" class="navbar-brand">传智书城-后台管理</a></h1>
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