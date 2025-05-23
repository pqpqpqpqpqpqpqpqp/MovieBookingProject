<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
	<div class="mypage_body_container">
		<div class="mypage_index">
			<ul>
				<li>
					<a href="#" class="menu-link" data-url="myTabPage/myCgvHome.jsp">MY CGV HOME</a>		
					<i></i>		
				</li>
				<li>
					<a>나의 예매내역</a>	
					<ul>
						<li>
							<a href="#" class="menu-link" data-url="myTabPage/myTicket.jsp">CGV 영화관람권</a>
						</li>
					</ul>
				</li>
				<li>
					<a>회원정보</a>	
						<ul>
							<li>
								<a href="#" class="menu-link" data-url="myTabPage/userInfo.jsp">회원정보 설정</a>
							</li>
							<li>
								<a href="#" class="menu-link" data-url="myTabPage/userSelectInfo.jsp">선택정보 설정</a>
							</li>
							<li>
								<a href="#" class="menu-link" data-url="myTabPage/userDelete.jsp">회원탈퇴</a>
							</li>
						</ul>			
				</li>
			</ul>				
		</div>
		<div class="mypage_body_content_box"id="contentBox">
		
			<!-- 
				jsp 이름
					MY CGV HOME :
					나의 예매내역 
					 > 클릭 시 신용카드 영수증 출력으로 이동
					신용카드 영수증 출력 :
					CGV 영화 관람권 :
					
					회원정보 
					 > 클릭 시 개인정보 설정으로 이동
					회원정보 설정 : <jsp:include page="myTabPage/userInfo.jsp"></jsp:include>
					선택정보 설정 : <jsp:include page="myTabPage/userSelectInfo.jsp"></jsp:include>
					회원탈퇴 :
			 -->
		</div>
	</div>
	<script>
	
	

	
      
 /*******
  * 페이지 시작 Event Handler
 *******/
document.addEventListener("DOMContentLoaded", function () {
  const links = document.querySelectorAll(".menu-link");

    
    
  /*******
  * a링크, onClick Event Handler 만들기
  *******/
  links.forEach(link => {
    link.addEventListener("click", aDataUrl);
  });
  
  
  aDataUrl(links[0]);
}); // 페이지 시작 Event Handler - 종료
  
  
    
    
function aDataUrl(e) {
	
	try {
  		e.preventDefault();
  	
	} catch( err ) {}
	
	
  let targetUrl = new Object;
  if(e.target == '') {
	  targetUrl= 'myTabPage/myCgvHome.jsp';
  } else {
	  targetUrl = e.target.getAttribute("data-url");
  }
  
  

  fetch(targetUrl)
    .then(response => {
      if (!response.ok) throw new Error("Network error");
      return response.text();
    })
    .then(data => {
    	console.log('오긴 했냐');
      document.getElementById("contentBox").innerHTML = data;
    })
    .catch(error => {
      document.getElementById("contentBox").innerHTML = "<p>페이지 로딩에 실패했습니다.</p>";
    });
};
	
</script>