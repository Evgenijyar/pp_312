<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body>
<h2> All users </h2>

<table>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Operations</th>
    </tr>
    <c:forEach var="user1" items="${allUsers}">
        <c:url var="updateButton" value="/updateInfo">
            <c:param name="userId" value="${user1.id}"/>
        </c:url>
        <c:url var="deleteButton" value="/deleteUser">
            <c:param name="userId" value="${user1.id}"/>
        </c:url>

        <tr>
            <td>${user1.name}</td>
            <td>${user1.surname}</td>
            <td>${user1.email}</td>
            <td>${user1.phone}</td>
            <td>
                <input type="button" value="Update" onclick="window.location.href = '${updateButton}'">
                <input type="button" value="Delete" onclick="window.location.href = '${deleteButton}'">
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<br>

<form:form action="/saveUser" modelAttribute="user">

    <form:hidden path="id"/>

    <table>
        <tr>
            <td> Name </td>
            <td> <form:input path="name"/> </td>
        </tr>
        <tr>
            <td> Surname </td>
            <td> <form:input path="surname"/> </td>
        </tr>
        <tr>
            <td> Email </td>
            <td> <form:input path="email"/> </td>
        </tr>
        <tr>
            <td> Phone </td>
            <td> <form:input path="phone"/> </td>
        </tr>
    </table>
    <br>
    <c:choose>
        <c:when test="${user.id=='0'}"> <input type="submit" value="Add user"> </c:when>
        <c:otherwise> <input type="submit" value="Update user"> </c:otherwise>
    </c:choose>
</form:form>
</body>
</html>