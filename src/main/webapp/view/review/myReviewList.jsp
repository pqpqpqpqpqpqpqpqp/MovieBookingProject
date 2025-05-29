<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<h2>내 정보에서 내가 쓴 리뷰를 확인하는 페이지 useridx(세션에 있음)기반으로 검색</h2>
<% 
// int useridx = (Integer) session.getAttribute("userIdx"); 
// 임시데이터
int useridx = 2;
%>

<h3>가져온 리뷰를 담을 div</h3>
<div class="review-box"></div>

<h4>리뷰 삭제 버튼</h4>
<button class="review-del-btn"></button>

<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>

//리뷰 
	$(document).ready(function() {
		const USER_IDX = <%= useridx %>;
		$.ajax({
			url : '${pageContext.request.contextPath}/myReviewList.re', // 서버의 엔드포인트
			type : "GET",
			data : {
				userIdx : USER_IDX,
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