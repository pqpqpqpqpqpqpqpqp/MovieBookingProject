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
<body>
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
				<a href="#" class="menu-item"> <img
					src="https://img.icons8.com/ios/50/lock--v1.png" alt="로그인 아이콘">
					로그인
				</a> <a href="#" class="menu-item"> <img
					src="https://img.icons8.com/ios/50/add-user-male--v1.png"
					alt="회원가입 아이콘"> 회원가입
				</a> <a href="#" class="menu-item"> <img
					src="https://img.icons8.com/ios/50/user--v1.png" alt="MY CGV 아이콘">
					MY CGV
				</a>
			</div>
		<!-- top-container -->
		</div>
	</div>

	<script type="text/javascript">
		document.getElementById("logo").addEventListener("click", function() {
			location.href = "mainHome.vo"; // 컨트롤러 요청
		});
	</script>
</body>
</html>