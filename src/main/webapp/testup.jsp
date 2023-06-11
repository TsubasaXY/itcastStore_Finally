<%--
  Created by IntelliJ IDEA.
  User: Tsubasa
  Date: 2023/5/19
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/fileUpload2" method="post" enctype="multipart/form-data">
  <input type="file" name="upload2" multiple>
  <input type="submit" value="上传"/>
</form>

</body>
</html>
