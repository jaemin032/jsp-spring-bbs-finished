<%--
  Created by IntelliJ IDEA.
  User: jm.jung
  Date: 2018-02-08
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.hellokoding.springboot.model.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>


<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.hellokoding.springboot.model.user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<html>
<head>
    <title>JSP Bulletin Board</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute(userID) != null) {
            userID = (String) session.getAttribute("userID");
        }
        if(userID != null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인이 되어 있습니다.')");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }



        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());

        if( result == 1) {
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        else if (result == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다')");
            script.println("history.back()");
            script.println("</script>");
        } else if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if (result == -2) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
        }
    %>
</body>
</html>