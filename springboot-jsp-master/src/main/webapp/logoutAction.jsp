<%--
  Created by IntelliJ IDEA.
  User: jm.jung
  Date: 2018-02-09
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>JSP Bulletin Board</title>
</head>
<body>
<%
    session.invalidate();
%>
    <script>
        location.href = 'main.jsp';
    </script>
</body>
</html>
