<%--
  Created by IntelliJ IDEA.
  User: velni
  Date: 5/11/2020
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Skaicius</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
    <div class="table-responsive">
        <caption>Skaiciaus informacija</caption>
        <table class="table table-striped">
            <tr>
                <td><b>Id:</b></td>
                <td>${bodyBuilder.id}</td>
            </tr>
            <tr>
                <td><b>Name:</b></td>
                <td>${bodyBuilder.name}</td>
            </tr>
            <tr>
                <td><b>Surname:</b></td>
                <td>${bodyBuilder.surname}</td>
            </tr>
            <tr>
                <td><b>Age:</b></td>
                <td>${bodyBuilder.age}</td>
            </tr>
            <tr>
                <td><b>Group:</b></td>
                <td>${bodyBuilder.groups}</td>
            </tr>
        </table>
    </div>
<br>
<a type="button" href="/bodyBuildingTable" class="button">Back</a>
</body>
<jsp:include page="footer.jsp"/>
</html>
