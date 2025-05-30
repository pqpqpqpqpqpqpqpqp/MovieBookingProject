<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="ticketBox_container">
	<div class="column movies" id="movieColumn">
		<div class="title">영화</div>
	</div>

	<div class="column theaters" id="theaterColumn">
		<div class="title">극장</div>
	</div>

	<div class="column dates" id="dateColumn">
		<div class="title">날짜</div>
		<div class="date_list nano has-scroll-y" id="date_list">
			<div class="content scroll-y" tabindex="-1">
				<div class="date_month">
					<span class="year">2025</span> <span class="month">6</span>
				</div>
				<div class="date_container">
					<div class="date" data-date="2025-06-01">01 일</div>
				</div>
				<div class="pane pane-y"
					style="display: block; opacity: 1; visibility: visible;">
					<div class="slider slider-y" style="height: 50px; top: 0px;">
					</div>
				</div>
				<div class="pane pane-x"
					style="display: none; opacity: 1; visibility: invisible;">
					<div class="slider slider-x"
						style="width: 50px; overflow-x: hidden !important;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="column times" id="timeColumn">
		<div class="title">시간</div>
	</div>
</div>

<script
	src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>
<script>
let selectedMovie = null;
let selectedTheater = null;
let selectedDate = null;
let allData = [];

const movieData = {
		"겨울왕국": { idx: 1, poster: "Frozen.jpeg", ageGrade: "전체 관람가" },
		"모아나": { idx: 2, poster: "Moana.jpeg", ageGrade: "전체 관람가" },
		"몬스터 주식회사 3D": { idx: 3, poster: "MonstersInc.jpeg", ageGrade: "전체 관람가" },
		"바람": { idx: 4, poster: "TheWind.jpeg", ageGrade: "19세 관람가" },
		"스파이더맨: 뉴 유니버스": { idx: 5, poster: "SpiderMan.jpeg", ageGrade: "12세 관람가" },
		"아바타: 물의 길": { idx: 6, poster: "Avatar.jpeg", ageGrade: "12세 관람가" },
		"어벤져스: 인피니티 워": { idx: 7, poster: "Avengers.jpeg", ageGrade: "12세 관람가" },
		"타짜": { idx: 8, poster: "Tazza.jpeg", ageGrade: "청소년 관람불가" },
		"파과": { idx: 9, poster: "Pagwa.jpeg", ageGrade: "15세 관람가" },
		"해리포터와 마법사의 돌": { idx: 10, poster: "HarryPotter.jpeg", ageGrade: "전체 관람가" },
	};

$.ajax({
	url: '${pageContext.request.contextPath}/ReserveMovieList.tiw',
	type: 'get',
	dataType: 'json',
	success: function(res) {
		allData = res;

		const movieSet = new Set(); // 중복 제거용
		const theaterSet = new Set(); // 중복 제거용

		for (let i = 0; i < res.length; i++) {
			const movieName = res[i].movieName;
			const theaterName = res[i].theaterName;

			if (!movieSet.has(movieName)) {
				movieSet.add(movieName);

				const div = document.createElement("div");
				div.className = "movie";
				div.addEventListener("click", () => movieSelect(movieName));

				const name = document.createElement("span");
				name.className = "movie_name";
				name.textContent = movieName;

				const label = document.createElement("span");
				label.textContent = res[i].movieAgeGrade ;
				label.classList.add("label"); // 기본 label 클래스

				// 🔽 관람등급에 따라 색상 클래스 추가
				const grade = res[i].movieAgeGrade;
				if (grade.includes("ALL") || grade.includes("12")) {
					label.classList.add("green");
				} else if (grade.includes("15")) {
					label.classList.add("orange");
				} else if (grade.includes("19") || grade.includes("청소년")) {
					label.classList.add("red");
				}

				div.append(label);
				div.append(name);

				document.querySelector(".column.movies").appendChild(div);
			}

			if (!theaterSet.has(theaterName)) {
				theaterSet.add(theaterName);

				const div = document.createElement("div");
				div.className = "region";
				div.textContent = theaterName;
				div.addEventListener("click", () => theaterSelect(theaterName));

				document.querySelector(".column.theaters").appendChild(div);
			}
		}
	}
});

document.querySelector(".date_container").addEventListener("click", function(e) {
	const target = e.target.closest(".date");
	if (target) { dateSelect(target.dataset.date); }
});

function movieSelect(movieName) {
	selectedMovie = movieName;

	const preSelected = document.querySelector(".movie.select");
	if (preSelected) { preSelected.classList.remove("select"); }

	const selected = Array.from(document.querySelectorAll(".movie"))
		.find(m => m.querySelector(".movie_name").textContent === movieName);
	if (selected) selected.classList.add("select");

	const movieFoot = document.querySelector(".foot.movie");
	if (movieFoot) movieFoot.remove();

	if (movieName) {
		const container = document.createElement("div");
		container.className = "foot movie";

		const posterURL = '${pageContext.request.contextPath}/asset/img/movie/movieposter/' +  movieData[movieName].poster;

		container.innerHTML =
			'<div class="movie_img">' +
			'<img src="' + posterURL + '" />' +
			'</div>' +
			'<div class="context">' +
			'<span class="title movie_title" data-movie-idx="' + movieData[movieName].idx + '">' + movieName + '</span><br>' +
			'<span> 2D 자막 </span>' +
			'<span>' + movieData[movieName].ageGrade + '</span>' +
			'</div>';

			document.querySelector(".foot.first_container").textContent = ' ';
			document.querySelector(".foot.first_container").appendChild(container);
	}

	resetSecondFooter();
	updateTimeSlots();
}

