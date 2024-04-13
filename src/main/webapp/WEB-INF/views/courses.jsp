<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Enrollment Data</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>수강신청 내역</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>년도</th>
            <th>학기</th>
            <th>교과목명</th>
            <th>교과구분</th>
            <th>담당교수</th>
            <th>학점</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="enrollment" items="${id_enrollments}">
            <tr>
                <td><c:out value="${enrollment.year}" /></td>
                <td><c:out value="${enrollment.semester}" /></td>
                <td><c:out value="${enrollment.courseName}" /></td>
                <td><c:out value="${enrollment.courseType}" /></td>
                <td><c:out value="${enrollment.instructorName}" /></td>
                <td><c:out value="${enrollment.credit}" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>


