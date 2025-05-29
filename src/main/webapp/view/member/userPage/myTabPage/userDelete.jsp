<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/mypage.css" />
	<div class="delete_id_container">
		<div class="delete_title">	
			<strong>나의 정보</strong>
			<span class="delete_title_txt">회원탈퇴</span>			
		</div>
		<div class="delete_context">
			<span class="delete_context_txt">그동안 CGV를 이용해주셔서 감사합니다.</span>			
		</div>
		<div class="del_btn">
			<span class="del_btn_txt" onclick="userDeleteClick()">CGV 회원탈퇴</span>
		</div>
	
	</div>
