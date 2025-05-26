/**
 * 
 */

// /asset/js/mypage/mypageMain.js


document.addEventListener("DOMContentLoaded", function() {
	const links = document.querySelectorAll(".menu-link");
	links.forEach(link => {
		link.addEventListener("click", aDataUrl);
	});

	// 최초 로딩 시 첫 번째 링크 선택
	if (links[0]) {
		aDataUrl({ target: links[0], preventDefault: () => { } });
	}
});

function aDataUrl(e) {
	e.preventDefault?.();
	const targetUrl =
		e.target.getAttribute("data-url") ||
		`${contextPath}/myCgvHome.me`;

	fetch(targetUrl)
		.then(res => res.text())
		.then(data => {
			document.getElementById("contentBox").innerHTML = data;
			attachDynamicEvents(); // ✨ 동적 이벤트 재등록
		})
		.catch(err => {
			document.getElementById("contentBox").innerHTML =
				"<p>페이지 로딩에 실패했습니다.</p>";
		});
}
