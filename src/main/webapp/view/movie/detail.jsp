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
	String movieIdx = request.getParameter("detail");
	if(movieIdx == null) {
		movieIdx = "1";
	}
%>
<%=movieIdx %>

<div id="title">
</div>

<span id="content"></span>



<!--  movice Idx, List에서부터 연결 -->
<input type="hidden" id="movieIdx" value="<%=movieIdx %>" />
<!-- 리뷰 페이지 들어갈 때 링크에 영화idx, 영화 제목 같이 넘겨주세요 -->
<script src="../../asset/js/jquery-3.7.1.min.js"></script>
<script>

/************************
 * 페이지 시작
 ************************/
 const movieDetailIdx = document.getElementById('movieIdx').value;
$(document).ready(function() {

	detail(); // 영화 상세보기
});


/************************
 * 영화 상세보기 불러오기 함수
 ************************/
function detail() {
	
	
	
	$.ajax ({
		url: '${pageContext.request.contextPath}/MovieDetail.mo',
		type: 'get',
		data: {
			'movieIdx': movieDetailIdx
		},
		
		dataType: 'json',
		success: function(res) {
			console.log(res);
			if(res.code ==200) {
				const data = res.data;
				document.getElementById('title').innerHTML = data.movieName; // 제목
				document.getElementById('content').innerHTML = data.movieDsec;
				
				
			} else {
				alert('실패~');
			}
			
			
			}
		});
}

</script>

</body>

</html>
