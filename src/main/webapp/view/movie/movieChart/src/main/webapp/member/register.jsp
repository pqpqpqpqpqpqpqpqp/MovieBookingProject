<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 - 여행사진 공유</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 2em;
        }

        .form-group {
            margin-bottom: 20px;
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
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #667eea;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #ff4444;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원가입</h1>
        <form action="registerProcess.jsp" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" required>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <button type="button" onclick="joinAction()" class="btn">회원가입</button>
        </form>
        <div class="login-link">
            이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
        </div>
    </div>
    <script src="../jquery-3.7.1.min.js"></script>
    <script>
    	function joinAction() {
    		const userId = document.getElementById('userId');
    		const password = document.getElementById('password');
    		const nickname = document.getElementById('nickname');
    		
    		//Object 담기
    		let obj1 = new Object();
    		let obj2 = {};
    		
    		
    		let obj = {'nickname': nickname.value};
    		obj.userId = userId.value;
    		obj['password'] = password.value;
    		
    		
    		$.ajax({
    			url: '${pageContext.request.contextPath}/register.api',
    			type: 'post',
    			data: obj,
    			dataType: 'json', //성공 유무
    			success: function(res) { // 성공 했을 때
    				console.log(res);
    				if(res.code ==200) {
    					alert('성공');
    					location.href = "login.jsp";
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