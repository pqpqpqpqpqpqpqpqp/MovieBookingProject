<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CGV 통합 드롭다운 메뉴</title>
<style>
.nav-bar {
	border-bottom: 3px solid red;
	border-top: 1px solid #ccc;
	background-color: white;
	position: relative;
	display: flex;
	justify-content: center;
	align-content: center;
}

.nav-bar .menu-container {
	position: relative;
	width: 980px;
	height: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 50px;
}

.nav-bar .menu-container .menu {
	display: flex;
	list-style: none;
	margin: 0;
	padding: 0;
	display:flex;
	justify-content: flex-start;
	
	
}

.nav-bar .menu-container .menu>li {
	padding: 15px 0px;
	padding-left: 0px;
	padding-right: 40px;
	cursor: pointer;
	font-weight: bold;
	position: relative;
	font-size: large;
	text-align: left;
}

.nav-bar .menu-container .menu>li:hover {
	color: red;
	border-bottom: 2px solid red;
}

.nav-bar .menu-container .menu:hover ~ .dropdown-wrapper {
	display: flex;
}

.nav-bar .menu-container .search-box {
	display: flex;
	align-items: center;
}

.nav-bar .menu-container .search-box input[type="text"] {
	border: none;
	border-bottom: 1px solid #999;
	padding: 5px 10px;
	font-size: 14px;
	outline: none;
}

.nav-bar .menu-container .search-box img {
	width: 18px;
	height: 18px;
}


.nav-bar .dropdown-wrapper {
	display: none;
	position: absolute;
	top: 51px;
	left: 0px;
	width: max-content;
	min-width: 100%;
	background-color: white;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 10;
	gap: 30px;
/* 	padding: 20px 10px; */
	flex-direction: row;
	justify-content: center;
	border-top: 3px solid red;
	transform: translateY(0px);
	transition: opacity 0.3s ease, transform 0.3s ease;
}
.nav-bar .dropdown-wrapper .dropdown-wrapper-container{
	display: flex;
	width: 980px;
	height: 100%;
	justify-content: flex-start;
	align-items: flex-start;
	

}

.nav-bar .dropdown-wrapper.active {
	display: flex;
	animation: slideDown 0.5s ease-out forwards;
}

/* 사라질 때 (선택사항) */
.nav-bar .dropdown-wrapper.hide {
	animation: slideUp 0.4s ease-in forwards;
}

/* slideDown 애니메이션 */
@keyframes slideDown {
	0% {
		opacity: 0;
		transform: translateY(0px);
		padding-top: 0;
		padding-bottom: 0;
	}

	100%
	{
	 opacity: 1;
	transform:translateY(0);
	padding-top:20px;
	padding-bottom:30px;
	}
}

/* slideUp 애니메이션 (선택) */
@keyframes slideUp { 
	0% {
		opacity: 1;
		transform: translateY(0);
		padding-top: 20px;
		padding-bottom: 30px;
	}

	100%
	{
	opacity:0;
	transform:translateY(0px);
	padding-top:0;
	padding-bottom:0;
	}
}


}
}
.dropdown-section {
	display: flex;
	flex-direction: column;
	width: 120px;
	flex: none;
}

.nav-bar .dropdown-wrapper .dropdown-wrapper-container .dropdown-section h4 {
	margin: 0 0 10px;
	font-size: 15px;
	color: #000;
	padding-bottom: 5px; 
	width: 120px;
}

.nav-bar .dropdown-wrapper .dropdown-section ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.nav-bar .dropdown-wrapper .dropdown-section ul li {
	font-size: 13px;
	color: #333;
	margin: 6px 0;
	cursor: pointer;
	transition: color 0.2s ease; /* 부드러운 색 변화 효과 */
}

.nav-bar .dropdown-wrapper .dropdown-section ul li:hover {
	color: red; /*  마우스를 올렸을 때 빨간색으로 */
	text-decoration: none; /* 기존 밑줄 제거 */
}
</style>

</head>
<body>

	<!-- 상단 메뉴 -->
	<div class="nav-bar">
		<div class="menu-container">
			<ul class="menu" id="menuBar">
				<li class="movieChart">영화</li>
				<li>극장</li>
				<li class="fastTicketing">예매</li>
