<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
        rel="stylesheet">

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
        </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>

    <title>도넷닷컴</title>
    <style>
        .div-top {
            margin-bottom: 50px;
        }

        .div-category-menu {
            display: inline-block;
            background-color: rgba(248, 248, 248);
            padding: 1em 10em;
            text-align: center;
            box-shadow: 4px 4px 4px 4px rgba(199, 199, 199);
            margin-bottom: 50px;
            width: 1050px;
        }

        .btn-light {
            display: inline-block;
            background-color: rgba(224, 224, 224);
            /* padding: 0.5em 1em; */
            margin-left: 1em;
        }

        .container {
            text-align: center;
        }

        .div-content {
            display: inline-block;
            /* background-color: burlywood; */
            width: 1050px;
        }

        .wrapper {
            display: grid;
            grid-template-columns: repeat(4, 246px);
            grid-auto-rows: minmax(340px, 340px);
            row-gap: 100px;
            column-gap: 22px;
            /* background-color: azure; */
        }

        .one {
            grid-column: 1;
            grid-row: 1;
            overflow: hidden;
            position: relative;
            /* box-shadow: 2px 2px 2px 2px rgba(199, 199, 199); */
        }

        .image {
            display: inline-block;
            margin-top: 16px;
            width: 210px;
            height: 200px;
            /* background-color: beige; */
        }

        .div-card-info {
            margin-top: 10px;
            /* background-color: aliceblue; */
            width: 240px;
            height: 102px;
            word-break: break-all;
            overflow: hidden;
        }

        .div-card-info-top {
            overflow: hidden;
            word-break: break-all;
        }

        .progress {
            border-radius: 0px;
            height: 4px;
            margin-bottom: 0;
        }

        h1 {
            text-align: left;
            margin-left: 70px;
            font-size: 2em;
        }

        p {
            margin: 0;
        }

        .div-goalPersent {
            color: rgb(60, 179, 113);
            text-align: right;
            margin-right: 10px;
        }

        select {
            outline: 0;
            border: 0;
            -webkit-appearance: none;
            /* 네이티브 외형 감추기 */
            -moz-appearance: none;
            appearance: none;
            background: url('caret-down.png') no-repeat 95% 50%;
            background-size: 10px;
            /* 화살표 모양의 이미지 */
            padding: 4px;
            /* padding-right: 4px; */
        }

        option {
            padding: 4px;
            /* padding-right: 4px; */
        }

        /* IE 10, 11의 네이티브 화살표 숨기기 */
        select::-ms-expand {
            display: none;
        }

        .div-filter {
            text-align: right;
            margin-right: 40px;
        }

        .search-bar {
            text-align: right;
            display: inline-block;
            margin-right: 20px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="div-top">
            <h1> 후원 > 펀딩프로젝트 </h1>
            <div>
                <div class="div-category-menu">
                    <button type="button" class="btn btn-light">재난</button>
                    <button type="button" class="btn btn-light">환경</button>
                </div>
            </div>
            <div class="div-filter">
            	<div class="mx-auto mt-5 search-bar input-group mb-3">
                    <input name="q" type="text" class="form-control rounded-pill" placeholder="검색"
                        aria-label="Recipient's username" aria-describedby="button-addon2">
                    <div class="input-group-append">
                    </div>
                </div>
                <select name="filter2" id="filter2">
                    <option value="1">전체</option>
                    <option value="2">진행중</option>
                    <option value="3">종료</option>
                </select>
                <select name="filter1" id="filter1">
                    <option value="1">최신순</option>
                    <option value="2">인기순</option>
                    <option value="3">마감임박</option>
                </select>
            </div>

        </div>
        <div class="div-content">
            <div class="wrapper">
                <div class="one">
                    <div class="image" style="background-image: url('temp.PNG');"></div>
                    <div class="div-card-info">
                        <div class="div-card-info-top">
                            <a href="">
                                <div><strong><span id="title"></span></strong></div>
                            </a>
                            <div><span id="cateogry"></span>|<span id="hostName"></span> </div>
                            <p class="d-day">D-<span id="deadline"></span></p>
                            <p><span id="currentPrice">4,000,000</span>원 / 목표 <span id="goalPrice">10,000,000</span>원</p>
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            </div>
                        </div>
                        <div class="div-goalPersent"><span>40</span>%</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>

</html>