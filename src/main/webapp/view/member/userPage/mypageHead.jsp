<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/mypage.css" />
<div class="user_mypage_head_info">
	<div class="user_profile_img">
		<img src="<%=request.getContextPath()%>/asset/img/member/userDefault.gif" id = "userImg">
	</div>
	<div class="user_profile_info">
		<div class="user_name_container">
			<strong class="user_name"><strong id="userName">홍길동</strong>님</strong>
			<em id="userId" class="user_id">hong123</em> <span
				class="user_nickname">닉네임 : <span id="userNickname"></span>
			</span>
		</div>
		<div class="user_name_container member">
			<strong>고객님은 <strong class="txt_purple">일반</strong>입니다.
			</strong>
		</div>
	</div>
</div>

<script src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<%
    Object sessionUserIdx = session.getAttribute("userIdx");
    String userIdxStr = sessionUserIdx != null ? sessionUserIdx.toString() : "";
%>
<script>
	function mypageHeadOnload(){
		
		let obj = new Object();
		obj.userIdx = "<%= userIdxStr %>";
		
		$.ajax({
			url : '${pageContext.request.contextPath}/myPagemain.mew',
			type : 'post',
			data : obj,
			dataType : 'json', //성공 유무
			success : function(res) { // 성공 했을 때
				
				const userName = document.getElementById("userName");
				const userId = document.getElementById("userId");
				const userNickname = document.getElementById("userNickname");
				const userImg = document.getElementById("userImg");
				
				userName.textContent = res.data.userName;
				userId.textContent = res.data.userId;
				userNickname.textContent = res.data.userNickname;
				userImg.src = res.data.userImg;
				
			}
		})
	}
	
	$(document).ready(function () {
		mypageHeadOnload();
	});
</script>
