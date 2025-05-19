<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 모달창으로 만들것 -->
<!-- 리뷰 폼 -->
<div class="review">
	<h2 class="movieName">영화 이름</h2>

	<!-- 평점 선택버튼 -->
	<div class="rating-buttons">
		<button class="rating-button" data-rating="1" id="btn-good">
			<!-- <img src="egg-icon.png" alt="좋았어요"> -->
			좋았어요~^^
		</button>
		<button class="rating-button" data-rating="0" id="btn-bad">
			<!-- <img src="rotten-icon.png" alt="별로였어요"> -->
			흠~좀 별로였어요;;;
		</button>
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
	<button id="submitReview" onclick="submitReview()">작성완료!</button>
</div>
<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
	$(document).ready(function() {
		const MAX_BYTES = 280;
		// 영화이름과 idx는 parameter로 넘어올 예정
		// const moviename = request.getParameter("moviename");
		// const movieidx = request.getParameter("movieidx");
		// 세션에 있을 useridx도 받아올것
		// const useridx = request.getParameter("movieidx");
		// 대소문자, _ 확인 필요
		let selectedRating = "";
		
		// 텍스트 길이 제한 이벤트
		$("#reviewText").on("input", function() {
			let text = $(this).val();
			let byteLength = TextEncoder().encode(text).length;

			while (byteLength > MAX_BYTES) {
				text = text.slice(0, -1); // 맨 끝 문자 하나씩 제거
				byteLength = TextEncoder().encode(text).length;
			}

			$(this).val(text);
			$("#byteCount").text(byteLength);
		}
		
		// 평점 버튼 클릭 이벤트
		$(".rating-button").on("click", function() {
			selectedRating = $(this).data("rating");

			// 선택된 버튼에 스타일 적용
			$(".rating-button").removeClass("selected");
			$(this).addClass("selected");
		});

		// 리뷰 작성 완료 버튼 클릭 시
		$("#submitReview").on("click", function() {
			const reviewText = $("#reviewText").val();

			if (!selectedRating) {
				alert("평점을 선택해주세요.");
				return;
			}

			// AJAX 비동기 통신
			$.ajax({
				url : '${pageContext.request.contextPath}/review.re', // 서버의 엔드포인트
				type : "POST",
				data : {
					userIdx : 200,//userIdx, 지금은 임의로 넣어둠
					movieIdx : " ",//movieIdx, 지금은 임의로 넣어둠
					movieTitle : " ",//moviename, 지금은 임의로 넣어둠
					Rating : selectedRating,
					Text : reviewText,
				},
				success : function(response) {
					alert("리뷰가 성공적으로 등록되었습니다.");
					// 모달 닫기 또는 초기화
					$("#reviewModal").hide();
					$("#reviewText").val("");
					$(".rating-button").removeClass("selected");
					selectedRating = "";
				},
				error : function() {
					alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
				},
			});
		});
	});
</script>