<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<h2> 무비차트 페이지</h2>


<script src="../../asset/js/jquery-3.7.1.min.js"></script>
<script>

	$(document).ready(function() {
		// DOM이 준비되면 실행됨
		console.log("DOM이 준비되었습니다.");
		
		$.ajax ({
			url:'${pageContext.request.contextPath}/MovieChart.mo',
			type: 'post',
			data: {},
			dataType: 'json',
			success: function(res) {
				
				console.log(res)
				console.log(res.data)
				
				if(res.code == 200 && res.data ) {
					
					alert('성공');
				}
				else {
					alert('실패');
				}
			}
			
		})
	});
	
	
</script>