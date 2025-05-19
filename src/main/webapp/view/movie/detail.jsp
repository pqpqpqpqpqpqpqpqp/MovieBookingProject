<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.ParseException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>

</head>
<body>
<h2>Detail Page</h2>

<% 
	int movieIdx = Integer.parseInt((request.getParameter("detail")));
%>
<%=movieIdx %>
<!-- 리뷰 페이지 들어갈 때 링크에 영화idx, 영화 제목 같이 넘겨주세요 -->
</body>

</html>
