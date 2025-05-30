<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세븐 베일즈 - 메인 배너</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	
}
.video_body{
min-width: 100%;
background-color: black;
}


.video_body .video_container {
	width: 100%;
	max-width: 1280px; /* ✅ 유연한 해상도 대응 */
	min-height: 550px;
	margin: 0 auto;
	padding: 0 20px;
	background-color: black;
}

.video_body .video_container .banner {
	position: relative;
	width: 100%;
	aspect-ratio: 16/9;
	height: 550px; 
	overflow: hidden;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: flex-start;
}

.video_body .video_container .banner::before {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	background: linear-gradient(to right, rgba(0, 0, 0, 0.8) 1%, rgba(0, 0, 0, 0.6) 2%, rgba(0, 0, 0, 0.2) 5%, rgba(0, 0, 0, 0) 7%, 
	rgba(0, 0, 0, 0) 93%, rgba(0, 0, 0, 0.8) 95%, rgba(0, 0, 0, 0.6) 97%, rgba(0, 0, 0, 1) 100%);
	z-index: 1;
}

.video_body .video_container .banner video {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
	z-index: 0;
	opacity: 0.4;
	background-color: black;
}

.video_body .video_container .banner .banner-content {
	position: absolute;
	top: 50%;
	left: 100px;
	transform: translateY(-50%);
	z-index: 2;
	color: white;
	width: 600px;
}

.video_body .video_container .banner .banner-content h1 {
	font-size: 3rem;
	font-weight: 900;
	margin-bottom: 20px;
}

.video_body .video_container .banner .banner-content p {
	font-size: 1.25rem;
	margin-bottom: 10px;
}

.video_body .video_container .banner .banner-content .banner-buttons {
	margin-top: 20px;
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.video_body .video_container .banner .banner-content .banner-buttons button {
	padding: 10px 20px;
	border: none;
	font-size: 1rem;
	cursor: pointer;
	white-space: nowrap;
}

.video_body .video_container .banner .banner-content .banner-buttons .btn-detail {
	background-color: #f1f1f1;
	color: #000;
	border-radius: 20px;
}

.video_body .video_container .banner .banner-content .banner-buttons .btn-play, .btn-mute {
	background-color: transparent;
	border: 2px solid #fff;
	color: #fff;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	font-size: 18px;
	line-height: 36px;
	text-align: center;
}

/* ✅ 반응형 대응 */
@media ( max-width : 768px) {
	.video_body .video_container .banner {
		flex-direction: column;
		justify-content: center;
	}
	.video_body .video_container .banner .banner-content {
		text-align: center;
		padding: 20px;
	}
	.video_body .video_container .banner .banner-content .banner-content h1 {
		font-size: 2rem;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.video_body .video_container .banner .banner-content p {
		font-size: 1rem;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
}
</style>
</head>

<body>
<div class= "video_body">
	<div class="video_container">
		<div class="banner">
			<video autoplay muted loop playsinline>
				<source
					src="${pageContext.request.contextPath}/asset/mp4/movie/viewMainShow.mp4"
					type="video/mp4">
			</video>

			<div class="banner-content">
				<h1>세븐 베일즈</h1>
				<p>찰스는 죽었어!</p>
				<p>무대의 주인은 나야</p>
				<div class="banner-buttons">
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
