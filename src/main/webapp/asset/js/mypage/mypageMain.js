// /asset/js/mypage/mypageMain.js

document.addEventListener("DOMContentLoaded", function() {
	const links = document.querySelectorAll(".menu-link");
	links.forEach(link => {
		link.addEventListener("click", aDataUrl);
	});

	if (links[0]) {
		aDataUrl({ target: links[0], preventDefault: () => { } });
	}
});

/***
 * 페이지 기능
 */
async function aDataUrl(e) {
	e.preventDefault?.();
	const targetUrl = e.target.getAttribute("data-url");





//페이지 불러오기 기능
	await fetch(targetUrl)
		.then(res => res.text())
		.then(data => {
			document.getElementById("contentBox").innerHTML = data;


		})
		.catch(err => {
			document.getElementById("contentBox").innerHTML =
				"<p>페이지 로딩에 실패했습니다.</p>";
		});




	const splitURL = targetUrl.split("/");
	const command = splitURL[splitURL.length - 1];


	//page 경로 function 실행
	switch (command) {
		case "userInfo.me":
			myPageUserInfo();
			break;

	}
}
