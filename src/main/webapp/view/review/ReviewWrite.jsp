<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.review {
	width: 480px;
	padding: 20px;
	background: white;
	border-radius: 8px;
	font-family: 'Noto Sans KR', sans-serif;
	position: relative;
}

.movieName {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 16px;
	text-align: center;
}

.rating-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 8px;
	margin-bottom: 12px;
}

.rating-button {
	display: inline-block;
	width: 180px;
	padding: 10px;
	margin: 0;
	flex-shrink: 0;
	border: 2px solid #ccc;
	border-radius: 10px;
	background-color: white;
	font-size: 13px;
	cursor: pointer;
	position: relative;
	transition: all 0.2s;
}

.rating-button.selected {
	border: 3px solid #ff4e00;
	background-color: #fff5ee;
	font-weight: bold;
}

.rating-button:first-child::before {
	content: "🥚";
	position: absolute;
	left: 5px;
	top: 5px;
	font-size: 20px;
}

.rating-button:last-child::before {
	content: "💬";
	position: absolute;
	left: 5px;
	top: 5px;
	font-size: 20px;
}

textarea#reviewText {
	width: 100%;
	height: 90px;
	margin-top: 12px;
	padding: 10px;
	font-size: 14px;
	resize: none;
	border: 1px solid #ccc;
	border-radius: 6px;
}

.guideline-box {
	text-align: left;
	margin-top: 6px;
	font-size: 12px;
	color: #666;
}

.byte-count {
	text-align: right;
	margin-top: 4px;
	font-size: 12px;
	color: #999;
}

#submitReview {
	width: 100%;
	margin-top: 10px;
	padding: 10px;
	background-color: #ff4e00;
	border: none;
	color: white;
	font-weight: bold;
	font-size: 15px;
	border-radius: 6px;
	cursor: pointer;
	transition: background 0.2s;
}

#submitReview:hover {
	background-color: #e03d00;
}

/* 유저 정보 (프로필 + 닉네임) placeholder */
.profile-info {
	display: flex;
	flex-direction: column; /* 세로 정렬 */
	align-items: center; /* 가운데 정렬 */
	justify-content: center;
	margin: 0 10px; /* 좌우 간격 확보 */
}

.profile-info img {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	margin: 0 0 4px 0; /* 아래로 간격 */
}

.profile-info .nickname {
	font-size: 14px;
	color: #444;
	font-weight: bold;
	text-align: center;
}
</style>
<!-- 모달창으로 만들것 -->
<%
// 영화페이지에서 올때는 세션에 있을 userIdx로 db 검색 필요
// 유저번호, 프로필, 닉네임
/* int userIdx = (Integer) request.getAttribute("userIdx");
String userImg = (String) request.getAttribute("userImg");
String userNick = (String) request.getAttribute("userNick"); */
// 영화번호, 이름
//int movieIdx = (Integer) request.getAttribute("movieIdx");
//String movieName = (String) request.getAttribute("movieName");
int userIdx = 5;
String userImg = "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fplay-lh.googleusercontent.com%2F38AGKCqmbjZ9OuWx4YjssAz3Y0DTWbiM5HB0ove1pNBq_o9mtWfGszjZNxZdwt_vgHo&type=ff332_332";
String userNick = "끼끼";
int movieIdx = 1;
String movieName = "겨울왕국";
%>
<!-- 리뷰 폼 -->
<div class="review">
	<h2 class="movieName"><%=movieName%></h2>

	<!-- 평점 선택버튼 + 프로필 -->
	<div class="rating-row">
		<button class="rating-button" data-rating="1" id="btn-good">
			좋았어요~^^</button>

		<!-- 프로필사진 + 닉네임 -->
		<div class="profile-info">
			<img src="<%=userImg%>" alt="프로필"> <span class="nickname"><%=userNick%></span>
		</div>

		<button class="rating-button" data-rating="0" id="btn-bad">
			흠~좀 별로였어요;;;</button>
	</div>

	<!-- 텍스트 입력 -->
	<textarea id="reviewText" maxlength="280"
		placeholder="운영원칙에 어긋나는 게시글은 제재 조치를 받을 수 있습니다."></textarea>

	<div class="guideline-box">
		<small> <a id="guidelineLink">운영원칙 ?</a>
		</small>
	</div>

	<div class="byte-count">
		<span id="byteCount">0</span>/280(byte)
	</div>

	<!-- 제출 버튼 -->
	<button id="submitReview">작성완료!</button>
</div>
<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
	$(document).ready(function() {
		// 대소문자, _ 확인 필요
		const MAX_BYTES = 280;
		const USER_IDX = <%=userIdx%>;
		const MOVIE_IDX = <%=movieIdx%>;
		
		let selectedRating = "";

		// 텍스트 길이 제한 이벤트
		$("#reviewText").on("input", function() {
			let text = $(this).val();
			let encoder = new TextEncoder();
			let byteLength = encoder.encode(text).length;

			if (byteLength > MAX_BYTES) {
				$("#byteCount").css("color", "red");
			} else {
				$("#byteCount").css("color", "inherit");
			}

			$(this).val(text);
			$("#byteCount").text(byteLength);
		});

		// 평점 버튼 클릭 이벤트
		$(".rating-button").on("click", function() {
			selectedRating = $(this).data("rating");

			// 선택된 버튼에 스타일 적용
			$(".rating-button").removeClass("selected");
			$(this).addClass("selected");
		});

		// 리뷰 작성 완료 버튼 클릭 시
		$("#submitReview").on("click", function() {
			$("#submitReview").prop("disabled", true);
			const reviewText = $("#reviewText").val();

			if (selectedRating === "") {
				alert("평점을 선택해주세요.");
				return;
			} else if (!reviewText.trim()) {
				alert("리뷰 내용을 입력해주세요.");
				return;
			}

			// AJAX 비동기 통신
			$.ajax({
				url : '${pageContext.request.contextPath}/reviewWrite.re', // 서버의 엔드포인트
				type : "POST",
				data : {
					userIdx : USER_IDX,
					movieIdx : MOVIE_IDX,
					score : selectedRating,
					content : reviewText,
				},
				success : function(response) {
					alert("리뷰가 성공적으로 등록되었습니다.");
					// 초기화
					$("#reviewText").val("");
					$(".rating-button").removeClass("selected");
					selectedRating = "";
					console.log(response);
				},
				error : function() {
					alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
				},
				complete : function() {
					$("#submitReview").prop("disabled", false);
				}
			});
		});
	});
</script>