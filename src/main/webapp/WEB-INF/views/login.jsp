<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>로그인</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }

        .form-signin {
            max-width: 400px;
            padding: 15px;
            margin: 100px auto;
            background-color: #ffffff;
            border: 1px solid #dedfe0;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-signin-heading {
            margin-bottom: 30px;
            font-weight: bold;
            color: #4b4f56;
        }

        .btn-primary {
            background-color: #1877f2;
            border-color: #1877f2;
        }

        .btn-primary:hover {
            background-color: #165fc1;
        }

        input[type="text"], input[type="password"] {
            border-radius: 5px;
            border: 1px solid #dedfe0;
        }

        .form-control:focus {
            border-color: #1877f2;
            box-shadow: none;
        }
    </style>
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="<c:url value='/login' />">
        <h2 class="form-signin-heading">로그인</h2>

        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger"> ${errorMsg} </div>
        </c:if>

        <c:if test="${not empty logoutMsg}">
            <div class="alert alert-info"> ${logoutMsg} </div>
        </c:if>

        <div class="form-group">
            <input type="text" id="username" name="username" class="form-control" placeholder="아이디" required autofocus>
        </div>

        <div class="form-group">
            <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" required>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        <button class="btn btn-primary btn-block" type="submit">로그인 하기</button>
    </form>
</div>
</body>

</html>
