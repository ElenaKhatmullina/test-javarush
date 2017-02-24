<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Data</title>

    <style type="text/css">
        table{
            margin-left: 75px;
        }
    .tg {
        border-collapse: collapse;
        border-spacing: 0;

        border-color: #40a48a;


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
    h1{margin-left: 75px;
        color: #035447;
    }

    h2{
        color: #085a4b;
    }
    a{margin-left: 50px;
        color: #328072;
        text-decoration:none;
    }
    a:hover{
        color: #b3bf2f;
    }
    a:active{
        color: #07bf7c
    }
    a:visited{
        color: #418598;
    }
</style>

    <style type="text/css">
        .mycss2{

            color: #35484e;
        }
    </style>

</head>
<body >


    <br/>

<a href="../../index.jsp"  class="mycss2" >   Back to main menu </a>

<br/>

<h1>User Details</h1>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Name</th>
        <th width="120">Age</th>
        <th width="120">Is Admin</th>
        <th width="120">Created Date</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.isAdmin}</td>
        <td>${user.createdDate}</td>


    </tr>
</table>

</body>
</html>