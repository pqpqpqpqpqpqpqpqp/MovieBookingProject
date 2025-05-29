<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고배너</title>
<style type="text/css">
/* 전체와 body의 배경색을 검정으로 지정하고, 텍스트 중앙정렬, 테두리 제거 */

.cgv_ad_container {
	width: 100vw;

}
.cgv_ad_container *{
	overflow-y: hidden;
	max-height: 100%;
}
.cgv_ad_container .cgv_ad_top {
	width: 100%;
	height: 80px;
	position: relative;
	overflow: hidden;
	text-align: center;
}
.cgv_ad_container .cgv_ad_top img {
  height: 100%;
  object-fit: cover;
  cursor: pointer;
}
/* 광고 배너 iframe */
.ad_iframe {
	width: 100%;
	height: 100%;
	border: none;
	display: block;
}

/* 닫기 버튼 */
/*.btn_ad_close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	z-index: 10;
	background-color: transparent;
}*/

.close-pop-container {
	position: absolute;
	top:0px;
	left: 0px;
	z-index: 10;
	width: 100vw;
	height: 20px;
	display: flex;
	justify-content: center;
}
.close-pop-container .close-pop-rel{
	position: relative;
	width: 980px;
	height: 100%;
}

.close-pop-container .close-pop-rel .btn_ad_close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	z-index: 10;
	background-color: transparent;
}
</style>
<script>
	// 현재 도메인이 cgv.co.kr을 포함하면, 도메인을 cgv.co.kr로 설정
	if (document.domain.toString().indexOf("cgv.co.kr") != -1) {
		document.domain = "cgv.co.kr";
	}

	// 상위 프레임에 있는 title을 바꾸는 코드 (현재는 주석 처리됨)
	// parent.document.getElementById('TopBanner').setAttribute('title', "영화광고-세븐 베일즈");
</script>
</head>
<body>

	<!-- 광고 배너 영역 시작 -->
	<div class="cgv_ad_container">
		<div class="cgv_ad_top">
		
			<!-- 광고 링크와 iframe은 분리 -->
			<a href="#" id="adLink" target="_blank"> 
				<img src=""	id="adImage" width="100%" height="80" alt="" title="" name="topBanner" id="topBanner"></img>
			</a>

			<!-- 닫기 버튼: iframe 위에 겹쳐지도록 위치 -->
<!-- 			<a href="#" class="btn_ad_close" id="btnAdClose"
				onclick="parent.closeBanner()"> <img
				src="https://img.cgv.co.kr/sample/2015/ad_main_top/btn_ad_close.png"
				alt="닫기" border="0">
			</a>-->
		</div>
	</div>
	
	<div class="close-pop-container">
		<div class="close-pop-rel">
		<!-- 닫기 버튼: iframe 위에 겹쳐지도록 위치 -->
			<a href="#" class="btn_ad_close" id="btnAdClose"
				onclick="parent.closeBanner()"> <img
				src="https://img.cgv.co.kr/sample/2015/ad_main_top/btn_ad_close.png"
				alt="닫기" border="0">
			</a>
		</div>
	</div>
<script>
  let ads = [];  // 광고 배열을 담을 변수
  let current = 0; // 현재 몇 번째 광고를 보여줄지 선언하는 변수

  function updateAd() {
    if (ads.length === 0) return; // 광고가 없으면 아무것도 안 함

    const ad = ads[current]; // 현재 광고 가져오기
    document.getElementById("adImage").src = ad.img;
    document.getElementById("adImage").alt = ad.name;
    document.getElementById("adImage").title = ad.name;
    document.getElementById("adLink").href = ad.link;

    current = (current + 1) % ads.length; // 다음 광고로 넘기기
  }

  // 서버에서 광고 데이터를 불러오기 (fetch = 비동기 요청)
  fetch('${pageContext.request.contextPath}/asset/data/ads.json') // 이 주소에 있는 JSON을 가져옴
    .then(function(response)  {
    	response.json();
    }) // 받아온 응답을 JSON으로 변환
    .then(function(data) {
      ads = data;      // 불러온 데이터를 ads 배열에 저장
      updateAd();      // 첫 번째 광고 표시
      setInterval(updateAd, 4000); // 4초마다 다음 광고로 바뀜
    });
</script>



</body>
</html>