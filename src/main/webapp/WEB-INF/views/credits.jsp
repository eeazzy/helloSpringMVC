<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>검색 결과</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-B4gtvWnlvWkA5Y99PK7fbUMhFtmA5Ep9uF9KXbATIIj//ZvbipqIY2BsmV5IFWbz" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2 class="my-4">검색 결과</h2>

    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>년도</th>
            <th>학기</th>
            <th>취득 학점</th>
            <th>상세보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${coursesList}">
            <tr>
                <td>${course.year}</td>
                <td>${course.semester}</td>
                <td>${course.credit}</td>
                <td><a href="#">상세보기</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
