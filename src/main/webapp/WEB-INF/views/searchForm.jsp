<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>학년별 이수 학점 조회</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-B4gtvWnlvWkA5Y99PK7fbUMhFtmA5Ep9uF9KXbATIIj//ZvbipqIY2BsmV5IFWbz" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2 class="my-4">학년별 이수 학점 조회</h2>

    <form action="${pageContext.request.contextPath}/search-courses" method="POST" class="mb-3">
        <div class="form-group">
            <label for="year">년도:</label>
            <input type="number" id="year" name="year" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="semester">학기:</label>
            <input type="number" id="semester" name="semester" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">검색</button>
    </form>
</div>
</body>
</html>
