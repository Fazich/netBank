<%@page import="com.bank.domain.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--<script type="text/javascript">--%>
<%--<c:if test="${empty sessionScope.user }">--%>
<%--alert("请先登录！");--%>
<%--window.location.href = "login.do";--%>
<%--</c:if>--%>

<%--</script>--%>


<script type="text/javascript">
    <c:choose>
    <c:when test="${!empty sessionScope.user}">
    </c:when>
    <c:when test="${!empty sessionScope.teller}">
    </c:when>
    <c:when test="${!empty sessionScope.manager}">
    </c:when>
    <c:when test="${!empty sessionScope.admin}">
    </c:when>
    <c:otherwise>
    alert("请先登录！");
    window.location.href = "login.do";
    </c:otherwise>
    </c:choose>
</script>