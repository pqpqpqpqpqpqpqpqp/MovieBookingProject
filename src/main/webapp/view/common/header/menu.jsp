<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CGV 통합 드롭다운 메뉴</title>
    <style>
        body {
            margin: 0;
            font-family: "Noto Sans KR", sans-serif;
        }

        .nav-bar {
            border-top: 3px solid red;
            border-bottom: 1px solid #ccc;
            background-color: white;
            padding: 0 40px;
            position: relative;
        }

        .menu-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 50px;
        }

        .menu {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .menu > li {
            padding: 15px 20px;
            cursor: pointer;
            font-weight: bold;
            position: relative;
        }

        .menu > li:hover {
            color: red;
            border-bottom: 2px solid red;
        }

        .menu:hover ~ .dropdown-wrapper {
            display: flex;
        }

        .search-box {
            display: flex;
            align-items: center;
        }

        .search-box input[type="text"] {
            border: none;
            border-bottom: 1px solid #999;
            padding: 5px 10px;
            font-size: 14px;
            outline: none;
        }

        .search-box img {
            width: 18px;
            height: 18px;
            margin-right: 8px;
        }

        .dropdown-wrapper {
            display: none;
            position: absolute;
            top: 51px;
            left: 0;
            width: 100%;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            z-index: 10;
            padding-top: 20px;
            padding-bottom: 30px;
            justify-content: left;
        }
        .dropdown-wrapper.active {
   		 display: flex;
		}

        .dropdown-section {
        border: 1px,
            display: flex;
            flex-direction: column;
            min-width: 150px;
            margin-left: 30px;
        }

        .dropdown-section h4 {
            margin: 0 0 10px;
            font-size: 15px;
            color: #000;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }

        .dropdown-section ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .dropdown-section ul li {
            font-size: 13px;
            color: #333;
            margin: 6px 0;
            cursor: pointer;
        }

        .dropdown-section ul li:hover {
            text-decoration: underline;
        }
    </style>
    
</head>
<body>

<!-- 상단 메뉴 -->
<div class="nav-bar" id="navBar">
    <div class="menu-container">
        <ul class="menu">
            <li>영화</li>
            <li>극장</li>
            <li>예매</li>
            <li>스토어</li>
            <li>이벤트</li>
            <li>혜택</li>
        </ul>
        <!-- 검색창 -->
        <div class="search-box">
            <input type="text" placeholder="나모그세">
            <img src="https://img.icons8.com/ios/50/search--v1.png" alt="검색">
        </div>
    </div>

    <!-- 통합 드롭다운 메뉴 -->
    <div class="dropdown-wrapper" id="dropDown">
        <div class="dropdown-section">
            <h4>영화</h4>
            <ul>
                <li>무비차트</li>
                <li>아트하우스</li>
                <li>ICECON</li>
            </ul>
        </div>
        <div class="dropdown-section">
            <h4>극장</h4>
            <ul>
                <li>CGV 극장</li>
                <li>특별관</li>
            </ul>
        </div>
        <div class="dropdown-section">
            <h4>예매</h4>
            <ul>
                <li>빠른예매</li>
                <li>상영스케줄</li>
                <li>English Ticketing</li>
                <li>English Schedule</li>
            </ul>
        </div>
        <div class="dropdown-section">
            <h4>스토어</h4>
            <ul>
                <li>패키지</li>
                <li>영화관람권</li>
                <li>기프트카드</li>
                <li>콤보</li>
                <li>팝콘</li>
                <li>음료</li>
                <li>스낵</li>
                <li>씨네샵</li>
            </ul>
        </div>
        <div class="dropdown-section">
            <h4>이벤트</h4>
            <ul>
                <li>SPECIAL</li>
                <li>영화/예매</li>
                <li>멤버십/CLUB</li>
                <li>CGV 극장별</li>
                <li>제휴할인</li>
                <li>당첨자 발표</li>
                <li>종료된 이벤트</li>
            </ul>
        </div>
        <div class="dropdown-section">
            <h4>혜택</h4>
            <ul>
                <li>CGV 할인정보</li>
                <li>CLUB 서비스</li>
                <li>VIP 라운지</li>
            </ul>
        </div>
    </div>
</div>
<script>
    const navBar = document.getElementById("navBar");
    const dropdown = document.getElementById("dropDown");

    // 마우스가 메뉴 영역에 들어오면 dropdown 보여줌
    navBar.addEventListener("mouseenter", () => {
        dropdown.classList.add("active");
    });

    // 마우스가 메뉴 영역에서 나가면 dropdown 숨김
    navBar.addEventListener("mouseleave", () => {
        dropdown.classList.remove("active");
    });
</script>

</body>
</html>
