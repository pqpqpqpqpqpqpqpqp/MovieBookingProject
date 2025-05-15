<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CGV Header 통합</title>
    
    <style>
    *{
    padding:0px;
    margin: 0px;
    }
    </style>
</head>
<body >

    <!-- 광고 배너 영역 -->
    <jsp:include page="header/adBanner.jsp" />

    <!-- 아이콘 배너 영역 (로그인/회원가입/MY CGV/고객센터) -->
    <jsp:include page="header/iconBanner.jsp" />

    <!-- 메뉴 드롭다운 영역 -->
    <jsp:include page="header/menuBanner.jsp" />

</body>
</html>
