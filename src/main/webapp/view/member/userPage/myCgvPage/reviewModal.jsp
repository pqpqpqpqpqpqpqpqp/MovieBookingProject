<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.6);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.modal-content {
  position: relative;
  background: white;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 0 20px rgba(0,0,0,0.2);
}

.modal-close {
  position: absolute;
  top: 10px;
  right: 12px;
  background: transparent;
  border: none;
  font-size: 28px;
  font-weight: bold;
  color: #888;
  cursor: pointer;
}

.modal-close:hover {
  color: #333;
}


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
// int movieIdx = (Integer) request.getAttribute("movieIdx");
// String movieName = (String) request.getAttribute("movieName");

// 테스트용 임시 데이터 - 추후 삭제할것

%>
	<!-- 모달 트리거 버튼 -->
	<button id="openReviewModal">리뷰 작성하기</button>

	<!-- 모달 배경 및 컨테이너 -->
	<div id="reviewModal" class="modal-overlay" style="display:none;">
	  	<div class="modal-content">
			<!-- 리뷰 폼 -->
			<div class="review">
				<h2 class="movieName"></h2>
				<!-- 평점 선택버튼 + 프로필 -->
				<div class="rating-row">
					<button class="rating-button" data-rating="1" id="btn-good">
						좋았어요~^^</button>
					<!-- 프로필사진 + 닉네임 -->
					<div class="profile-info">
						<img src="" alt="프로필"> <span class="nickname"></span>
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


$(document).on("click", ".write_point", function(e) {
	  e.preventDefault();

	  const reviewBox = $(this).closest(".movie-item");
	  const reviewIdx = reviewBox.data("review-idx");
	  const movieName = reviewBox.find(".movieName").text().trim();
	  const reviewContent = reviewBox.find(".review_context span:last").text().trim();
	  const scoreText = reviewBox.find(".review_context span:first").text().trim();
	  const userNick = reviewBox.find(".meta span:first").text().split(" | ")[0]; // 유저 닉네임
	  const userImg = reviewBox.find("img.poster").attr("src").replace(/movieposter\/.*/, "profile.png"); // 대체용 예시

	  const selectedScore = scoreText === "좋았어요~^^" ? 1 : 0;


	  // 모달에 정보 반영
	 // 모달 내부 요소를 정확히 타겟팅
		const $modal = $("#reviewModal");
		$modal.find(".movieName").text(movieName);
		$modal.find("#reviewText").val(reviewContent);
		$modal.find("#byteCount").text(new TextEncoder().encode(reviewContent).length);
		$modal.find(".rating-button").removeClass("selected");
		
		if (selectedScore === 1) {
		  $modal.find("#btn-good").addClass("selected");
		} else {
		  $modal.find("#btn-bad").addClass("selected");
		}
		
		$modal.find(".nickname").text(userNick);
		$modal.find(".profile-info img").attr("src", userImg);
		
		// reviewIdx 저장
		$modal.find("#submitReview").data("review-idx", reviewIdx);
		$modal.fadeIn(200);

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
		$("#submitReview").on("click", function () {
		  const reviewIdx = $(this).data("review-idx");
		  const reviewText = $("#reviewText").val().trim();
		  const selectedRating = $(".rating-button.selected").data("rating");

		  if (selectedRating === undefined) {
		    alert("평점을 선택해주세요.");
		    return;
		  }

		  if (!reviewText) {
		    alert("리뷰 내용을 입력해주세요.");
		    return;
		  }


			// AJAX 비동기 통신
		  $.ajax({
			    url: CONTEXT_PATH + "/updateReview.re",
			    type: "POST",
			    data: {
			      reviewIdx: reviewIdx,
			      content: reviewText,
			      score: selectedRating
			    },
			    success: function (resp) {
			      if (resp.code === 200 || resp.status === 200) {
			        alert("리뷰가 수정되었습니다.");
			        location.reload(); // 또는 DOM만 업데이트 가능
			      } else {
			        alert("수정 실패: " + resp.message);
			      }
			    },
			    error: function () {
			      alert("서버 오류: 리뷰 수정 실패");
			    }
			  });
			});

</script>