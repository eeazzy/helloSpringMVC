<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>교과목 정보 입력</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
<div class="container">
    <h2>교과목 정보 입력</h2>
    <sf:form method="post" action="${pageContext.request.contextPath}/docreate" modelAttribute="enrollment">
        <table class="formtable">
            <tr>
                <td class="label">년도:</td>
                <td><sf:input class="control" type="text" path="year"/> <br/>
                    <sf:errors path="year" class="error"/>
                </td>
            </tr>
            <tr>
                <td class="label">학기:</td>
                <td><sf:input class="control" type="text" path="semester"/> <br/>
                    <sf:errors path="semester" class="error"/>
                </td>
            </tr>
            <tr>
                <td class="label">교과목명:</td>
                <td><sf:input class="control" type="text" path="courseName"/> <br/>
                    <sf:errors path="courseName" class="error"/>
                </td>
            </tr>
            <tr>
                <td class="label">교과구분:</td>
                <td><sf:input class="control" type="text" path="courseType"/> <br/>
                    <sf:errors path="courseType" class="error"/>
                </td>
            </tr>
            <tr>
                <td class="label">담당교수:</td>
                <td><sf:input class="control" type="text" path="instructorName"/> <br/>
                    <sf:errors path="instructorName" class="error"/>
                </td>
            </tr>
            <tr>
                <td class="label">학점:</td>
                <td><sf:input class="control" type="number" path="credit"/> <br/>
                    <sf:errors path="credit" class="error"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="제출"/> </td>
            </tr>
        </table>
    </sf:form>
</div>
</body>
</html>
