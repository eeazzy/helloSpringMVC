<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>학사 정보 시스템</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
      <h2 class="my-4">학사 정보 시스템</h2>
      <div class="list-group mb-3">
        <a href="${pageContext.request.contextPath}/searchForm" class="list-group-item list-group-item-action">학년별 이수 학점 조회</a>
        <a href="${pageContext.request.contextPath}/registration" class="list-group-item list-group-item-action">수강 신청하기</a>
        <a href="${pageContext.request.contextPath}/courses" class="list-group-item list-group-item-action">수강 신청 조회</a>
    </div>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
          <a href="javascript:document.getElementById('logout').submit()">로그아웃</a>
        </c:if>

        <form id="logout"  action="<c:url value="/logout" />"method="post">
          <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
        </form>

  </div>
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
