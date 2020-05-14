<%--
  Created by IntelliJ IDEA.
  User: velni
  Date: 5/12/2020
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- puslapio turinio keliui nustatyti -->
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="header.jsp"/>

<style>
    .container-fluid{
        text-align: center;
        background-color: #0090a3;
        width: 100%;
    }
    a{
        background-color: #0090a3;
        color: white;
    }
    a:hover{
        color: #bfbfbf;
        text-decoration:none;
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
            <c:if test="${pageContext.request.userPrincipal.name != null}"> <!--vartotojo vardo gavimas is uzklausos -->
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <!--
                    A Cross site Request forgery CSRF arba vieno paspaudimo ataka one click atack
                    yra paplitusi saugumo problema kai is aukos narsykles jam nepastenpint yra
                    siunciamos uzklausos i sveitaine prie kurios jis prisijunges
                    praktikoje daznai isnaudojamas slaptazodziu keitimos funkcionalumas
                    pagalvokite jog daznai visu naudotoju nepriklausomai nuo jo roles
                    slaptazodzio keitimo parametrai yra tokie patys
                    Del sios priezasties piktavaliui pakankamai nesudetinga padirbti uzklausa
                    o jei naujo slaptazodzio nustatymui nereikia ivesti senojo
                    piktavalis neusnkiai gali paerimti aukos paskyra
                    Web Aplikacija naudotojui turetu usduoti papildoma parametra kuris nebutu nuspejamas piktavaliui
                    Paprastai naudotojui yra isduodamas unikalus CSRF zetonas token
                    kuris turi buti validuojamas backende su kiekviena duomenis keiciancia uzklausa
                   -->
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <a onclick="document.forms['logoutForm'].submit()">Logout, ${pageContext.request.userPrincipal.name}</a>

            </c:if>
        </ul>
    </div>
</nav>

