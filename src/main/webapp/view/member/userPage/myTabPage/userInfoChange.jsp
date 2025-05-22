<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 0;
      padding: 0;
      background: #fff;
      color: #333;
    }
    .container {
      width: 768px;
      margin: 50px auto;
    }
    h1 {
      font-size: 28px;
      border-bottom: 2px solid #111;
      padding-bottom: 15px;
    }
    .description {
      margin: 10px 0 30px;
      font-size: 14px;
    }
    .section {
      margin-bottom: 40px;
    }
    .section h2 {
      font-size: 18px;
      border-bottom: 1px solid #ccc;
      padding-bottom: 10px;
      margin-bottom: 20px;
    }
    .form-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }
    .form-row label {
      width: 150px;
      font-weight: bold;
    }
    .form-row input,
    .form-row select,
    .form-row button {
      flex: 1;
      padding: 8px;
      font-size: 14px;
    }
    .form-row button {
      max-width: 120px;
      margin-left: 10px;
    }
    .row-group {
      display: flex;
      gap: 10px;
    }
    .toggle {
      display: inline-block;
      background: #fb4397;
      color: white;
      padding: 5px 15px;
      border-radius: 15px;
      font-weight: bold;
      font-size: 12px;
    }
    .checkbox-group {
      display: flex;
      gap: 15px;
      font-size: 13px;
    }
    .agree-section summary {
      font-weight: bold;
      padding: 10px;
      border: 1px solid #ccc;
      cursor: pointer;
    }
    .agree-section {
      margin-top: 20px;
    }
    .buttons {
      text-align: center;
      margin-top: 30px;
    }
    .buttons button {
      width: 120px;
      padding: 10px;
      font-size: 14px;
      margin: 0 10px;
    }
    .footer {
      margin-top: 50px;
      border-top: 1px solid #ddd;
      padding-top: 20px;
      font-size: 12px;
      color: #777;
      display: flex;
      justify-content: space-between;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>회원정보 수정</h1>
  <p class="description">회원님의 소중한 정보를 안전하게 관리하세요.</p>

  <div class="section">
    <h2>기본정보</h2>
    <div class="form-row"><label>이름</label><div class="row-group"><input type="text" value="홍길동" disabled><button>변경하기</button></div></div>
    <div class="form-row"><label>아이디</label><input type="text" value="ck*******" disabled></div>
    <div class="form-row"><label>생년월일</label><div class="row-group"><input type="text" value="**** - ** - **"><button>회원구분 확인하기</button></div></div>
    <div class="form-row"><label>휴대폰번호</label><div class="row-group"><input type="text" value="010 - **** - 0219"><button>변경하기</button></div></div>
    <div class="form-row"><label>이메일</label><div class="row-group"><input type="text" value="ch*****@naver.com"><select><option>네이버</option><option>다음</option></select></div></div>
    <div class="form-row"><label>카카오 로그인</label><span class="toggle">ON</span></div>
    <div class="form-row"><label>비밀번호</label><button>변경하기</button></div>
  </div>

  <div class="buttons">
    <button>취소</button>
    <button>수정</button>
  </div>
 
</div>
</body>
</html>
