<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>전화번호 변경</title>
  <style>
    body { font-family: sans-serif; padding: 20px; }
    .popup-container { width: 300px; }
    .popup-container input { width: 100%; padding: 8px; margin-top: 10px; }
    .popup-container button { margin-top: 15px; padding: 8px 12px; }
  </style>
</head>
<body>
  <div class="popup-container">
    <h3>전화번호 변경</h3>
    <form method="post" action="EditNameServlet">
      <input type="text" id="newPhoneNum" placeholder="새 전화번호 입력" required />
      <br/>
      <button type="submit">변경</button>
    </form>
  </div>
</body>
</html>
