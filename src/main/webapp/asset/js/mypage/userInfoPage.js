/******************
 *  회원 정보
 ******************/

//회원정보 설정
function myPageUserInfo() {
	const obj = { userIdx: sessionUserIdx }; // 전역 변수

	$.ajax({
		url: contextPath + "/userInfo.mew", //해결 완  
		type: "post",
		data: obj,
		dataType: "json",
		success: function(res) {

			const data = res.data;
			if (res.code === 500) {
				alert('로그인 없음');
				return;
			}

			document.getElementById("userInfo_userName").value = data.userName;
			document.getElementById("userInfo_userNickname").value = data.userNickname;
			document.getElementById("userInfo_userId").value = data.userId;
			document.getElementById("userInfo_userBirthDay").value = data.birthday;
			document.getElementById("userInfo_userPhoneNum").value = data.userTel;
			document.getElementById("userInfo_userPw").value = data.userPw;


		}
	});
}

