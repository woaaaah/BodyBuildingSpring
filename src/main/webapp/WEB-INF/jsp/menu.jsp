
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="header.jsp"/>

<style>
    .container-fluid{
        text-align: center;
        background-color: #0090a3;
        width: 100%;
    }
    a{
        background-color: #0090a3 !important;
        color: black !important;
        font-size: 15px;
    }
    a:hover{
        color: #bfbfbf;
        text-decoration:none;
    }

    .nav > li > a{
        padding-right: 100px;
    }
</style>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://localhost:8090/">Bodybuilding Form</a>
        </div>
        <ul class="nav navbar-nav navbar-left">
            <li class="active"><a href="/bodyBuildingTable">Contestant Entries</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <a onclick="document.forms['logoutForm'].submit()">Logout, ${pageContext.request.userPrincipal.name}</a>

            </c:if>
        </ul>
    </div>
</nav>

