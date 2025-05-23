<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/mypage.css" />
	<div class="user_mypage_head_info">
		<div class="user_profile_img">
			<img  src="<%= request.getContextPath() %>/asset/img/member/userDefault.gif">
		</div>
		<div class="user_profile_info">
			<div class="user_name_container">
				<strong  class="user_name"><strong id="userName">홍길동</strong>님</strong>
				<em id="userId" class="user_id">hong123</em>
				<span  class="user_nickname">닉네임 : <span id="userNickname"></span>닉네임을 설정해주세요.</span>
				<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
			</div>
			<div class="user_name_container member">
				<strong>고객님은 <strong class="txt_purple">일반</strong>입니다.</strong>
			</div>
		</div>
	</div>
