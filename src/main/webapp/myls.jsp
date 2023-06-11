<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>
    <!-- Bootstrap -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
<%--    <script>--%>
<%--        var lspath;--%>
<%--        var category;--%>
<%--        var url;--%>
<%--        // var pnum;--%>
<%--        $(function () {--%>

<%--            //详情页--%>
<%--            $("#mycontent").on("click", ".mybook", function () {--%>
<%--                var bookid = $(this).attr("bookid");--%>
<%--                location.href = lspath + "/ShowProductByIdServlet?id=" + bookid;--%>
<%--                // url = lspath + "/ShowProductByIdServlet";--%>
<%--                $.get(url, {"id": bookid}, function (data) {--%>
<%--                    $("#mycontent").empty();--%>
<%--                    $(".pagination").empty();--%>
<%--                    var detail = '<div class="row detail">' +--%>
<%--                        '<div class="col-sm-6 col-md-4">' +--%>
<%--                        '<div id="addC" class="thumbnail pid" kk="' + data.id + '">' +--%>
<%--                        '<img src="' + lspath + '/' + data.imgurl + '" alt=""/>'--%>
<%--                        +--%>
<%--                        '<h1>' + data.name + '</h1> ' +--%>
<%--                        '<h2>价格' + data.price + '元</h2> ' +--%>
<%--                        '<p>' + data.description + '</p> ' +--%>
<%--                        '<p><a href="#" class="btn btn-primary" role="button">加入购物车</a>' +--%>
<%--                        '</p> </div></div></div></div>';--%>
<%--                    $("#mycontent").append(detail);--%>

<%--                });--%>
<%--            });--%>
<%--        });--%>

<%--    </script>--%>
</head>

<body>
<header>
    <jsp:include page="head.jsp"></jsp:include>

    <jsp:include page="menu_search.jsp"></jsp:include>

</header>

<div class="row">

    <div class="col-md-8 col-md-offset-2"><br>
        <div class="row" id="mycontent">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">

                        <img src="ad/index_ad1.jpg" alt="..." width="900" height="335">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="ad/index_ad0.jpg" alt="..." width="900" height="335">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="ad/index_ad3.jpg" alt="..." width="900" height="335">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="ad/index_ad4.jpg" alt="..." width="900" height="335">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="ad/index_ad5.jpg" alt="..." width="900" height="335">
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>

            </div>

            <div class="row" style="background-color: #fcf8e3;margin-top: 20px;margin-bottom: 20px;">
                <div class="col-sm-6">
                    <img src="images/billboard.gif" alt="">
                    <p style="font-size: small">尊敬的网上书城用户：<br>
                        为了让大家有更好的购物体验，3月25日起，当日达业务关小黑屋回炉升级！具体开放时间请留意公告，感谢大家的支持与理解，祝大家购物愉快！<br>3月23日 <br>
                        传智播客网上书城系统管理部</p>
                </div>
                <div class="col-sm-4 col-sm-offset-2">
                    <div class="row"><img src="images/hottitle.gif" alt=""></div>
                    <div class="row">
                        <a href=""><img src="bookcover/105.jpg" alt="" style="height: 130px;margin-right: 30px;"></a>
                        <a href=""><img src="bookcover/106.jpg" alt="" style="height: 130px;"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<div class="row" style="text-align: center">

    <nav aria-label="Page navigation">
        <ul class="pagination">

        </ul>
    </nav>
</div>
<jsp:include page="foot.jsp"></jsp:include>


</body>
</html>
