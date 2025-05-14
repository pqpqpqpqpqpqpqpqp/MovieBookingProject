<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고배너</title>
 <style type="text/css">
        /* 전체와 body의 배경색을 검정으로 지정하고, 텍스트 중앙정렬, 테두리 제거 */
        *, body {
            background-color: #000000;
            text-align: center;
            border: 0;
        }

        /* 광고 배너 상단 영역 크기 지정 */
        .cgv_ad_top {
            position: relative;
            width: 980px;
            height: 80px;
            margin: 0 auto;
        }

        /* 닫기 버튼 위치와 마우스 커서 스타일 지정 */
        .btn_ad_close {
            position: absolute;
            right: 10px;
            top: 10px;
            cursor: pointer;
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
<body ="background-color: transparent" scroll="no">
<div class="cgv_ad_wrap" id="cgv_main_ad">
<div id ="TopBarWrapper" class = "sect-head-ad">
<div class="top_extend_ad_wrap">
<div class ="adreduce" id="adReduce">



 -->
 <!-- 광고 배너 영역 시작 -->
    <div class="cgv_ad_top">
        <!-- 배너 클릭 시 이동할 광고 링크      midx 에서 id값 받아서 넘겨주면 됨. img id 가 나오는대로 midx는 변경--> 
        <a href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@TopBar_EX?ads_id=53380&creative_id=82108&click_id=103158" target="_blank">
            <iframe src="http://www.cgv.co.kr/movies/detail-view/?midx=89630" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
        </a>

        <!-- 닫기 버튼 -->
        <a href="#" class="btn_ad_close" id="btn_ad_close" onclick="parent.closeBanner()">
            <img src="https://img.cgv.co.kr/sample/2015/ad_main_top/btn_ad_close.png" alt="닫기" border="0">
        </a>
    </div>
  

</div></div>
</div>
</div>
</body>
<body>

</body>
</html>