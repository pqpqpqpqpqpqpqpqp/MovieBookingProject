<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">    
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/userRegister.css" />

	<div class="register-container">
		<h2>CGV 회원가입</h2>
		<div class="register_form_container">
			<div class="register_inform_box">		
				<span class="register_inform_context">기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게 확인하실 수 있습니다. <br/><span class="orange">입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.</span></span>
			</div>
		<div class="register_form_box">
		<div class="form-group">
			<label for="userId">아이디</label>
			<div class="input_box">
				<input type="text" id="userId" onchange="idChange()" placeholder="아이디를 입력해주세요." required>
				<button type="button" id="idCheckBtn" onclick="inputIdCheck()">중복체크</button>
			</div>
		</div>
		<div class="form-group">
			<label for="userPw">비밀번호</label>
			<div class="input_box">
			 <input type="password" id="userPw" placeholder="비밀번호를 입력해주세요."	required>
			 </div>
		</div>
		<div class="form-group">
			<label for="userPwCheck">비밀번호 확인</label>
			<div class="input_box"> 
			<input type="password"	id="userPwCheck" required>
			<div class="error" id="pwError"></div>
			</div>
		</div>
		<div class="form-group">
			<label for="userName">이름</label>
			<div class="input_box"> 
			 <input type="text" id="userName" required>
			</div>
		</div>
		<div class="form-group">
			<label for="userNickname">닉네임</label>
				<div class="input_box"> 
			 <input type="text"	id="userNickname" required>
			 </div>
		</div>
		<div class="form-group">
			<label for="userNum">주민등록번호</label> 
				<div class="input_box"> 
			<input type="text" id="userNum"	placeholder="예: 900101-1234567" required>
			</div>
		</div>
		<div class="form-group">
			<label for="userTel">전화번호</label> 
			<div class="input_box"> 
			<input type="text" id="userTel" placeholder="010-1234-1234" required>
			</div>
		</div>
		<button type="button" class="submit_btn" onclick="joinAction()">가입하기</button>
		<div class="form-footer">
			이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/userLogin.me">로그인</a>
		</div>
		</div>
		</div>
	</div>
	<script
		src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
	<script>
		let idCheck = '0';
		
		
		function idChange(){
			idCheck = '0';
			const idBtn = document.getElementById('idCheckBtn');
			idBtn.classList.remove('success', 'fail');
			idBtn.style.backgroundColor = '';
			idBtn.style.color = '';
		}

		function inputIdCheck() {
			const userId = document.getElementById('userId');
			const idBtn = document.getElementById('idCheckBtn');
			
			const idPwRegex = /^[A-Za-z0-9]{4,12}$/;
			if (!idPwRegex.test(userId.value)) {
				alert("아이디는 영문과 숫자 조합 4~12자여야 합니다.");
				userId.focus();
				return false;
			}
			
			let objCheck = new Object();

			objCheck.userId = userId.value;
			
			

			$.ajax({
				url : '${pageContext.request.contextPath}/idCheck.mew',
				type : 'post',
				data : objCheck,
				dataType : 'json', //성공 유무
				success : function(res) { // 성공 했을 때
					console.log(res);
				
					idBtn.classList.remove('success', 'fail');
					
					if (res.code == 200) {
						idBtn.classList.add('success');
						idCheck = '성공';
						alert(idCheck);
					} else if(res.code == 300){
						idBtn.classList.add('fail');
						idCheck = '중복';
						alert(idCheck);
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
			const userPwCheck = document.getElementById('userPwCheck');
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
			if (userPw.value !== userPwCheck.value) {
				alert("비밀번호가 일치하지 않습니다.");
				userPwCheck.focus();
				return false;
			}

			// 3-1. 이름: 입력 하면 통과
			if (userName.value.trim() === "") {
				alert("이름을 입력해주세요.");
				userName.focus();
				return false;
			}
			
			// 3-2. 이름: 한글만 (2~10자 정도 제한 가능)
			const nameRegex = /^[가-힣]{2,10}$/;
			if (!nameRegex.test(userName.value.trim())) {
			    alert("이름은 한글만 입력 가능합니다. (2~10자)");
			    userName.focus();
			    return false;
			}
			
			// 3-3. 닉네임: 입력만 하면 통과
			if (userNickname.value.trim() === "") {
				alert("닉네임을 입력해주세요.");
				userNickname.focus();
				return false;
			}
			
			// 3-4. 닉네임: 한글, 영어, 숫자만 (2~12자 제한 예시)
			const nicknameRegex = /^[가-힣a-zA-Z0-9]{2,12}$/;
			if (!nicknameRegex.test(userNickname.value.trim())) {
			    alert("닉네임은 한글, 영어, 숫자만 입력 가능합니다. (2~12자)");
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
			
			if (idCheck === '0') {
				alert("아이디 중복체크를 해야 합니다.");
				userId.focus();
				return false;
			}
			
			if (idCheck === '중복') {
				alert("아이디가 중복 됩니다. 아이디를 변경해주세요.");
				userId.focus();
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
				url : '${pageContext.request.contextPath}/register.mew',
				type : 'post',
				data : obj,
				dataType : 'json', //성공 유무
				success : function(res) { // 성공 했을 때
					console.log(res);
					if (res.code == 200) {
						alert('성공');
						location.href = "${pageContext.request.contextPath}/userLogin.me";
					} else {
						alert(res.msg);
					}
					// location.href = , 보내고 싶은 페이지 이동 
				}
			})
		}
	</script>

