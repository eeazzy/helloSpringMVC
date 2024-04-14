<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>수강 내역 상세보기</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>${year}년 ${semester}학기 수강 내역</h2>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>교과목명</th>
            <th>교과구분</th>
            <th>담당교수</th>
            <th>학점</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${coursesList}">
            <tr>
                <td><c:out value="${course.courseName}" /></td>
                <td><c:out value="${course.courseType}" /></td>
                <td><c:out value="${course.instructorName}" /></td>
                <td><c:out value="${course.credit}" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div>
        <form action="${pageContext.request.contextPath}/credits" method="post">
            <input type="hidden" name="year" value="${year}">
            <input type="hidden" name="semester" value="${semester}">
            <button type="submit" class="btn btn-primary">돌아가기</button>
        </form>
    </div>
</div>
</body>
</html>