<!-- 				<li>스토어</li> -->
<!-- 				<li>이벤트</li> -->
<!-- 				<li>혜택</li> -->
			</ul>
			<!-- 검색창 -->
			<div class="search-box">
				<input type="text" placeholder="나모그세"> <img
					src="https://img.icons8.com/ios/50/search--v1.png" alt="검색">
			</div>
		</div>

		<!-- 통합 드롭다운 메뉴 -->
		<div class="dropdown-wrapper" id="dropDown">
			<div class="dropdown-wrapper-container">
				<div class="dropdown-section">
					<h4 class="movieChart">영화</h4>
					<ul>
						<li class="movieChart">무비차트</li>
	<!-- 					<li>아트하우스</li> -->
	<!-- 					<li>ICECON</li> -->
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
					<h4 class="fastTicketing">예매</h4>
					<ul>
						<li class="fastTicketing">빠른예매</li>
	<!-- 					<li>상영스케줄</li> -->
	<!-- 					<li>English Ticketing</li> -->
	<!-- 					<li>English Schedule</li> -->
					</ul>
				</div>
	<!-- 			<div class="dropdown-section"> -->
	<!-- 				<h4>스토어</h4> -->
	<!-- 				<ul> -->
	<!-- 					<li>패키지</li> -->
	<!-- 					<li>영화관람권</li> -->
	<!-- 					<li>기프트카드</li> -->
	<!-- 					<li>콤보</li> -->
	<!-- 					<li>팝콘</li> -->
	<!-- 					<li>음료</li> -->
	<!-- 					<li>스낵</li> -->
	<!-- 					<li>씨네샵</li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!-- 			<div class="dropdown-section"> -->
	<!-- 				<h4>이벤트</h4> -->
	<!-- 				<ul> -->
	<!-- 					<li>SPECIAL</li> -->
	<!-- 					<li>영화/예매</li> -->
	<!-- 					<li>멤버십/CLUB</li> -->
	<!-- 					<li>CGV 극장별</li> -->
	<!-- 					<li>제휴할인</li> -->
	<!-- 					<li>당첨자 발표</li> -->
	<!-- 					<li>종료된 이벤트</li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->
>>>>>>> test
			</div>
		</div>
	</div>
<script>
    const menuBar = document.getElementById("menuBar");
    const dropdown = document.getElementById("dropDown");

    let isOverMenu = false;
    let isOverDropdown = false;

    // 메뉴에 마우스 진입
    menuBar.addEventListener("mouseenter", () => {
        isOverMenu = true;
        showDropdown();
    });

    // 메뉴에서 마우스 나감
    menuBar.addEventListener("mouseleave", () => {
        isOverMenu = false;
        checkMouseLeave();
    });

    // 드롭다운에 마우스 진입
    dropdown.addEventListener("mouseenter", () => {
        isOverDropdown = true;
        showDropdown();
    });

    // 드롭다운에서 마우스 나감
    dropdown.addEventListener("mouseleave", () => {
        isOverDropdown = false;
        checkMouseLeave();
    });

    function showDropdown() {
        dropdown.classList.remove("hide");
        dropdown.classList.add("active");
        dropdown.style.display = "flex";
    }

    function checkMouseLeave() {
        if (!isOverMenu && !isOverDropdown) {
            dropdown.classList.remove("active");
            dropdown.classList.add("hide");

            // 애니메이션 후 완전히 숨김 처리
            setTimeout(() => {
                if (dropdown.classList.contains("hide")) {
                    dropdown.style.display = "none";
                }
            }, 400); // slideUp duration과 동일하게
        }
    }
</script>


<script>
	function fastReserveClick(){
		location.href = "${pageContext.request.contextPath}/testReserve.ti";
	}
</script>

<script>
	
	// 상단 영화 / 드롭다운 속 영화, 무비차트 클릭 시 무비차트 페이지로 이동
	var movieLinks = document.querySelectorAll(".movieChart");

	for (var i = 0; i < movieLinks.length; i++) {
		movieLinks[i].addEventListener("click", function () {
			location.href = "${pageContext.request.contextPath}/view/movie/MovieChart.jsp";
		});
	}
	
	// 상단 예매 / 드롭다운 속 예매, 빠른예매 클릭 시 빠른예매 페이지로 이동
	var ticketLinks = document.querySelectorAll(".fastTicketing");
	
	for (var i = 0; i < ticketLinks.length; i++) {
		ticketLinks[i].addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/view/ticket/fastTicketMain.jsp";
		});
	}

	
</script>

</body>
</html>
