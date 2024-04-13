<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>수강신청</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>수강신청</h2>
    <sf:form method="post" action="${pageContext.request.contextPath}/docreate" modelAttribute="enrollment">
        <div class="form-group">
            <label for="year">년도:</label>
            <sf:input class="form-control" type="text" path="year" id="year"/>
            <sf:errors path="year" class="text-danger"/>
        </div>
        <div class="form-group">
            <label for="semester">학기:</label>
            <sf:input class="form-control" type="text" path="semester" id="semester"/>
            <sf:errors path="semester" class="text-danger"/>
        </div>
        <div class="form-group">
            <label for="courseName">교과목명:</label>
            <sf:input class="form-control" type="text" path="courseName" id="courseName"/>
            <sf:errors path="courseName" class="text-danger"/>
        </div>
        <div class="form-group">
            <label for="courseType">교과구분:</label>
            <sf:input class="form-control" type="text" path="courseType" id="courseType"/>
            <sf:errors path="courseType" class="text-danger"/>
        </div>
        <div class="form-group">
            <label for="instructorName">담당교수:</label>
            <sf:input class="form-control" type="text" path="instructorName" id="instructorName"/>
            <sf:errors path="instructorName" class="text-danger"/>
        </div>
        <div class="form-group">
            <label for="credit">학점:</label>
            <sf:input class="form-control" type="number" path="credit" id="credit"/>
            <sf:errors path="credit" class="text-danger"/>
        </div>
        <input type="submit" value="제출" class="btn btn-primary"/>
    </sf:form>
</div>
</body>
</html>
