<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>취득 학점 조회</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>취득 학점 조회</h2>

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
        <c:forEach var="entry" items="${yearSemesterTotalCredits}">
            <tr>
                <td>
                    <!-- 문자열 분할을 통해 연도를 구분 -->
                    <c:set var="keyParts" value="${entry.key.split('-')}" />
                    <c:out value="${keyParts[0]}" />
                </td>
                <td>
                    <!-- 문자열 분할을 통해 학기를 구분 -->
                    <c:out value="${keyParts[1]}" />
                </td>
                <td><c:out value="${entry.value}" /></td>
                <td>
                    <form action="/detail-view" method="post">
                        <input type="hidden" name="year" value="${keyParts[0]}"/>
                        <input type="hidden" name="semester" value="${keyParts[1]}"/>
                        <button type="submit" class="btn btn-link">상세보기</button>
                    </form>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <h3>취득 학점 총합: ${totalCredits}</h3>
</div>
</body>
</html>
