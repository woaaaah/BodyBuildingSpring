
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<style>

    html{
        height: 100%;
        width: 100%;
        background-color: #bfbfbf !important;
    }
    body{
        background-color: #bfbfbf !important;
    }

    .loginstyle{
        background-color: #bfbfbf;
        margin: 0 auto;
        width: 30%;
        text-align: center;
        border: 6px solid #0090a3;
        height: 30em;
    }
    h3 {
        color: #0090a3 !important;
    }
    h1{
        color: #0090a3 !important;
    }
    h4{
        color: #0090a3 !important;
    }
    button{
        background-color: #0090a3 !important;
    }
    input{
        border-color: #0090a3 !important;
    }
    a{
        color: #0090a3 !important;
    }
    a:hover{
        color: #0574a3;
    }
</style>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <jsp:include page="header.jsp"/>
</head>

<body>
<div class="container">
    <div class = "loginstyle">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h1 class="text-center">BodyBuilding</h1>
        <h3 class="form-heading">Login</h3>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
            autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
            <h4 class="text-center"><a href="${contextPath}/register" style="text-decoration : none">Register</a></h4>
        </div>
    </form>
    </div>
</div>

</body>
</html>
