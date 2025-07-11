<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/mypage.css" />
	<span id=hi></span>
<div class="mypage_body_container">
	<div class="mypage_index">
		<ul>
			<li><a href="#" class="menu-link"
				data-url="${pageContext.request.contextPath}/myCgvHome.me">MY
					CGV HOME</a> <i></i></li>
			<li><a>나의 예매내역</a>
				<ul>
					<li><a href="#" class="menu-link"
						data-url="${pageContext.request.contextPath}/myTicket.me">CGV
							영화관람권</a></li>
				</ul></li>
			<li><a>회원정보</a>
				<ul>
					<li><a href="#" class="menu-link"
						data-url="${pageContext.request.contextPath}/userInfo.me">회원정보
							설정</a></li>
					<li><a href="#" class="menu-link"
						data-url="${pageContext.request.contextPath}/userSelectInfo.me">선택정보
							설정</a></li>
					<li><a href="#" class="menu-link"
						data-url="${pageContext.request.contextPath}/userDelete.me">회원탈퇴</a>
					</li>
				</ul></li>
		</ul>
	</div>
	<div class="mypage_body_content_box" id="contentBox">

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
	const contextPath = "${pageContext.request.contextPath}";
	const sessionUserIdx = <%= session.getAttribute("userIdx") %>;

</script>

<script src="${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/mypage/userInfoPage.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/mypage/userInfoPopup.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/mypage/userDelete.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/mypage/myCgvHome.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/mypage/mypageMain.js"></script>


