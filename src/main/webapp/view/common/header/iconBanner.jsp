<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=1024">

<link rel="alternate" href="http://m.cgv.co.kr">

<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014//js/system/system.packed.js">
	
</script>
<style>
.top-bar {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px 30px;
	background-color: white;
	border-bottom: 1px solid #ddd;
}

.top-bar .top-container {
	display: flex;
	justify-content: space-between;
	width: 980px;
}

.top-bar .logo-area {
	display: flex;
	align-items: center;
}

.top-bar .logo-area img {
	height: 60px;
	margin-right: 10px;
}

.top-bar .logo-area span {
	font-size: 14px;
	letter-spacing: 5px;
	color: #111;
}

.top-bar .menu-area {
	display: flex;
	gap: 25px;
	align-items: center;
}

.top-bar .menu-area .menu-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-size: 13px;
	color: #333;
	text-decoration: none;
}

.top-bar .menu-area .menu-item img {
	width: 20px;
	height: 20px;
	margin-bottom: 3px;
}

.top-bar .menu-area .menu-item:hover {
	color: #ff3d00;
}
</style>

</head>
<meta charset="UTF-8">
<title>헤더 아이콘 배너</title>
</head>
<body onload="onloadHeader()">
	<div class="top-bar">
		<div class="top-container">
			<div class="logo-area">
				<!--  onclick 넣어주기 -->

				<h1>
					<img
						src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png"
						id="logo" style="cursor: pointer;" alt="C G V"><span>홍남제황
						Team</span>
				</h1>
			</div>

			<!--  메뉴 영역 -->
			<div class="menu-area">
				<a onclick="inOutAction()" class="menu-item"> <img
					src="https://img.icons8.com/ios/50/lock--v1.png" alt="로그인 아이콘">
					<span id="loginText">로그인</span>
				</a> 
				<a href="${pageContext.request.contextPath}/userRegister.me" class="menu-item"> <img
					src="https://img.icons8.com/ios/50/add-user-male--v1.png"
					alt="회원가입 아이콘"> 회원가입
				</a> 
				<a onclick="myPageAction()" class="menu-item"> <img
					src="https://img.icons8.com/ios/50/user--v1.png" alt="MY CGV 아이콘">
					MY CGV
				</a>
			</div>
			<!-- top-container -->
		</div>
	</div>
<script>
	// 로그인 여부 확인: JSP에서 전달된 값 사용
	const isLoggedIn = <%=session.getAttribute("userIdx") != null%>;

	// 페이지 로드 시 로그인/로그아웃 텍스트 설정
	window.onload = function () {
		const loginText = document.getElementById("loginText");
		loginText.textContent = isLoggedIn ? "로그아웃" : "로그인";

		// 로고 클릭 시 메인 페이지로 이동
		document.getElementById("logo").addEventListener("click", function () {
			location.href = "${pageContext.request.contextPath}/mainHome.vo";
		});
	};

	// 로그인 또는 로그아웃 처리
	function inOutAction() {
		if (isLoggedIn) {
			location.href = "${pageContext.request.contextPath}/logout.me";
		} else {
			location.href = "${pageContext.request.contextPath}/userLogin.me";
		}
	}

	// 마이페이지 이동
	function myPageAction() {
		if (isLoggedIn) {
			location.href = "${pageContext.request.contextPath}/myPagemain.me";
		} else {
			location.href = "${pageContext.request.contextPath}/userLogin.me";
		}
	}
</script>

</body>
</html>