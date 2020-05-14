<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: velni
  Date: 5/11/2020
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Skaiciaus atnaujinimas</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
    <form:form name="bodyBuilder" action="/updateBodyBuildings" method="post">
        <input type="hidden" name="id" value="${bodyBuilder.id}"><p>
        Name:<br>
        <input type="text" name="name" value="${bodyBuilder.name}"><p>
        Surname:<br>
        <input type="text" name="surname" value="${bodyBuilder.surname}"><p>
        Age:<br>
        <input type="bodyBuilding" name="age" value="${bodyBuilder.age}"><p>
        Group:<br>
        <select name="groups" value="${bodyBuilder.groups}">
            <option selected="selected" value="Classic Physique">Classic Physique</option>
            <option value="Men’s Physique">Men’s Physique</option>
            <option value="Teen’s Physique">Teen’s Physique</option>
            <option value="Women’s Physique">Women’s Physique</option>
        </select><br><br>
        <input type="submit" value="Update">
    </form:form>
</body>
<jsp:include page="footer.jsp"/>
</html>
