<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/userRegister.css" />

</head>
<body>
	<div class="register-container">
		<h2>회원가입</h2>
		<div class="form-group">
			<label for="userId">아이디</label> <input type="text" id="userId"
				required>
			<button type="button" class="submit-btn" onclick="idCheck()">중복체크</button>
		</div>
		<div class="form-group">
			<label for="userPw">비밀번호</label> <input type="password" id="userPw"
				required>
		</div>
		<div class="form-group">
			<label for="userPwCheck">비밀번호 확인</label> <input type="password"
				id="userPwCheck" required>
			<div class="error" id="pwError"></div>
		</div>
		<div class="form-group">
			<label for="userName">이름</label> <input type="text" id="userName"
				required>
		</div>
		<div class="form-group">
			<label for="userNickname">닉네임</label> <input type="text"
				id="userNickname" required>
		</div>
		<div class="form-group">
			<label for="userNum">주민등록번호</label> <input type="text" id="userNum"
				placeholder="예: 900101-1234567" required>
		</div>
		<div class="form-group">
			<label for="userTel">전화번호</label> <input type="text" id="userTel"
				required>
		</div>
		<button type="button" class="submit-btn" onclick="joinAction()">가입하기</button>
		<div class="form-footer">
			이미 계정이 있으신가요? <a href="userLogin.jsp">로그인</a>
		</div>
	</div>
	<script
		src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
	<script>
		let idCheck = '중복';

		function idCheck() {
			const userId = document.getElementById('userId');

			let obj = new Object();

			obj.userId = userId.value;

			$.ajax({
				url : '${pageContext.request.contextPath}/register.api',
				type : 'post',
				data : obj,
				dataType : 'json', //성공 유무
				success : function(res) { // 성공 했을 때
					console.log(res);
					if (res.code == 200) {
						alert('성공');
						idCheck = '성공';
					} else if(res.code == 300){
						alert('중복');
						idCheck = '중복';
					} else {
						alert('서버에러');
					}
					// location.href = , 보내고 싶은 페이지 이동 
				}
			})
		}

		function joinAction() {
			const userId = document.getElementById('userId');
			const userPw = document.getElementById('userPw');
			const pwError = document.getElementById('pwError');
			const userName = document.getElementById('userName');
			const userNickname = document.getElementById('userNickname');
			const userNum = document.getElementById('userNum');
			const userTel = document.getElementById('userTel');

			const idPwRegex = /^[A-Za-z0-9]{4,12}$/;
			if (!idPwRegex.test(userId.value)) {
				alert("아이디는 영문과 숫자 조합 4~12자여야 합니다.");
				userId.focus();
				return false;
			}
			if (!idPwRegex.test(userPw.value)) {
				alert("비밀번호는 영문과 숫자 조합 4~12자여야 합니다.");
				userPw.focus();
				return false;
			}

			// 2. 비밀번호 일치 확인
			if (userPw.value !== pwError.value) {
				alert("비밀번호가 일치하지 않습니다.");
				pwError.focus();
				return false;
			}

			// 3. 이름 / 닉네임: 입력만 하면 통과
			if (userName.value.trim() === "") {
				alert("이름을 입력해주세요.");
				userName.focus();
				return false;
			}

			if (userNickname.value.trim() === "") {
				alert("닉네임을 입력해주세요.");
				userNickname.focus();
				return false;
			}

			// 4. 주민등록번호: 6자리-7자리 형식, 총 14자
			const numRegex = /^\d{6}-\d{7}$/;
			if (!numRegex.test(userNum.value)) {
				alert("주민등록번호는 6자리-7자리 형식이어야 합니다. 예: 900101-1234567");
				userNum.focus();
				return false;
			}

			// 5. 전화번호: 010-xxxx-xxxx 형식
			const telRegex = /^010-\d{4}-\d{4}$/;
			if (!telRegex.test(userTel.value)) {
				alert("전화번호는 010-1234-5678 형식으로 입력해야 합니다.");
				userTel.focus();
				return false;
			}

			// 모두 통과

			//Object 담기
			let obj = new Object();

			obj.userId = userId.value;
			obj.userPw = userPw.value;
			obj.userName = userName.value;
			obj.userNickname = userNickname.value;
			obj.userNum = userNum.value;
			obj.userTel = userTel.value;

			$.ajax({
				url : '${pageContext.request.contextPath}/register.api',
				type : 'post',
				data : obj,
				dataType : 'json', //성공 유무
				success : function(res) { // 성공 했을 때
					console.log(res);
					if (res.code == 200) {
						alert('성공');
						location.href = "userLogin.jsp";
					} else {
						alert(res.msg);
					}
					// location.href = , 보내고 싶은 페이지 이동 
				}
			})
		}
	</script>

</body>
</html>
