
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    table th, td{
        text-align: center;
        border: 4px solid #0090a3;
    }
    .container{
        background-color: #bfbfbf;
    }
</style>
<head>
    <title>BodybuildingTable</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
<h1>Registered Contestants List</h1>
    <div class="table-responsive">
        <table class="table table-striped">
            <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>Age</th>
                <th>Group</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="bodyBuilder" items="${bodyBuildingTable}">

                <c:url var="updateBodyBuilding" value="/updateBodyBuilding">
                        <c:param name="id" value="${bodyBuilder.id}"/>
                </c:url>

                <c:url var="deleting" value="/deleting">
                    <c:param name="id" value="${bodyBuilder.id}"/>
                </c:url>

                <c:url var="show" value="/show">
                    <c:param name="id" value="${bodyBuilder.id}"/>
                </c:url>

                <tr>
                    <td>${bodyBuilder.name}</td>
                    <td>${bodyBuilder.surname}</td>
                    <td>${bodyBuilder.age}</td>
                    <td>${bodyBuilder.groups}</td>

                    <td>
                        <a href="${updateBodyBuilding}">Update</a>
                        <a href="${deleting}"onclick="if (!(confirm('Ar tikrai norite istrinti si irasa'))) return false"
                           >Delete</a>
                        <a href="${show}">Show</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
