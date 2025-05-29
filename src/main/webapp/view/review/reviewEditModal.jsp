<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href ="${pageContext.request.contextPath}/asset/css/modal.css" rel ="stylesheet ">


<!-- 모달창으로 만들것 -->
<%
// 영화페이지에서 올때는 세션에 있을 userIdx로 db 검색 필요
// 유저번호, 프로필, 닉네임
/* int userIdx = (Integer) request.getAttribute("userIdx");
String userImg = (String) request.getAttribute("userImg");
String userNick = (String) request.getAttribute("userNick"); */
// 영화번호, 이름
// int movieIdx = (Integer) request.getAttribute("movieIdx");
// String movieName = (String) request.getAttribute("movieName");

// 테스트용 임시 데이터 - 추후 삭제할것
int userIdx = 6;
String userImg = "../../asset/img/user/default.jpeg";
String userNick = "뇨끼";
int movieIdx = 1;
String movieName = "겨울왕국";
%>
	<!-- 모달 트리거 버튼 -->
	<button id="openReviewModal">리뷰 작성하기</button>

	<!-- 모달 배경 및 컨테이너 -->
	<div id="reviewModal" class="modal-overlay" style="display:none;">
	  	<div class="modal-content">
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
					<button class="rating-button" data-rating="0" id="btn-bad">흠~좀 별로였어요;;;</button>
				</div>
				<!-- 텍스트 입력 -->
				<textarea id="reviewText" maxlength="280" placeholder="운영원칙에 어긋나는 게시글은 제재 조치를 받을 수 있습니다."></textarea>
				<div class="byte-count">
					<span id="byteCount">0</span>/280(byte)
				</div>
				<!-- 제출 버튼 -->
				<button id="submitReview">작성완료!</button>
			</div>
		<!-- 닫기 버튼 -->
	    <button id="closeReviewModal" class="modal-close">×</button>
		</div>
	</div>
<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
//모달 열기 / 닫기 기능
$("#openReviewModal").on("click", function() {
  $("#reviewModal").fadeIn(200);
});

$("#closeReviewModal").on("click", function() {
  $("#reviewModal").fadeOut(200);
});

// 바깥 영역 클릭 시 닫기
$("#reviewModal").on("click", function(e) {
  if (e.target === this) {
    $(this).fadeOut(200);
  }
});

</script>

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