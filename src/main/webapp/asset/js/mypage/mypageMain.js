// 페이지가 로드되면 실행
$(document).ready(function() {
	var links = $(".menu-link");

	// 각 메뉴 링크에 클릭 이벤트 등록
	links.on("click", aDataUrl);

	// 첫 번째 메뉴 자동 클릭 (초기 페이지 로딩용)
	if (links.length > 0) {
		$(links[0]).trigger("click");
	}
});

// 클릭 시 Ajax로 콘텐츠를 로딩하는 함수
function aDataUrl(e) {
	// 기본 클릭 동작 막기
	if (e && typeof e.preventDefault === "function") {
		e.preventDefault();
	}

	// 클릭된 요소에서 data-url 속성 추출
	var targetUrl = $(e.target).data("url");
	if (!targetUrl) return;

	// Ajax 요청 보내기
	$.ajax({
		url: targetUrl,
		method: "GET",
		dataType: "html", // HTML 콘텐츠를 가져옴
		success: function(data) {
			// 가져온 콘텐츠를 contentBox 영역에 삽입
			$("#contentBox").html(data);

			// URL의 마지막 부분을 추출하여 명령 판단
			var splitURL = targetUrl.split("/");
			var command = splitURL[splitURL.length - 1];

			// 특정 명령에 따라 추가 작업 실행
			switch (command) {
				case "userInfo.me":
					if (typeof myPageUserInfo === "function") {
						myPageUserInfo();
					}
					break;
			}
		},
		error: function() {
			// 실패 시 오류 메시지 표시
			$("#contentBox").html("<p>페이지 로딩에 실패했습니다.</p>");
		}
	});
}