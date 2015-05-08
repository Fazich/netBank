<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logintest</title>
</head>
<body>

<form id="validForm" action="login.do" method="post">


    <%--<form:input  value="www" path="User.username" />--%>
    <%--<form:input  value="www" path="User.password"/>--%>
    <input type="text" value="www" name="username"/>
    <input type="text" value="www" name="password"/>
        <input type="radio" name="logintype" id="r-user" value="user" >
        <label for="r-user">用户</label>
        <input type="radio" name="logintype" id="r-teller"value="teller" >
        <label for="r-manager">业务员</label>
        <input type="radio" name="logintype" id="r-manager"value="manager" checked="checked">
        <label for="r-manager">管理员</label>
        <input type="radio" name="logintype" id="r-admin"value="admin" checked="checked">
        <label for="r-admin">技术员</label>

    <%--<form:hidden  value="user" path="logintype" />--%>
    <%--<input type="text" value="user" name="logintp">--%>
    <%--<form:hidden value="${accout.balance}" path="accout,balance"/>--%>
    <input type="submit" value="ok"/>


</form>

</body>
</html>
