<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

//鼠标点击搜索框时执行
    function my_click(obj, myid){
        //点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
        if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
            document.getElementById(myid).value = '';
            obj.style.color='#000';
        }
    }
    //鼠标不聚焦在搜索框时执行
    function my_blur(obj, myid){
        //鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
        if (document.getElementById(myid).value == ''){
            document.getElementById(myid).value = document.getElementById(myid).defaultValue;
            obj.style.color='#999';
        }
    }

    function search(){
        document.getElementById("searchform").submit();
    }
</script>
<div style="background-color: #419641;height: 3px;margin-top: 20px;"></div>
<div class="row" style="background-color: black;height: 50px;">
    <div class="menu">
        <ul class="nav navbar-nav" style="margin-left: 300px" id="allp">
            <li> <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=文学">文学</a></li>
            <li> <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活">生活</a></li>
            <li> <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=计算机">计算机</a></li>
            <li> <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=外语">外语</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=经营">经管</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=励志">励志</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=社科">社科</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=学术">学术</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=少儿">少儿</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=艺术">艺术</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=原版">原版</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=科技">科技</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=考试">考试</a></li>
            <li> <a href="${pageContext.request.contextPath}/ShowProductByPageServlet?category=生活百科">生活百科</a></li>
            <li> <a href="${pageContext.request.contextPath}/ShowProductByPageServlet" style="color:#b4d76d">全部商品</a></li>
<%--            <li><a href="javascript:void(0)" style="color: white">文学</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">生活</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">计算机</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">外语</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">经管</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">励志</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">社科</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">学术</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">少儿</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">艺术</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">原版</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">科技</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">考试</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: white">生活百科</a></li>--%>
<%--            <li><a href="javascript:void(0)" style="color: yellow">全部商品</a></li>--%>
        </ul>
    </div>
</div>

<%--  <img src="" id="mypic " alt="">--%>
<div class="row" style="background-color: orange;margin-bottom: 20px;">
    <div class="col-md-6 col-md-offset-5">
        <div id="divsearch">
            <form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
                <table width="100%" border="0" cellspacing="0">
                    <tr>
                        <td style="text-align:right; padding-right:220px">
                            搜索
                            <input type="text" name="textfield" class="inputtable" id="textfield" value="请输入书名"
                                   onmouseover="this.focus();"
                                   onclick="my_click(this, 'textfield');"
                                   onBlur="my_blur(this, 'textfield');"/>
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/serchbutton.gif" border="0" style="margin-bottom:-4px" onclick="search()"/>
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
