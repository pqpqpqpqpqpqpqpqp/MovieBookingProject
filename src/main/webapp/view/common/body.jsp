<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바디</title>
<style>
.body_viewVideo_container{
height: 550px;
max-height: 550px;

}

</style>
</head>

<body onload="loadMainContent()">

<!-- videoMain.jsp include -->
<div class="body_viewVideo_container">
  <jsp:include page="bodyVideo/videoMain.jsp" />
</div>


  <jsp:include page="mainViewMovie/movieViewMain.jsp" />


<script type="text/javascript">
function loadMainContent() {

}
</script>
</body>
</html>