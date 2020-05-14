<%--
  Created by IntelliJ IDEA.
  User: velni
  Date: 5/6/2020
  Time: 11:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Skaiciuoti</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
    <h4> ${name} ${surname} ${age} ${groups}</h4>
</body>
<jsp:include page="footer.jsp"/>
</html>
