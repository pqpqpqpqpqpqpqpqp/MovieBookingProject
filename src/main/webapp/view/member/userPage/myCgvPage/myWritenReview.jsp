<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link href ="${pageContext.request.contextPath}/asset/css/mypage.css" rel ="stylesheet ">
<link href ="${pageContext.request.contextPath}/asset/css/modal.css" rel ="stylesheet ">
<title>Insert title here</title>
<!-- 오른쪽 리뷰 리스트 -->
<%
	/* String userIdxStr = request.getParameter("userIdx");
	int userIdx = (userIdxStr != null) ? Integer.parseInt(userIdxStr) : 0; */
 	Integer userIdx = (Integer) session.getAttribute("userIdx");
%>

<div class="movie_list_catainer review">
	<h3>내가 쓴 평점</h3>
	

</div>

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
const CONTEXT_PATH = "${pageContext.request.contextPath}";
</script>
<script>
//리뷰 조회

	$(document).ready(function() {
		const USER_IDX = <%= userIdx %>;
		let selectedRating = "";
		
		$.ajax({
			url : CONTEXT_PATH + '/myReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {userIdx : USER_IDX},
			success : function(resp) {
				//기존 리스트 초기화
				$(".movie_list_catainer.review").empty();
				const count = resp?.data?.length || 0;
				
				const reviewCount = resp.data.length;

				if (window.parent && window.parent.document) {
					const $parentReviewEm =$(window.parent.document).find('a[data-target="writtenReviews"] em');
					$parentReviewEm.text(reviewCount);
				} else {
				  $('#review_count').text(count); // 같은 DOM 내부에 있을 때
				}

				for(let i = 0; i < resp.data.length; i++) {
					const review = resp.data[i];
					let scoreText = review.reviewScore > 0 ? "좋았어요" : "별로에요";
					let html = 
					'<div class="movie-item" data-review-idx="' + review.reviewIdx + '">' +
					'<a href="' + CONTEXT_PATH + '/movieDetail.mow?movieIdx=' + review.movieIdx + '">' + 
				      '<img class="poster" src="' + CONTEXT_PATH + review.movieImg + '" alt="' + review.movieName + '">' +
				    '</a>' +
						
						'<div class="movie-info">' +
							'<h4 class="movieName">' + review.movieName + '</h4>' +
							'<div class="meta">' +
								'<span>' + review.userNick + ' | </span>' +
								'<span>' + review.reviewDate + '</span>' +
							'</div>' +
							'<div class="review_context">'+ 
							'<span class="highlight">' + scoreText + '</span>' +
							'<span> |    ' + review.reviewContent + '</span>' +
							'</div>' +
							'<div class="edit_review_txt">' +
								'<div class="btn_edit">' +
									'<a href="#" class="write_point">수정하기</a>' +	
								'</div>' +
							'</div>' +
						'</div>' +
						'<button class="movie-remove-btn">×</button>' +
					'</div>'			
				
					$(".movie_list_catainer.review").append(html);	
				}
				
			},
			error : function() {
				alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
			}
		});
		
		
	});
	
	/*
		리뷰 삭제
	*/
	$(document).on("click", ".movie-remove-btn", function() {
		const reviewBox = $(this).closest('.movie-item');
		const reviewIdx = reviewBox.data('review-idx');
		const userIdx = <%= userIdx %>;
		const countEl = window.parent?.document?.querySelector("#review_count");
		
		if (confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url: '${pageContext.request.contextPath}/deleteReview.re',
				type: 'POST',
				data: {
					reviewIdx: reviewIdx,
					userIdx: userIdx
				},
				success: function(resp) {
					if (resp.code === 200 ) {
						reviewBox.remove(); // DOM에서 삭제
						if (countEl) {
							let current = parseInt(countEl.innerText);
							if (!isNaN(current) && current > 0) {
								countEl.innerText = current - 1;
							}
						}
						alert("삭제되었습니다.");
					} else {
						alert("삭제 실패: " + resp.message);
					}
				},
				error: function() {
					alert("리뷰 삭제 요청 중 오류가 발생했습니다.");
				}
			});
		}
	});

	
	let selectedRating = null;

	$(document).on("click", ".write_point", function(e) {
	  e.preventDefault();

	  const reviewBox = $(this).closest(".movie-item");
	  const reviewIdx = reviewBox.data("review-idx");
	  const movieName = reviewBox.find(".movieName").text().trim();
	  const reviewContent = reviewBox.find(".review_context span:last").text().trim();
	  const scoreText = reviewBox.find(".review_context span:first").text().trim();
	  const userNick = reviewBox.find(".meta span:first").text().split(" | ")[0];
	  const userImg = reviewBox.find("img.poster").attr("src") || "/default/profile.png";

	  const selectedScore = scoreText === "좋았어요~^^" ? 1 : 0;

	  const $modal = $("#reviewModal");
	  $modal.find(".movieName").text(movieName);
	  $modal.find("#reviewText").val(reviewContent);
	  $modal.find("#byteCount").text(new TextEncoder().encode(reviewContent).length);
	  $modal.find(".rating-button").removeClass("selected");
	  if (selectedScore === 1) $modal.find("#btn-good").addClass("selected");
	  else $modal.find("#btn-bad").addClass("selected");

	  selectedRating = selectedScore;
	  $modal.find(".nickname").text(userNick);
	  $modal.find(".profile-info img").attr("src", userImg);
	  $modal.find("#submitReview").data("review-idx", reviewIdx);
	  $modal.fadeIn(200);
	});

	$("#reviewModal .rating-button").on("click", function () {
	  selectedRating = $(this).data("rating");
	  $("#reviewModal .rating-button").removeClass("selected");
	  $(this).addClass("selected");
	});

	//리뷰 닫기버튼과 모달창 영역 밖에 누르면 나가게 만들기
	
	$("#closeReviewModal").on("click", function () {
		  $("#reviewModal").fadeOut(200);
		});
	$("#reviewModal").on("click", function (e) {
		  if (e.target === this) {
		    $(this).fadeOut(200);
		  }
		});
	
	//리뷰창 내용물 byte 수 카운팅
	function getByteLength(text) {
  let byte = 0;
  for (let i = 0; i < text.length; i++) {
    const ch = text.charAt(i);
    if (escape(ch).length > 4) {
      byte += 3;
    } else {
      byte += 1;
    }
  }
  return byte;
}
	$("#reviewText").on("input", function () {
  const text = $(this).val();
  const byteLength = getByteLength(text);

  $("#byteCount").text(byteLength);

  if (byteLength > 280) {
    $("#byteCount").css("color", "red");
  } else {
    $("#byteCount").css("color", "");
  }
});
	
	//리뷰 수정하기 작성 기능
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

		  const byteLength = getByteLength(reviewText);
		  if (byteLength > 280) {
		    alert("작성 내용이 초과하였습니다. (최대 280byte)");
		    return;
		  }

		  $.ajax({
		    url: CONTEXT_PATH + "/eidtReview.re",
		    type: "POST",
		    data: {
		      reviewIdx: reviewIdx,
		      content: reviewText,
		      score: selectedRating,
		    },
		    success: function (resp) {
		      if (resp.code === 200) {
		        alert("리뷰가 수정되었습니다.");
		        $("#reviewModal").fadeOut(200); 
		        location.reload(); // 혹은 DOM 갱신
		      } else {
		        alert("수정 실패: " + resp.message);
		      }
		    },
		    error: function () {
		      alert("리뷰 수정 요청 실패");
		    },
		  });
		});
</script>

