<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Noto Sans KR', sans-serif;
    }

    .banner {
      position: relative;
      width: 100%;
      height: 550px;
      display: flex;
      background: url('https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88255/88255_320.jpg') no-repeat right center / cover;
      background-color: black;
      overflow: hidden;
    }

    .banner::before {
      content: "";
      position: absolute;
      width: 100%;
      height: 100%;
      background: linear-gradient(to right, black 35%, rgba(0,0,0,0.3) 60%, rgba(0,0,0,0) 100%);
      z-index: 1;
    }

    .banner-content {
      position: relative;
      z-index: 2;
      color: white;
      width: 50%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding-left: 100px;
    }

    .banner-content h1 {
      font-size: 48px;
      font-weight: 900;
      margin-bottom: 20px;
    }

    .banner-content p {
      font-size: 20px;
      margin-bottom: 10px;
    }

    .banner-buttons {
      margin-top: 20px;
      display: flex;
      gap: 10px;
    }

    .banner-buttons button {
      padding: 10px 20px;
      border: none;
      border-radius: 20px;
      font-size: 16px;
      cursor: pointer;
    }

    .btn-detail {
      background-color: #f1f1f1;
      color: #000;
    }

    .btn-play, .btn-mute {
      background-color: transparent;
      border: 2px solid #fff;
      color: #fff;
      border-radius: 50%;
      width: 40px;
      height: 40px;
    }
  </style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class="banner">
  <video width="640" height="360" controls>
    <source src="${pageContext.request.contextPath}/img/movie/mainposter.mp4" type="video/mp4">
  </video>
    <div class="banner-content">
      <h1>세븐 베일즈</h1>
      <p>찰스는 죽었어!</p>
      <p>무대의 주인은 나야</p>
      <div class="banner-buttons">
        <button class="btn-detail">상세보기</button>
        <button class="btn-play">▶</button>
        <button class="btn-mute">🔈</button>
      </div>
    </div>
  </div>
  

</body>
</html>