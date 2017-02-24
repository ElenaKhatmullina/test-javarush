<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 08.02.2017
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<style type="text/css">
    .tg {
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #40a48a;
        text-align: center;
width: 1200px;

    }

    .tg td {
        font-family: "Times New Roman", sans-serif;
        font-size: 15px;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #b2d1a6;
        color: #155654;
        background-color: #e9ffcf;
        width: 800px;
        text-align: left;
        left: 30px;

    }

    .tg th {
        font-family: "Times New Roman", sans-serif;
        font-size: 15px;
        font-weight: normal;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #7fb2ac;
        color: #35484e;

        background-color: #bcddaf;

    }

    body{
        background-image:url(${pageContext.request.contextPath}/resources/1.jpg);
    }
    h1{
        color: #035447;
    }
    h3{
        margin-left: 50px;
    }
    h2{
        color: #085a4b;
    }
    a{
        color: #328072;

    }
    a:hover{
        color: #b3bf2f;
    }
    a:active{
        color: #07bf7c
    }
    a:visited{
        color: #5681cd;
    }
</style>

<style type="text/css">
    .mycss2{

        color: #35484e;
        left: 130px;
        margin-left: 50px;
    }
</style>
<html>
<head>
    <title>User with this name not found</title>
</head>
<body>
    <table class="mycss2">
        <br/>
        <h3>
    <a href="<c:url value="/users"/>"  class="mycss2"  >Users list</a>
            </h3>
    </table>
    <div  class="tg" >
        <h1 >User with this name not found</h1>
<img src="${pageContext.request.contextPath}/resources/image.jpg">
    </div>
</body>
</html>
