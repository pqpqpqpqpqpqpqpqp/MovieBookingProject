<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CGV 로그인</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #fff;
      display: flex;
      justify-content: center;
      padding: 40px;
    }

    .login-container {
      display: flex;
      border-top: 2px solid #333;
      padding: 20px;
      gap: 40px;
    }

    .login-tabs {
      display: flex;
      margin-bottom: 20px;
    }

    .login-tab {
      padding: 10px 20px;
      border: 1px solid #aaa;
      border-bottom: none;
      background-color: #eee;
      color: #333;
      cursor: pointer;
    }

    .login-tab.active {
      background-color: #e60012;
      color: #fff;
    }

    .login-left {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 200px;
      color: #d00;
    }

    .login-left img {
      width: 60px;
      margin-bottom: 10px;
    }

    .login-right {
      width: 300px;
    }

    .login-right input[type="text"],
    .login-right input[type="password"] {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 10px;
	    font-size: 14px;
	    border: 1px solid #ccc;
      
      	display: block;
    	width: 135px;
    	height: 35px;
    	padding: 0 5px 0 40px;
    	border: 2px solid #b5b5b5;
    	line-height: 33px;
    }

    .captcha-box {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 10px;
    }

    .captcha-input {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border: 1px solid #ccc;
    }

    .login-btn {
      width: 100%;
      padding: 10px;
      background-color: #e60012;
      color: white;
      font-weight: bold;
      border: none;
      cursor: pointer;
      font-size: 15px;
    }

    .options {
      display: flex;
      justify-content: space-between;
      font-size: 13px;
      margin-top: 10px;
    }

    .naver-login {
      width: 100%;
      margin-top: 15px;
      padding: 10px;
      background-color: #1ec800;
      color: white;
      font-weight: bold;
      border: none;
      font-size: 15px;
      cursor: pointer;
    }
  </style>
</head>
<body>

<div class="login-container">
  <div class="login-left">
    <div style="font-size: 40px;">❗</div>
    <p style="text-align: center;">정보보호를 위해 아이디, 비밀번호와 함께<br>자동 입력 방지 문자를 입력하셔야 합니다.</p>
  </div>

  <div class="login-right">
    <div class="login-tabs">
      <div class="login-tab active">로그인</div>
      <div class="login-tab">비회원 예매</div>
      <div class="login-tab">비회원 예매확인</div>
    </div>

    <input type="text" placeholder="아이디 입력" value="cksgk0219">
    <input type="password" placeholder="비밀번호 입력" value="********">

    <div class="captcha-box">
      <div style="font-size: 18px; font-weight: bold;">93 9470</div>
      <button>새로고침</button>
      <button>음성듣기</button>
    </div>

    <input type="text" class="captcha-input" placeholder="자동입력 방지문자">

    <button class="login-btn">로그인</button>

   

    <button class="naver-login">N 네이버 로그인</button>
  </div>
</div>

</body>
</html>
