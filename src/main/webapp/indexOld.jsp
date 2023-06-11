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
  <script>
    var lspath;
    var category;
    var url;
    var pnum;
    $(function () {
      lspath = $("#webPath").val();
      url = lspath + "/ShowProductByPageServlet";//从站点目录开始的servlet
      $("#allp a").click(function () {//导航条
        $("#mycontent").empty();
        category = $(this).html();//获取所点击的分类名称
        ajaxPage(url, 1, category);
      });
      $(".pagination").on("click", ".myPage", function () {
        currentPage = $(this).attr("page");
        ajaxPage(url, currentPage, category);
      });

      //详情页
      $("#mycontent").on("click", ".mybook", function () {
        var bookid = $(this).attr("bookid");
        // location.href = lspath + "/ShowProductDetail?id=" + bookid;
        url = lspath + "/ShowProductByIdServlet";
        $.get(url, {"id": bookid}, function (data) {
          $("#mycontent").empty();
          $(".pagination").empty();
          var detail = '<div class="row detail">' +
                  '<div class="col-sm-6 col-md-4">' +
                  '<div id="addC" class="thumbnail pid" kk="' + data.id + '">' +
                  '<img src="' + lspath + '/' + data.imgurl + '" alt=""/>'
                  +
                  '<h1>' + data.name + '</h1> ' +
                  '<h2>价格' + data.price + '元</h2> ' +
                  '<p>' + data.description + '</p> ' +
                  '<p><a href="#" class="btn btn-primary" role="button">加入购物车</a>' +
                  '</p> </div></div></div></div>';
          $("#mycontent").append(detail);

        });

      });


      $("#mycontent").on("click", ".detail", function () {//5.31购物车
        $("#mycontent").empty();
        $("#").empty();
        var id = $(this).find("#addC").attr("kk");
        url = lspath + "/AddCartServlet";
        var bg = $(' <img src="${pageContext.request.contextPath}/ad/page_ad.jpg" width="900" height="89" /><img src="${pageContext.request.contextPath}/images/buy1.gif" width="635" height="38" />');
        var thead = ' <table cellspacing="1" class="carttable" >' +
                ' <tr>' +
                '<td width="10%">序号</td>' +
                '<td width="30%">商品名称</td>' +
                ' <td width="10%">价格</td>' +
                ' <td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>' +
                '<td width="10%">库存</td>' +
                '<td width="10%">小计</td>' +
                '<td width="10%">取消</td>' +
                '</tr>';
        $("#mycontent").append(bg);
        $("#mycontent").append(thead);
        $.get(url, {"id": id}, function (data) {
          for (i = 0; i < data.length; i++) {
            var n = i + 1;
            var kc = data[i]["key"].pnum;
            var tline = ' <table  width="100%" border="0" cellspacing="0">' + '<tr> <td width="10%">' + n + '</td>' +
                    '<td width="30%">' + data[i]["key"].name + '</td>' +
                    '<td width="10%">' + data[i]["key"].price + '</td>' +
                    '<td width="20%">' + '<input type="button" class="sub" value="-" style="width:20px" myvalue="' + data[i]["key"].pnum + '">' +
                    '<input name="text"  class="buynum" type="text" value="' + data[i]["value"] + '" style="width:40px;text-align:center" />' +
                    '<input type="button" class="add" value="+" style="width:20px"/></td>' +
                    '<td width="10%">' + data[i]["key"].pnum + '</td>' +
                    '<td width="10%">' + data[i]["value"] * data[i]["key"].price + '</td>' +
                    '<td width="10%">' + '<a href="" style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>' +
                    '</td></tr>';

            pnum=data[i]["key"].pnum;
            $("#mycontent").append(tline);
          }
        });

      });
      $("#mycontent").on("click", ".sub", function () {

        var num = $(this).next().val();
        if (num > 1) {
          $(this).next().val(num - 1)
        } else {
          alert("最少也得选一本哦！")
        }

      });
      $("#mycontent").on("click", ".add", function () {
        var num1 = $(this).prev().val();
        if (num1 != 0&&num1 != pnum) {
          $(this).prev().val(parseInt(num1) + 1);
        }else{
          alert("你已经选中了全部的库存!");
        }
      });
    });

    //
    function ajaxPage(url, currentPage, category) {
      $.get(url, {"category": category, "currentPage": currentPage}, function (data) {
        $("#mycontent").empty();
        var aa = $('<p style="font-size: 18px;margin-left: 10px;margin-top: 20px;"><b>商品目录</b></p>' +
                '<p style="font-size: 18px;margin-left: 10px;"><b>' + data.category + '</b> 共' + data.totalCount + '种商品</p>' +
                '<div><img src="./images/productlist.gif" alt="" style="width: 95%;margin-left: 10px;"></div>');
        $("#mycontent").append(aa);
        for (var i = 0; i < data.ps.length; i++) {
          var content = $('<div class="col-sm-6 col-md-3" > ' +
                  '<div class="thumbnail mybook" bookid="' + data.ps[i].id + '"> ' +
                  '<img src="' + lspath + data.ps[i].imgurl + '" alt="..." id="firstim" style="width: 100px;height: 130px;"> ' +
                  '<div class="caption">' +
                  ' <h3>书名:' + data.ps[i].name + '</h3>' +
                  '<p>单价：' + data.ps[i].price + '</p> ' +
                  '<p><a href="#" class="btn btn-primary" role="button">商品详情</a> <a href="#" class="btn btn-default"role="button">加入购物车' +
                  '</a></p> </div><br>');
          $("#mycontent").append(content);

        }

        $(".pagination").empty();
        var k = data.currentPage - 1
        var n = data.currentPage + 1
        var first = $('<li><a href="javascript:void(0);" aria-label="Previous" onclick="page(' + k + ')"><span aria-hidden="true">&laquo;</span></a></li>');
        $(".pagination").append(first);
        for (var i = 1; i < data.totalPage; i++) {
          var myli = $('<li class="myPage" page="' + i + '"leibie=""><a href="javascript:void(0)">' + i + '</a></li>');
          $(".pagination").append(myli);
        }
        var last = '<li><a href="javascript:void(0);" aria-label="Next" onclick="page(' + n + ')"><span aria-hidden="true">&raquo;</span></a></li>';
        $(".pagination").append(last);
      });
    }

    function page(k, n) {
      ajaxPage(url, k, category);
      ajaxPage(url, n, category);
    }
  </script>
  <style>
    .carttable {
      border: 1px solid #CCCCCC;
      width: 100%;
      background-color: #E1FFE1;
    }
  </style>
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
