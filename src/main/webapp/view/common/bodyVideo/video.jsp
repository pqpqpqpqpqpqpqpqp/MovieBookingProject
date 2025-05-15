<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.movie_navi{
padding: 0;
margin: 0;
}
.video_wrap {
  position: relative;
  max-width: 1080px;
  margin: 0 auto;
}

.video_wrap video {
  width: 100%;
  height: auto;
  display: block;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  color: white;
  padding: 40px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  z-index: 1;
  background: rgba(0, 0, 0, 0.3); /* 반투명 배경도 가능 */
}

.movieSelection_title {
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 15px;
}

.movieSelection_txt {
  font-size: 18px;
  margin-bottom: 30px;
}

.movieSelection_video_controller_wrap a,
.movieSelection_video_controller_wrap button {
  margin: 0 5px;
  padding: 8px 16px;
  border: none;
  background: white;
  color: black;
  font-weight: bold;
  cursor: pointer;
}

</style>
</head>
<body>
	<div class="movie_navi">
		<div class="video_wrap_container">
			<div class="video_wrap">
				<video autoplay muted>
					<source	src="https://adimg.cgv.co.kr/images/202505/MyBelovedStranger2/0508_MyBeloved_1080x608_Mo.mp4" type="video/mp4">
				</video>
				
				<div class="overlay">
					<strong class="movieSelection_title">나를 모르는 그녀의 세계에서</strong> <span
						class="movieSelection_txt">너와 사랑한 우리의<br>시간이 사라졌다
					</span>

					<div class="movieSelection_video_controller_wrap">
						<a href="..." class="btn_movieSelection_detailView">상세보기</a>
						<button id="ctl00_PlaceHolderContent_playStop"
							class="btn_movieSelection_playStop">Stop</button>
						<button id="ctl00_PlaceHolderContent_soundOnOff"
							class="btn_movieSelection_soundOnOff">Sound On</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
  const video = document.querySelector("video");
  const btnStop = document.getElementById("ctl00_PlaceHolderContent_playStop");
  const btnSound = document.getElementById("ctl00_PlaceHolderContent_soundOnOff");

  btnStop.addEventListener("click", () => {
    if (video.paused) {
      video.play();
      btnStop.textContent = "Stop";
    } else {
      video.pause();
      btnStop.textContent = "Play";
    }
  });

  btnSound.addEventListener("click", () => {
    video.muted = !video.muted;
    btnSound.textContent = video.muted ? "Sound On" : "Mute";
  });
</script>
</body>
</html>