<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #20a088;
margin-left: 75px;
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
            border-color: #19cc95;
            color: #35484e;
            background-color: #bcddaf;

        }
        .yy{
            margin-left: 74px;
        }
        .uu{
            margin-right:450px ;
            text-align: right;
        }
.ii{
    font-size: 20px;
    color: #155654;
}
        body{
            background-image:url(${pageContext.request.contextPath}/resources/1.jpg);
        }
        h1{
            color: #035447;
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
            color: #418598;
        }


    </style>
    <style type="text/css">
       .mycss{
            background-color: #e9ffcf;
           color: #35484e;
        }
    </style>
    <style type="text/css">
        .mycss2{

            color: #35484e;
        }
    </style>
</head>
<body>
<div class="yy">
<a href="../../index.jsp"  class="mycss2" >   Back to main menu </a>
<br/>
<h1 >User List</h1>
<c:if test="${!empty listUsers}">
    <table class="tg"  >
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="60">Age</th>
            <th width="80">Is Admin</th>
            <th width="120">Created Date</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                <td>${user.age}</td>
                <td>${user.isAdmin}</td>
                <td>${user.createdDate}</td>

                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty listUsers}">
    <p class="ii">The listUsers is empty!(((((  But You may want someone to add right now! Do it!</p>
</c:if>

<table>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td width="50%">

<h1>Add a User</h1>
<c:url var="addAction" value="/users/add"/>
<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id"  cssClass="mycss2">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true" cssClass="mycss"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name" cssClass="mycss2">
                    <spring:message text="name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name" cssClass="mycss"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age" cssClass="mycss2">
                    <spring:message text="age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age" cssClass="mycss"/>
            </td>
        </tr>
        <tr>
            <td><form:label path="isAdmin" cssClass="mycss2">
                <spring:message text="isAdmin" />
        </form:label>
        </td>
            <td>
                <form:input path="isAdmin" cssClass="mycss"/>
            </td>
        </tr>
        <tr>

    </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User" />" class="mycss"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>" class="mycss"/>
                </c:if>
            </td>
        </tr>
    </table>

</form:form>
    </td>

        <td >
    <h1 >Search a User by Name</h1>

            <c:url value="/search" var="searchAction" />
            <form:form action="${searchAction}"  method="POST" >
                <label >
                    <input type="text" name="username"/>
                </label>
                <input type="submit" value="search" /> </form:form>

        </td>
    </tr>
    </table>
<div id="pagination" class="uu">
    <p >Pagination: </p>

    <c:url value="/users" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/users" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/users" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>
    </div>
</body>
</html>