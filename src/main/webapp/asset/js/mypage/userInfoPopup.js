function attachDynamicEvents(e) {
	const clickedId = e.target.id;
	const userInfo_userName = document.getElementById("userInfo_userName");
	const userInfo_userNickname = document.getElementById("userInfo_userNickname");
	const userInfo_userPhoneNum = document.getElementById("userInfo_userPhoneNum");
	const userInfo_userPw = document.getElementById("userInfo_userPw");


	if (clickedId === "editName") {
		if (e.target.value === "변경하기") {
			userInfo_userName.disabled = false;
			e.target.value = "변경완료";
		} else if (e.target.value === "변경완료") {
			userInfo_userName.disabled = true;
			e.target.value = "변경하기";
		}
	}
	if (clickedId === "editNickname") {
		if (e.target.value === "변경하기") {
			userInfo_userNickname.disabled = false;
			e.target.value = "변경완료";
		} else if (e.target.value === "변경완료") {
			userInfo_userNickname.disabled = true;
			e.target.value = "변경하기";
		}
	}
	if (clickedId === "editPhone") {
		if (e.target.value === "변경하기") {
			userInfo_userPhoneNum.disabled = false;
			e.target.value = "변경완료";
		} else if (e.target.value === "변경완료") {
			userInfo_userPhoneNum.disabled = true;
			e.target.value = "변경하기";
		}
	}
	if (clickedId === "editPw") {
		if (e.target.value === "변경하기") {
			userInfo_userPw.disabled = false;
			e.target.value = "변경완료";
		} else if (e.target.value === "변경완료") {
			userInfo_userPw.disabled = true;
			e.target.value = "변경하기";
		}
	}


}

function btnEditClick() {
	const userInfo_userName = document.getElementById("userInfo_userName");
	const userInfo_userNickame = document.getElementById("userInfo_userNickname");
	const userInfo_userPhoneNum = document.getElementById("userInfo_userPhoneNum");
	const userInfo_userPw = document.getElementById("userInfo_userPw");

	if (userInfo_userName.disabled === false) {
		alert("이름 변경을 완료해주세요");
		return false;
	}

	if (userInfo_userNickname.disabled === false) {
		alert("닉네임 변경을 완료해주세요");
		return false;
	}

	if (userInfo_userPhoneNum.disabled === false) {
		alert("전화번호 변경을 완료해주세요");
		return false;
	}

	if (userInfo_userPw.disabled === false) {
		alert("비밀번호 변경을 완료해주세요");
		return false;
	}

	const idPwRegex = /^[A-Za-z0-9]{4,12}$/;
	if (!idPwRegex.test(userInfo_userPw.value.trim())) {
		alert("비밀번호는 영문과 숫자 조합 4~12자여야 합니다.");
		userInfo_userPw.focus();
		return false;
	}

	// 2. 비밀번호 일치 확인
	/*if (userPw.value !== userPwCheck.value) {
		alert("비밀번호가 일치하지 않습니다.");
		userPwCheck.focus();
		return false;
	}*/

	// 3-1. 이름: 입력 하면 통과
	if (userInfo_userName.value.trim() === "") {
		alert("이름을 입력해주세요.");
		userInfo_userName.focus();
		return false;
	}

	// 3-2. 이름: 한글만 (2~10자 정도 제한 가능)
	const nameRegex = /^[가-힣]{2,10}$/;
	if (!nameRegex.test(userInfo_userName.value.trim())) {
		alert("이름은 한글만 입력 가능합니다. (2~10자)");
		userInfo_userName.focus();
		return false;
	}

	// 3-3. 닉네임: 입력만 하면 통과
	if (userInfo_userNickname.value.trim() === "") {
		alert("닉네임을 입력해주세요.");
		userInfo_userNickname.focus();
		return false;
	}

	// 3-4. 닉네임: 한글, 영어, 숫자만 (2~12자 제한 예시)
	const nicknameRegex = /^[가-힣a-zA-Z0-9]{2,12}$/;
	if (!nicknameRegex.test(userInfo_userNickname.value.trim())) {
		alert("닉네임은 한글, 영어, 숫자만 입력 가능합니다. (2~12자)");
		userInfo_userNickname.focus();
		return false;
	}


	// 5. 전화번호: 010-xxxx-xxxx 형식
	const telRegex = /^010-\d{4}-\d{4}$/;
	if (!telRegex.test(userInfo_userPhoneNum.value)) {
		alert("전화번호는 010-1234-5678 형식으로 입력해야 합니다.");
		userInfo_userPhoneNum.focus();
		return false;
	}


	// 모두 통과

	//Object 담기
	let obj = new Object();
	obj.userIdx = sessionUserIdx;
	obj.userName = userInfo_userName.value;
	obj.userNickname = userInfo_userNickname.value;
	obj.userTel = userInfo_userPhoneNum.value;
	obj.userPw = userInfo_userPw.value;


	$.ajax({
		url: contextPath + '/userUpdate.mew',
		type: 'post',
		data: obj,
		dataType: 'json', //성공 유무
		success: function(res) { // 성공 했을 때
			console.log(res);
			if (res.code == 200) {
				alert('수정완료');
				location.href = contextPath + "/myPagemain.me";
			} else {
				alert(res.msg);
			}
			// location.href = , 보내고 싶은 페이지 이동 
		}
	})
}

function btnCancelClick() {
	location.href = contextPath + '/myPagemain.me';
}