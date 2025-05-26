// /asset/js/mypage/mypageMain.js

document.addEventListener("DOMContentLoaded", function () {
	const links = document.querySelectorAll(".menu-link");
	links.forEach(link => {
		link.addEventListener("click", aDataUrl);
	});

	if (links[0]) {
		aDataUrl({ target: links[0], preventDefault: () => {} });
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

			// 동적으로 불러온 페이지에 userName이 있으면 fetchUserInfo 실행
			if (document.getElementById("userName") && typeof fetchUserInfo === "function") {
				fetchUserInfo();
			}
		})
		.catch(err => {
			document.getElementById("contentBox").innerHTML =
				"<p>페이지 로딩에 실패했습니다.</p>";
		});
}
