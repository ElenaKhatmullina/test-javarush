<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User manager</title>
    <style type="text/css">

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
            border-color: #19cc95;
            color: #35484e;
            background-color: #bcddaf;

        }

        body{
            background-image:url(${pageContext.request.contextPath}/resources/1.jpg);
        }
        h1{
            color: #035447;
            font-size: 30px;
        }

        h2{
            color: #085a4b;
        }
        a{
            color: #2b6d61;

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
            font-size: 25px;
        }
    </style>
</head>
<body>
<div align="center">
<h1 >Elena Hatmullina presents</h1>
<a href="<c:url value="/users"/>"  class="mycss2" >Users list</a>
<p>
<img src="${pageContext.request.contextPath}/resources/2.jpg">
</p>
    </div>
</body>
</html>
