<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" href="../../asset/css/userRegister.css" />
<script>
	function validateForm() {
		const pw = document.getElementById("userPw").value;
		const pwCheck = document.getElementById("userPwCheck").value;
		const errorMsg = document.getElementById("pwError");

		if (pw !== pwCheck) {
			errorMsg.textContent = "비밀번호가 일치하지 않습니다.";
			return false;
		}
		errorMsg.textContent = "";
		return true;
	}
</script>
</head>
<body>
	<div class="register-container">
		<h2>회원가입</h2>
		<div class="form-group">
			<label for="userId">아이디</label> <input type="text" id="userId" required>
		</div>
		<div class="form-group">
			<label for="userPw">비밀번호</label> <input type="password" id="userPw" required>
		</div>
		<div class="form-group">
			<label for="userPwCheck">비밀번호 확인</label> <input type="password" id="userPwCheck" required>
			<div class="error" id="pwError"></div>
		</div>
		<div class="form-group">
			<label for="userName">이름</label> <input type="text" id="userName" required>
		</div>
		<div class="form-group">
			<label for="userNickname">닉네임</label> <input type="text" id="userNickname" required>
		</div>
		<div class="form-group">
			<label for="userNum">주민등록번호</label> <input type="text" id="userNum" placeholder="예: 900101-1234567" required>
		</div>
		<div class="form-group">
			<label for="userTel">전화번호</label> <input type="text" id="userTel" required>
		</div>
		<button type="button" class="submit-btn" onclick="joinAction()">가입하기</button>
		<div class="form-footer">
			이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
		</div>
	</div>
	
	
	<script src="../../asset/js/jquery-3.7.1.min.js"></script>
    <script>
    	function joinAction() {
    		const userId = document.getElementById('userId');
    		const userPw = document.getElementById('userPw');
    		const pwError = document.getElementById('pwError');
    		const userName = document.getElementById('userName');
    		const userNickname = document.getElementById('userNickname');
    		const userNum = document.getElementById('userNum');
    		const userTel = document.getElementById('userTel');
    		
    		//Object 담기
    		let obj = new Object();
    		
    		obj.userId = userId.value;
    		obj.userPw = userPw.value;
    		obj.userName = userName.value;
    		obj.userNickname = userNickname.value;
    		obj.userNum = userNum.value;
    		obj.userTel = userTel.value;
    		
    		
    		$.ajax({
    			url: '${pageContext.request.contextPath}/register.api',
    			type: 'post',
    			data: obj,
    			dataType: 'json', //성공 유무
    			success: function(res) { // 성공 했을 때
    				console.log(res);
    				if(res.code ==200) {
    					alert('성공');
    					location.href = "userLogin.jsp";
    				} else {
    					alert('실패');
    				}
    				// location.href = , 보내고 싶은 페이지 이동 
    			}
    		})
    	}
    </script>

</body>
</html>
