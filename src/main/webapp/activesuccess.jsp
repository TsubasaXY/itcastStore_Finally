<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电子书城</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
  <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="css/main.css" type="text/css" />
  <script type="text/javascript" src="js/my.js"></script>
</head>
<body class="main">
<jsp:include page="head.jsp" />
<jsp:include page="menu_search.jsp" />
<div id="divcontent">
  <table width="850px" border="0" cellspacing="0">
    <tr>
      <td style="padding:30px; text-align:center">
        <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
          <tr>
            <td style="width:98px">
              <img src="images/IconTexto_WebDev_009.jpg" width="128" height="128" />
            </td>
            <td style="padding-top:30px">
              <font style="font-weight:bold; color:#FF0000">帐户激活成功</font><br /> <br />
              <a href="${pageContext.request.contextPath }/index.jsp">
                <span id="second">5</span>秒后自动为您转跳回首页
              </a>
            </td>
          </tr>
        </table>
        <h1>&nbsp;</h1>
      </td>
    </tr>
  </table>
</div>
<jsp:include page="foot.jsp" />
</body>
</html>
