<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
        rel="stylesheet">

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        * {
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 12px;
        }

        .div-main {
            margin: 0 auto;
            width: 1050px;

            text-align: center;
        }

        .content {
            margin: 50px 0px 50px 0px;
        }

        h1,
        h2 {
            font-weight: 700;
        }
    </style>
</head>

<body>
    <div class="div-main">
        <h1>펀딩 후원 완료</h1>
        <div class="content">
            <img src="temp.PNG" alt="" width="400px">
            <h2>${fp.fpName}</h2>
            <p>[ ${fp.fpName} ]을 후원해주셔서 감사합니다.<br>
                더 나은 세상을 위해 노력하겠습니다.<br>:)</p>
        </div>
        <button type="button" id="btnIndex" class="btn btn-success btn-lg">목록으로 돌아가기</button>
    </div>
    <script>
        $("#btnIndex").click(function () {
            location.href = "/";
        })
    </script>
</body>

</html>