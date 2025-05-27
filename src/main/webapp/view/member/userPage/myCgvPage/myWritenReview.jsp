<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link href ="${pageContext.request.contextPath}/asset/css/mypage.css" rel ="stylesheet ">
<title>Insert title here</title>
<!-- 오른쪽 리뷰 리스트 -->
<%
	String userIdxStr = request.getParameter("userIdx");
	int userIdx = (userIdxStr != null) ? Integer.parseInt(userIdxStr) : 0;
%>

<div class="movie_list_catainer review">
	<h3>내가 쓴 평점</h3>
	

</div>
<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
	$(document).ready(function() {
		const USER_IDX = <%= userIdx %>;
		
		$.ajax({
			url : '${pageContext.request.contextPath}/myReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {
				userIdx : USER_IDX,
			},
			success : function(resp) {
				//기존 리스트 초기화
				$(".movie_list_catainer.review").empty();
				const count = resp?.data?.length || 0;

				if (window.parent && window.parent.document) {
				  $(window.parent.document).find('#review_count').text(count);
				} else {
				  $('#review_count').text(count); // 같은 DOM 내부에 있을 때
				}
				
				console.log(resp.data);
				
				for(let i = 0; i < resp.data.length; i++) {
					let html = 
					'<div class="movie-item">' +
						'<img class="poster" src="${pageContext.request.contextPath}'+resp.data[i].movieImg+'"/>' +
						'<div class="movie-info">' +
							'<h4 id="movieName">' + resp.data[i].movieName + '</h4>' +
							'<div class="meta">' +
								'<span>' + resp.data[i].userNick + ' | </span>' +
								'<span>' + resp.data[i].reviewDate + '</span>' +
							'</div>' +
							'<div class="review_context">' + resp.data[i].reviewContent + 
							'</div>' +
							'<div class="edit_review_txt">' +
							<!--  수정하기 버튼 -->
								'<div class="btn_edit">' +
									'<a href="#" class="write_point">수정하기</a>' +
								'</div>' +
							'</div>' +
						'</div>' +
						'<button class="movie-remove-btn">×</button>' +
					'</div>'	
					 
					 ;
					 
					$(".movie_list_catainer.review").append(html);	
				}
				
			},
			error : function() {
				alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
</script>

