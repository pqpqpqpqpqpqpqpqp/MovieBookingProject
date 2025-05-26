// /asset/js/mypage/userInfoPage.js

function fetchUserInfo() {
	const obj = { userIdx: sessionUserIdx }; // 전역 변수

	$.ajax({
		url: contextPath + "/userInfo.mew",
		type: "post",
		data: obj,
		dataType: "json",
		success: function (res) {
			console.log(res.data);

			document.getElementById("userName").value = userName;
			document.getElementById("userId").value = userId;
			document.getElementById("userBirthDay").value = userBirthDay;
			document.getElementById("userPhoneNum").value = userPhoneNum;
		}
	});
}
