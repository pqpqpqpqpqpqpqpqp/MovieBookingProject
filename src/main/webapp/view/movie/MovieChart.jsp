<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<h2> 무비차트 페이지</h2>

<script src="../jquery-3.7.1.min.js"></script>
<script>

	$(document).ready(function() {
		// DOM이 준비되면 실행됨
		console.log("DOM이 준비되었습니다.");
		
		$.ajax ({
			url:'${pageContext.request.contextPath}/MovieChart.mo',
			type: 'post',
			data: objmvc,
			dataType: 'json',
			success: function(res) {
				console.log(res)
				
				if(res.code == 200) {
					alert('성공');
				}
				else {
					alert('실패');
				}
			}
			
		})
	});
	
	
</script>