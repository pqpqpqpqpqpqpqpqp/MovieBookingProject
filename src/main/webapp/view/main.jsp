<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= session.getAttribute("userIdx") %></title>
<style>
body{
min-height: 100vh;
height: 100%;
}
<jsp:include page="common/header.jsp"/>
</style>
</head>
<body>
<jsp:include page="common/body.jsp"/>
</body>


<footer>
<jsp:include page="common/footer.jsp"/>
</footer>

</html>