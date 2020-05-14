<%--
  Created by IntelliJ IDEA.
  User: velni
  Date: 5/11/2020
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    table{
        background-color: #bfbfbf;
        border: 6px solid #0090a3;
    }
</style>
<head>
    <title>Skaiciai</title>
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
</head>
<body class="container">
    <div class="table-responsive">
        <table class="table table-striped">
            <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>Age</th>
                <th>Group</th>
                <th>Veiksmas</th>
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
<jsp:include page="footer.jsp"/>
</body>
</html>