function theaterSelect(theaterName) {
	selectedTheater = theaterName;

	const preSelected = document.querySelector(".region.select");
	if (preSelected) { preSelected.classList.remove("select"); }

	const selected = Array.from(document.querySelectorAll(".region")).find(r => r.textContent === theaterName);
	if (selected) selected.classList.add("select");

	const theaterFoot = document.querySelector(".foot.theater_tab");
	if (theaterFoot) theaterFoot.remove();

	if (theaterName) {
		const container = document.createElement("div");
		container.className = "foot theater_tab";

		container.innerHTML =
			'<div class="title">' +
			'<span>극장</span> <span>일시</span> <span>상영관</span> <span>인원</span>' +
			'</div>' +
			'<div class="context">' +
			'<span class="input_text theater_title">CGV ' + theaterName + '</span>' +
			'<span class="input_text date_time"></span>' +
			'<span class="input_text cinema_title"></span>' +
			'<span class="input_text"></span>' +
			'</div>';

			document.querySelector(".foot.second_container").textContent = ' ';
			document.querySelector(".foot.second_container").appendChild(container);
	}

	resetSecondFooter();
	updateTimeSlots();
}

function dateSelect(dateISO) {
	selectedDate = dateISO;

	const preSelected = document.querySelector(".date.select");
	if (preSelected) { preSelected.classList.remove("select"); }

	const selected = Array.from(document.querySelectorAll(".date")).find(d => d.dataset.date === dateISO);
	if (selected) selected.classList.add("select");

	resetSecondFooter();
	updateTimeSlots();
}

function updateTimeSlots() {
	if (!selectedMovie || !selectedTheater || !selectedDate) return;

	const filtered =  allData.filter(item =>
		item.movieName === selectedMovie &&
		item.theaterName === selectedTheater &&
		item.screenDate === selectedDate
	);

	const timeColumn = document.querySelector('#timeColumn');
	timeColumn.querySelectorAll(".time_slot").forEach(slot => slot.remove());

	// filtered배열을 cinemaName으로 그룹핑.
	// 같은 cinemaName을 가지는 행끼리 모음.
	const grouped = filtered.reduce((acc, cur) => {
		if (!acc[cur.cinemaName]) acc[cur.cinemaName] = [];
		acc[cur.cinemaName].push(cur);
		return acc;
	}, {});
	
	for (const cinemaName in grouped) {
		const timeslot = document.createElement('div');
		timeslot.classList.add('time_slot');
		const first = grouped[cinemaName][0];
		timeslot.innerHTML = '<strong><span class="theater_type">2D(자막) </span>' +
			'<span class="cinema_name">' + first.cinemaName + '</span>' +
			'<span class="cinema_spe"> (' + first.cinemaSpecialName + ')</span></strong><br>';

		const timeContainer = document.createElement('div');
		timeContainer.classList.add('time_container');

		grouped[cinemaName].forEach(item => {
			const timeBlock = document.createElement('div');
			const theaterTime = document.createElement('div');

			timeBlock.classList.add('time_block');
			theaterTime.classList.add('theater_time');
			theaterTime.setAttribute('theater_name', first.cinemaName);

			theaterTime.addEventListener('click', () => timeSelect(theaterTime));

			theaterTime.textContent = item.screenStartTime;

			timeBlock.appendChild(theaterTime);
			timeContainer.appendChild(timeBlock);
		});

		timeslot.appendChild(timeContainer);
		timeColumn.appendChild(timeslot);
	}
}

function timeSelect(theaterTime) {
	const preSelected = document.querySelector(".theater_time.select");
	if (preSelected) {
		preSelected.classList.remove("select");
	}
	
	theaterTime.classList.add("select");
	
	const spans = document.querySelectorAll('.input_text');
	spans[1].textContent = selectedDate + ' ' + theaterTime.textContent;
	spans[2].textContent = theaterTime.getAttribute('theater_name');
	
	document.querySelector(".next_btn_seat_before").classList.add("btn_hidden");
	document.querySelector(".next_btn_seat_end").classList.remove("btn_hidden");
	
	// 원래 이벤트를 삭제하고 추가하기 위한 jquery 구문
	$('.next_btn_seat_end').off('click').on('click', function(e) {
		const timeSlot = theaterTime.closest('.time_slot');
		const spe = timeSlot.querySelector('.cinema_spe').textContent.trim();
		
		document.querySelector(".next_btn_seat_end").classList.add("btn_hidden");
		document.querySelector(".next_btn_pay_before").classList.remove("btn_hidden");
		
	    $('.bodyContainer').load('${pageContext.request.contextPath}/view/ticket/test/testReserveSeat.jsp', {spe: spe}, function (response, status, xhr) {
	        if (status === 'error') {
	        	console.error('Error loading JSP:', xhr.status, xhr.statusText);
	        }
	    });  
	});
}

function resetSecondFooter() {
	const spans = document.querySelectorAll('.input_text');
	if (spans.length >= 3) {
		spans[1].textContent = ' ';
		spans[2].textContent = ' ';
	}
	
	document.querySelector(".next_btn_seat_end").classList.add("btn_hidden");
	document.querySelector(".next_btn_seat_before").classList.remove("btn_hidden");
}
</script>