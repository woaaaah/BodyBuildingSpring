<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .updatebody{
        background-color: #bfbfbf;
        margin: 0 auto;
        width: 30%;
        text-align: center;
        border: 6px solid #0090a3;
        height: 38em;
    }
    html{
        height: 100%;
        width: 100%;
    }
    body{
        background-color: #bfbfbf !important;
    }
    .container{
        text-align: center;
    }
</style>
<head>
    <title>Update</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
<div class = updatebody>
    <form:form name="bodyBuilder" action="/updateBodyBuildings" method="post">
        <input type="hidden" name="id" value="${bodyBuilder.id}"><p>
        Name:<br>
        <input type="text" name="name" value="${bodyBuilder.name}"><p>
        Surname:<br>
        <input type="text" name="surname" value="${bodyBuilder.surname}"><p>
        Age:<br>
        <input type="text" name="age" value="${bodyBuilder.age}"><p>
        Group:<br>
        <select name="groups" value="${bodyBuilder.groups}">
            <option selected="selected" value="Classic Physique">Classic Physique</option>
            <option value="Men’s Physique">Men’s Physique</option>
            <option value="Teen’s Physique">Teen’s Physique</option>
            <option value="Women’s Physique">Women’s Physique</option>
        </select><br><br>
        <input type="submit" value="Update">
</div>
    </form:form>
</body>

</html>
