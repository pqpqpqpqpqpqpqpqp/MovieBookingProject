<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고배너</title>
 <style type="text/css">
        /* 전체와 body의 배경색을 검정으로 지정하고, 텍스트 중앙정렬, 테두리 제거 */
      body, * {
    margin: 0;
    padding: 0;
}

.cgv_ad_container {
    width: 100%;
}

.cgv_ad_top {
    width: 100%;
    height: 80px;
    position: relative;
    overflow: hidden;
}

/* 광고 배너 iframe */
.ad_iframe {
    width: 100%;
    height: 100%;
    border: none;
    display: block;
}

/* 닫기 버튼 */
.btn_ad_close {
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

 <!-- 광고 배너 영역 시작 --><div class="cgv_ad_container">
    <div class="cgv_ad_top">
        <!-- 광고 링크와 iframe은 분리 -->
        <a href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@TopBar_EX?ads_id=53380&creative_id=82108&click_id=103158" target="_blank">
            <iframe src="http://www.cgv.co.kr/movies/detail-view/?midx=89630"
                    width="100%" height="80" title="광고 배너"
                    name="topBanner" id="topBanner"></iframe>
        </a>

        <!-- 닫기 버튼: iframe 위에 겹쳐지도록 위치 -->
        <a href="#" class="btn_ad_close" id="btnAdClose" onclick="parent.closeBanner()">
            <img src="https://img.cgv.co.kr/sample/2015/ad_main_top/btn_ad_close.png" alt="닫기" border="0">
        </a>
    </div>
</div>

</body>
<body>

</body>
</html>