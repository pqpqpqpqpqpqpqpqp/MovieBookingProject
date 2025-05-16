<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="moviechart_view_container" id="movieChart_list">
				<div class="swiper-button-prev" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="false"></div>
				<div class="swiper-wrapper"	style="transform: translate3d(-2024px, 0px, 0px); transition-duration: 0ms;">

					<div class="swiper-slide swiper-slide-movie"
						style="width: 170.4px; margin-right: 32px;">
						<div class="img_wrap" data-scale="false">
							<img src="../img/movie/Avatar.jpeg" alt="아바타"
								onerror="errorImage(this)">
							<div class="movieAgeLimit_wrap">
								<!-- 영상물 등급 노출 변경 2022.08.24 -->
								<i class="cgvIcon etc age12">12</i> \
								<i class="cgvIcon etc ageDay" data-before-text="D - 1">D Day</i>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="false"></div>
				<span class="swiper-notification" aria-live="assertive"	aria-atomic="true"></span> 
			</div>
</body>
</html>