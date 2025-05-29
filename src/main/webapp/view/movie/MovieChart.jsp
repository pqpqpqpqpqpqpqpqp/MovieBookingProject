<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!--  DOCTYPE html-->
<html>
<head>
<meta charset="UTF-8">
<title>무비차트제목</title>
<link rel ="preconnect " href ="https: //fonts.googleapis.com "> 
<link rel ="preconnect " href ="https: //fonts.gstatic.com " crossorigin>
<link href ="${pageContext.request.contextPath}/asset/css/style.css" rel ="stylesheet">
<jsp:include page="../common/header.jsp"></jsp:include>

</head>
<body>

<jsp:include page="movieChart/movieChartTitle.jsp"></jsp:include>
<jsp:include page="movieChart/movieChartList.jsp"></jsp:include>




</body>
<footer>
<jsp:include page="../common/footer.jsp"/>
</footer>
</html>