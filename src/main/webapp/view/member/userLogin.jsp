<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	.login_container {
		width: 540px;
		margin: 0 auto;
		border-bottom: 2px solid #777;
		margin-bottom: 80px;
		
	}
	.login_container .login_menu_container{
		display: flex;
		width: 541px;
		margin-top: 30px;
		border-bottom: 3px solid #777;
	}
	.login_menu{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-top-right-radius: 5px;
	    border-top-left-radius: 5px;
	    background: #898987;
	    text-align: center;
	    color: #333;
	    width: 100px;
	    height: 37px;
	    font-size: 13px;
	    font-weight: 500;
	    cursor: pointer;
	    margin-right: 2px;
	}
	.login_menu span{
		color: #fefefe;
	}
	.login_menu.on {
		background-color: #fb4357
	}
	
	
	
	
	
	h1 {
		text-align: center;
		color: #333;
		margin-bottom: 30px;
		font-size: 2em;
	}
	
	.login_container .form_group {
		display: flex;
		margin-top: 10px;
		justify-content: flex-end;
	}
	
	label {
		display: block;
		margin-bottom: 8px;
		color: #555;
		font-weight: 500;
	}
	
	input {
		width: 100%;
		padding: 12px;
		border: 2px solid #ddd;
		font-size: 16px;
		transition: border-color 0.3s;
	}
	
	input:focus {
		border-color: #667eea;
		outline: none;
	}
	
	.btn {
	    width: 264px;
	    height: 42px;
	    line-height: 37px;
	    left: 0;
	    position: static;
	    margin-top: 5px;
	    padding: 2px;
	    background: #fb4357;
	    text-align: center;
	}
	.btn span{
	    display: block;
	    width: 258px;
	    height: 36px;
	    border: 1px solid #ffff;
	    color: #f8f8f8;
	    font-size: 15px;
	    font-weight: 500;
	}
	.login_box{
		display: flex;
		flex-direction: column;
		width: 540px;
		justify-content: flex-end;
	}
	.form_group input[type="text"], .form_group input[type="password"] {
	    display: block;
	    width: 135px;
	    height: 35px;
	    padding: 0 5px 0 40px;
	    border: 2px solid #b5b5b5;
	    line-height: 33px;
	}


	.form_group input[type="text"] {
    	width: 258px;
    	margin-bottom: 5px;
    	background: url('/MovieBookingProject/asset/icon/spriteIcon.png');
    	background-position: 8px -230px;
    	background-size: auto;
    	
	    background-repeat: no-repeat;
	    padding-left: 40px;
	}
	.form_group input[type="password"] {
		background: url('/MovieBookingProject/asset/icon/spriteIcon.png')  ;
		background-position: 10px -261px;
		background-repeat: no-repeat;
		padding-left: 40px;
		width: 258px;
		margin-bottom: 5px;
	}
	

	.register_link {
		display: flex;]
		height: 100%;
		align-items: center;
		color: #666;
	}
	
	.register_link a {
		color: #667eea;
		text-decoration: none;
		font-weight: 500;
		
	}
	
	.register_link a:hover {
		text-decoration: underline;
	}
	
	.error-message {
		color: #ff4444;
		font-size: 14px;
		margin-top: 5px;
		text-align: center;
	}
	.login_option{
		display: flex;
		width: 260px;
		justify-content: space-between; 
		align-items: center;
		margin-bottom: 30px;
		font-size: 14px;
	}
	.login_option .save_id{
		display: flex;
		align-items: center;
	}
	.login_option .save_id {
		display: flex;
		align-items: center;
		width: 15px;
		height: 15px;
	}
	.login_option .save_id span{
		margin-left: 10px;
		white-space: nowrap;    
	}

</style>
</head>
<body>
<jsp:include page="/view/common/header.jsp"/>
	<div class="login_container">
		<div class="login_menu_container">
			<div class="login_menu on"><span>로그인</span></div>
<!-- 			<div class="login_menu"><span>비회원 예매</span></div> -->
<!-- 			<div class="login_menu"><span>비회원 예매확인</span></div> -->
		</div>
		<div class="login_box">
			<div class="form_group">
				<input type="text" id="userId" required>
			</div>
			<div class="form_group">
				<input type="password" id="userPw" required>
			</div>
			<div class="form_group">
			<button type="button" class="btn" onclick="loginAction()"><span>로그인</span></button>
			</div>
			<div class="form_group">
				<div class="login_option">
					<div class="save_id">
						<input type="checkbox"><span>아이디 저장</span> 
					</div>
					<div class="register_link">
						<a href="${pageContext.request.contextPath}/userRegister.me">회원가입</a>
					</div>
				</div>
	    	</div>
		</div>
	</div>
	<script src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
	<script>
		function loginAction() {
			const userId = document.getElementById('userId');
			const userPw = document.getElementById('userPw');

			//Object 담기
			let obj = new Object();

			obj.userId = userId.value;
			obj.userPw = userPw.value;

			$.ajax({
				url : '${pageContext.request.contextPath}/login.mew',
				type : 'post',
				data : obj,
				dataType : 'json', //성공 유무
				success : function(res) { // 성공 했을 때
					if (res.code == 200) {
						alert('로그인 성공');
						location.href = "${pageContext.request.contextPath}/main.me";
					} else if((res.code == 300)){
						alert('로그인 실패');
					} else{
						alert(res.msg);
					}
					// location.href = , 보내고 싶은 페이지 이동 
				}
			})
		}
	</script>
</body>
	<footer>
<jsp:include page="/view/common/footer.jsp"/>
</footer>
</html>
