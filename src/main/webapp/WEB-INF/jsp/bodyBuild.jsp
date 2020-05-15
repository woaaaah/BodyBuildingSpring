
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Bodybuilding</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <style>
        h2 {
            color: #0090a3;
        }

        .container {
            background-color: #bfbfbf;

        }

        .anketa {
            margin: 0 auto;
            width: 50%;
            text-align: center;
            border: 6px solid #0090a3;

        input {
            background-color: #0090a3 !important;
        }


        .vardas {
            background-color: #bfbfbf;

        }

        .error {
            color: red
        }
    </style>
</head>
<body class="container">
<div class="anketa">
    <h2>BodyBuilding Contestant Form</h2>
    <table class="table table-striped">
        <form:form method="post" action="bodyBuildingShow" modelAttribute="number">

            <form:input type="text" path="name" placeholder="Name"/>
            <form:errors path="name" cssClass="error"/><br><br>
            <form:input type="text" path="surname" placeholder="Surname"/>
            <form:errors path="surname" cssClass="error"/><br><br>
            <form:input type="text" path="age"  placeholder="Age"/>
            <form:errors path="age" cssClass="error"/><br><br>

        <select name="groups">
            <option selected="selected" value="Classic Physique">Classic Physique</option>
            <option value="Men’s Physique">Men’s Physique</option>
            <option value="Teen’s Physique">Teen’s Physique</option>
            <option value="Women’s Physique">Women’s Physique</option>
        </select><br><br>

        <input type="submit" value="Confirm">
</div>
</form:form>
</body>
</html>
