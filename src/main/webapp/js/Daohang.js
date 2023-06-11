var lspath;
var category;
var url;
$(function () {
    lspath = $("#webPath").val();
    $("#allp a").click(function () {
        $("#mycontent").empty();
        url = lspath + "/ShowProductByPageServlet";
        category = $(this).html();
        ajaxPage(url, 1, category);
    });
    $(".pagination").on("click", ".myPage", function () {
        currentPage = $(this).attr("page");
        ajaxPage(url, currentPage, category);
    });
});

function ajaxPage(url, currentPage, category) {
    $.get(url, {"category": category, "currentPage": currentPage}, function (data) {
        $("#mycontent").empty();
        for (var i = 0; i < data.ps.length; i++) {
            var content = $('<div class="col-sm-6 col-md-3" > ' +
                '<div class="thumbnail"> ' +
                '<img src="' + lspath + data.ps[i].imgurl + '" alt="..." id="firstim" style="width: 100px;height: 130px;"> ' +
                '<div class="caption">' +
                ' <h3>书名:' + data.ps[i].name + '</h3>' +
                '<p>单价：' + data.ps[i].price + '</p> ' +
                '<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default"role="button">Button' +
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