<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV_MAIN</title>
<style>
body{
min-height: 100vh;
height: 100%;
}

.body_container{
	display:flex;
	width: 980px;
	justify-content: center;
	flex-direction: column;
}
<jsp:include page="common/header.jsp"/>
</style>
</head>
<body>
<div class ="body_container"> 
<!--  여기에 넣어주세요! -->
<jsp:include page="common/body.jsp"/>

</div>

</body>
<footer>
<jsp:include page="common/footer.jsp"/>
</footer>
</html>