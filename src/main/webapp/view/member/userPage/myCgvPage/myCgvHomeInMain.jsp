<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>내가 본 영화</title>
<link href="${pageContext.request.contextPath}/asset/css/mypage.css"
	rel="stylesheet">


<%

 	String activeTab = request.getParameter("tab");
 	if (activeTab == null) activeTab = "watchedMovies";	

 	Integer userIdx = (Integer) session.getAttribute("userIdx");
 	if (userIdx == null) {
 		response.sendRedirect(request.getContextPath() + "/userLogin.jsp");
 		return;
 	}
%>
<div class="my_cgv_home_main_container_outBox">
	<div class="my_cgv_home_main_container">
		<!-- 왼쪽 프로필 영역 -->
		<div class="aside_profile_container">
			<div class="aside_profile_menu imghead">
				<div class="aside_profile_img">
					<img
						src="/MovieBookingProject/asset/img/movie/movieposter/Avatar.jpeg"
						alt="프로필">
				</div>
				<div class="profile_name">

					<a id="go_edit_page" href="#" class="edit" target="_blank"
						title="새창열림">나의 정보 변경</a>
				</div>
				<div class="profile_nickname"></div>
			</div>

			<!-- 탭 메뉴 -->
			<a class="aside_profile_menu tab active" href="#"
				data-target="watchedMovies"> <em>0</em> <span>내가 본 영화</span>
			</a> <a class="aside_profile_menu tab" href="#"
				data-target="writtenReviews"> <em>0</em> <span>내가 쓴 평점</span>
			</a>
		</div>

		<!-- 콘텐츠 컨테이너 -->
		<div class="movie_list_catainer" id="contentBox">
			<!-- include로 미리 로딩 -->
			<div class="tab_content" id="watchedMovies">
				<jsp:include page="myWatchedMovie.jsp" />
			</div>
			<div class="tab_content" id="writtenReviews" style="display: none;">
				<jsp:include page="myWritenReview.jsp" />
			</div>
		</div>
	</div>
</div>
<script>
  const userIdx = <%=session.getAttribute("userIdx")%>; // 서버에서 받은 유저 인덱스
 
  $.ajax({
    url: "${pageContext.request.contextPath}/myInPageInfo.mew",
    type: "GET",
    data: { userIdx: userIdx },
    success: function (resp) {
    	if (resp.code === 200 && resp.data) {
    		  const user = resp.data;
    		  
    		  console.log("내가 본 영화 : ",user.movieList);
    		  $(".profile_name").html(user.userName + '<a id="go_edit_page" href="#" class="edit" target="_blank" title="새창열림">나의 정보 변경</a>');
    		  $(".profile_nickname").text("닉네임 - " + user.userNickname);
    		  $(".aside_profile_img img").attr("src", user.userImg || "/MovieBookingProject/asset/img/default/profile.png");

    		  // ✅ 내가 본 영화 개수 (watchedList가 배열인 경우만)
    		    if (Array.isArray(user.watchedList)) {
    		      const movieCount = user.watchedList.length;
    		      console.log("영화 갯수:", movieCount);
    		      document.querySelector('a[data-target="watchedMovies"] em').textContent = movieCount;
    		    }

    		    // ✅ 내가 쓴 리뷰 개수 (writtenReviews가 배열인 경우만)
    		    if (Array.isArray(user.review)) {
    		      const reviewCount = user.review.length;
    		      console.log("리뷰 갯수:", reviewCount);
    		      document.querySelector('a[data-target="writtenReviews"] em').textContent = reviewCount;
    		    }
    	}else {
        alert("사용자 정보를 불러오지 못했습니다.");
      }
    },
    error: function () {
      alert("사용자 정보 요청 실패");
    }
  });

  const tabs = document.querySelectorAll(".aside_profile_menu.tab");
  const contents = document.querySelectorAll(".tab_content");
  const activeTab = "<%= activeTab %>";

  // 1. 탭 초기 설정
  tabs.forEach(tab => {
    const targetId = tab.dataset.target;
    if (targetId === activeTab) {
      tab.classList.add("active");
    } else {
      tab.classList.remove("active");
    }
  });

  contents.forEach(content => {
    content.style.display = (content.id === activeTab) ? "block" : "none";
  });

  // 2. 탭 클릭 이벤트 등록
  tabs.forEach(tab => {
    tab.addEventListener("click", function (e) {
      e.preventDefault();

      // active 클래스 변경
      tabs.forEach(t => t.classList.remove("active"));
      tab.classList.add("active");

      // 콘텐츠 표시 토글
      const targetId = tab.dataset.target;
      contents.forEach(content => {
        content.style.display = (content.id === targetId) ? "block" : "none";
      });
    });
  });
  

</script>
