<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>학년별 이수 학점 조회</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>학년별 이수 학점 조회</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>년도</th>
            <th>학기</th>
            <th>취득 학점</th>
            <th>상세보기</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="semester" items="${semesterCredits}">
            <tr>
                <td>${semester.year}</td>
                <td>${semester.semester}</td>
                <td>${semester.totalCredits}</td>
                <td><a href="${pageContext.request.contextPath}/academic/semester-details?year=${semester.year}&semester=${semester.semester}">링크</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2"><strong>총계</strong></td>
            <td><strong>${totalCredits}</strong></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
