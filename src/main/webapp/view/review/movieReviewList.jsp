<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<h2>영화 상세에서 영화에 달린 리뷰를 확인하는 페이지 movieidx기반으로 검색</h2>
<% 
// int movieidx = (Integer) request.getAttribute("movieIdx"); 
// 임시데이터
int movieidx = 1;
%>

<h3>가져온 리뷰를 담을 div</h3>
<div class="review-box"></div>

<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
	$(document).ready(function() {
		const MOVIE_IDX = <%= movieidx %>;
		$.ajax({
			url : '${pageContext.request.contextPath}/movieReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {
				movieIdx : MOVIE_IDX,
			},
			success : function(resp) {
				console.log(resp.data);
			},
			error : function() {
				alert("리뷰 불러오기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
</script>