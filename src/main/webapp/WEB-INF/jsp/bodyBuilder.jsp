
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<style>
    html{
        height: 100%;
        width: 100%;
    }
    body{
        background-color: #bfbfbf !important;
    }
    table th, td{
        text-align: center;
        border: 4px solid #0090a3;
    }
</style>
<head>
    <title>Bodybuilding</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
    <div class="table-responsive">
        <caption>Contestant information</caption>
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
</html>
