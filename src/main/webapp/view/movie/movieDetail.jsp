<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.vo.MovieDetailRes" %>
<%@page import="java.text.ParseException"%>
 
  <link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />
<html>
<head>
<meta charset="UTF-8">
<title>상세정보페이지</title>
<jsp:include page="/view/common/header.jsp"/>

</head>
<body>
<jsp:include page="movieDetail/movieTitle.jsp"></jsp:include>
<jsp:include page="movieDetail/detailContent.jsp"></jsp:include>
<jsp:include page="movieDetail/detailReview.jsp"></jsp:include>
</body>
<footer>
<jsp:include page="/view/common/footer.jsp"/>
</footer>
</html>
