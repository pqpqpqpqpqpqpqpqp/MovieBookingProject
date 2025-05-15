<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>회원가입</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .register-container {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group input[type="file"] {
            padding: 6px;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        .form-footer {
            text-align: center;
            margin-top: 16px;
            font-size: 13px;
            color: #777;
        }

        .error {
            font-size: 12px;
            color: red;
            margin-top: 4px;
        }
    </style>
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
        <form action="register.me" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" required>
            </div>
            <div class="form-group">
                <label for="userPw">비밀번호</label>
                <input type="password" id="userPw" name="userPw" required>
            </div>
            <div class="form-group">
                <label for="userPwCheck">비밀번호 확인</label>
                <input type="password" id="userPwCheck" required>
                <div class="error" id="pwError"></div>
            </div>
            <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" id="userName" name="userName" required>
            </div>
            <div class="form-group">
                <label for="userNickname">닉네임</label>
                <input type="text" id="userNickname" name="userNickname" required>
            </div>
             <div class="form-group">
                <label for="userJumin">주민등록번호</label>
                <input type="text" id="userJumin" name="userJumin" placeholder="예: 900101-1234567" required>
            </div>
            <div class="form-group">
                <label for="userTel">전화번호</label>
                <input type="text" id="userTel" name="userTel" required>
            </div>
            <input type="submit" class="submit-btn" value="가입하기">
        </form>
        <div class="form-footer">
            이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
        </div>
    </div>
</body>
</html>
