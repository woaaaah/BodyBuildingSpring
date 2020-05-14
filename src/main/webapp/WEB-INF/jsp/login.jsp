<%--
  Created by IntelliJ IDEA.
  User: velni
  Date: 5/12/2020
  Time: 6:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Puslapio turinio keliui nustatyti -->
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <jsp:include page="header.jsp"/>
</head>

<body>
<h1 class="text-center">BodyBuilding</h1>
<div class="container">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h3 class="form-heading">Login</h3>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
            autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <!--
            Web aplikacija naudotojui turetu isduoti papildoma parametra kuris nebutu nuspejasmas piktavaliui
            paprastai naudotojui yra isduodamas unikalus CSRF zetonas token
            kuris tu buti validuotjmas back endo su kiekviena duomenis keiciancia uzklausa
            -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
            <h4 class="text-center"><a href="${contextPath}/register">Register</a></h4>
        </div>
    </form>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
