
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<style>

    .registerstyle {
        background-color: #bfbfbf;
        margin: 0 auto;
        width: 30%;
        text-align: center;
        border: 6px solid #0090a3;
        height: 38em;
    }

    html {
        height: 100%;
        width: 100%;
        background-color: #bfbfbf !important;
    }

    body {
        background-color: #bfbfbf !important;
    }

    h3 {
        color: #0090a3 !important;
    }

    h1 {
        color: #0090a3 !important;
    }

    h4 {
        color: #0090a3 !important;
    }

    h2 {
        color: #0090a3 !important;
    }

    button {
        background-color: #0090a3 !important;
    }

    input {
        border-color: #0090a3 !important;
    }

    a {
        color: #0090a3 !important;
        text-decoration: none;
    }

    a:hover{
        color: #0574a3;
    }
</style>

<head>
    <meta charset="utf-8">
    <title>Registration</title>
    <jsp:include page="header.jsp"/>
</head>

<body>

<div class="container">
    <div class="registerstyle">
        <form:form method="POST" modelAttribute="userForm" class="form-signin">
            <h2 class="form-signin-heading">New user registration</h2>
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control"
                                placeholder="Password"></form:input>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>
            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm Password"></form:input>
                    <form:errors path="passwordConfirm"></form:errors>
                </div>
            </spring:bind>
            <spring:bind path="email">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="email" class="form-control" placeholder="E-Mail"
                                autofocus="true"></form:input>
                    <form:errors path="email"></form:errors>
                </div>
            </spring:bind>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
            <h4 class="active"><a href="/login" style="text-decoration : none">Return</a></h4>
        </form:form>
    </div>
</div>


</body>
</html>
