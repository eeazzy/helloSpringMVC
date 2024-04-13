<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
      <title>학사 정보 시스템</title>
  </head>
<body>
  <p> <a href="${pageContext.request.contextPath}/credits">학년별 이수 학점 조회</a></p>
  <p> <a href="${pageContext.request.contextPath}/registration">수강 신청하기</a></p>
  <p> <a href="${pageContext.request.contextPath}/courses">수강 신청 조회</a></p>

  <c:if test="${pageContext.request.userPrincipal.name != null}">
    <a href="javascript:document.getElementById('logout').submit()">Logout</a>
  </c:if>

  <c:if test="${pageContext.request.userPrincipal.name == null}">
    <a href="${pageContext.request.contextPath}/login">Login</a>
  </c:if>

  <form id="logout"  action="<c:url value="/logout" />" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
</body>
</html>



<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<html>--%>
<%--  <head>--%>
<%--    <title>$Title$</title>--%>
<%--  </head>--%>
<%--  <body>--%>
<%--    <p> <a href="${pageContext.request.contextPath}/offers"> Show current offers</a></p>--%>
<%--    <p> <a href="${pageContext.request.contextPath}/createoffer"> Add a new offer</a></p>--%>

<%--    <c:if test="${pageContext.request.userPrincipal.name != null}">--%>
<%--      <a href="javascript:document.getElementById('logout').submit()">Logout</a>--%>
<%--    </c:if>--%>

<%--    <form id="logout"  action="<c:url value="/logout" />"method="post">--%>
<%--      <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />--%>
<%--    </form>--%>
<%--  </body>--%>
<%--</html>--%>
