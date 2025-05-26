<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 예매 페이지 - 좌석</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/ticket.css" />
</head>
<body>
	<div class="seatBox_container">
		<!-- 인원수 선택, 좌석 선택이 들어갈 부분 -->
	</div>
	<!-- 추후 페이지 2개로 분리할것 - 페이지가 넘어갈때 위쪽만 바뀌어야 함 -->
	<div class="ticket_foot">
		<a class="ticket_foot_btn_left previous_btn_movie" title="영화선택"></a>
			<!-- 이전 페이지로 돌아가는 버튼 -->
		<div class="foot first_container"></div>
		<div class="line"></div>
		<div class="foot second_container"></div>

		<div class="line"></div>
		<div class="foot seat_tab">
			<div class="title">
				<span>좌석명</span> <span>좌석번호</span>
			</div>
			<div class="context">
				<span class="input_text"> <!-- 좌석명 - 추후 결정 - 아마 좌석 div에 setAttribute로 값을 주고 받아올것 -->
				</span> <span class="input_text"> <!-- 좌석번호 - A1,A2 -->
				</span>
			</div>

		</div>
		<div class="line"></div>
		<div class="foot tax_tab">
			<div class="title">
				<span>일반</span> <span>총금액</span>
			</div>
			<div class="context tax">
				<div class="tax_counting">
					<span class="input_text"> <!-- 영화요금 - 상영정보에 있음 --></span> <span>원</span><span>X</span>
					<span> <!-- 를 인원수로 곱함 --></span>
				</div>
				<div class="tax_count_txt_container">
					<span class="input_text tax_count_txt"> <!-- 총금액 - 위의 값을 계산하여 삽입--></span>
					<span class="tax_count_txt">원</span>
				</div>
			</div>
		</div>
		<a class="ticket_foot_btn_right next_btn_seat_before" href="#"title="영화선택">다음단계로 이동</a>
		<!-- 전부 선택된게 아니면 넘어가지 말아야함 -->
	</div>
	<script
		src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>

	<script>
		$(document).ready(function() {
			let selectedMovie = null;
			let selectedTheater = null;
			let selectedDate = null;
			let allData = [];
			
			const movieData = {
					  "겨울왕국": {
					    poster: "Frozen.jpeg",
					    ageGrade: "전체 관람가",
					  },
					  "모아나": {
					    poster: "Moana.jpeg",
					    ageGrade: "전체 관람가",
					  },
					  "몬스터 주식회사 3D": {
					    poster: "MonstersInc.jpeg",
					    ageGrade: "전체 관람가",
					  },
					  "바람": {
					    poster: "TheWind.jpeg",
					    ageGrade: "19세 관람가",
					  },
					  "스파이더맨: 뉴 유니버스": {
					    poster: "SpiderMan.jpeg",
					    ageGrade: "12세 관람가",
					  },
					  "아바타: 물의 길": {
					    poster: "Avatar.jpeg",
					    ageGrade: "12세 관람가",
					  },
					  "어벤져스: 인피니티 워": {
					    poster: "Avengers.jpeg",
					    ageGrade: "12세 관람가",
					  },
					  "타짜": {
					    poster: "Tazza.jpeg",
					    ageGrade: "청소년 관람불가",
					  },
					  "파과": {
					    poster: "Pagwa.jpeg",
					    ageGrade: "15세 관람가",
					  },
					  "해리포터와 마법사의 돌": {
					    poster: "HarryPotter.jpeg",
					    ageGrade: "전체 관람가",
					  },
					};
			
			$.ajax({
				url : '${pageContext.request.contextPath}/testReserve.tiw',
				type : 'get',
				dataType : 'json',
				success : function(res) {
					allData = res;
					
					const movieColumn = document.querySelector("#movieColumn");
					const theaterColumn = document.querySelector("#theaterColumn");

					const movieSet = new Set(); // 중복 제거용
					const theaterSet = new Set(); // 중복 제거용

					for (let i = 0; i < res.length; i++) {
						const movieName = res[i].movieName;
						const theaterName = res[i].theaterName;

						if (!movieSet.has(movieName)) {
							movieSet.add(movieName);

							const div = document.createElement("div");
							div.className = "movie";
							div.onclick = function() {
								movieSelect(movieName);
							};
							
							const name = document.createElement("span");
							name.className = "movie_name";
							name.textContent = movieName;
							
							const label = document.createElement("span");
							label.className = "label green";
							label.textContent = res[i].movieAgeGrade;
							
							div.appendChild(label);
							div.appendChild(name);
							
							movieColumn.appendChild(div);
						}

						if (!theaterSet.has(theaterName)) {
							theaterSet.add(theaterName);

							const div = document.createElement("div");
							div.className = "region";
							div.textContent = theaterName;
							div.onclick = function() {
								theaterSelect(theaterName);
							};

							theaterColumn.appendChild(div);
						}
					}
				}
			});
			
			document.querySelector(".date_container").onclick = function(e) {
		    	const target = e.target.closest(".date");
				if (target) { dateSelect(target.dataset.date); }
			};
			
			function movieSelect(movieName) {
			    selectedMovie = movieName;
			    
			    const preSelected = document.querySelector(".movie.select");
				if (preSelected) { preSelected.classList.remove("select"); }

			    const selected = Array.from(document.querySelectorAll(".movie"))
			    				.find(m => m.querySelector(".movie_name").textContent === movieName);
			    if (selected) selected.classList.add("select");

			    const FootMovie = document.querySelector(".foot.movie");
			    if (FootMovie) FootMovie.remove();

			    if (movieName) {
			        const container = document.createElement("div");
			        container.className = "foot movie";

			        const posterURL = '${pageContext.request.contextPath}/asset/img/movie/movieposter/' + movieData[movieName].poster;

			        container.innerHTML =
			        	'<div class="movie_img">' +
			            '<img src="' + posterURL + '" />' +
			        '</div>' +
			        '<div class="context">' +
			            '<span class="title">' + movieName + '</span><br>' +
			            '<span> 2D 자막 </span>' +
			            '<span>' + movieData[movieName].ageGrade + '</span>' +
			        '</div>';
			        
			        document.querySelector(".foot.first_container").appendChild(container);
			    }
			    
			    resetSecondFooter()
			    updateTimeSlots();
			}

			function theaterSelect(theaterName) {
				selectedTheater = theaterName;
				
				const preSelected = document.querySelector(".region.select");
				if (preSelected) { preSelected.classList.remove("select"); }
				
				const selected = Array.from(document.querySelectorAll(".region")).find(r => r.textContent === theaterName);
				if (selected) selected.classList.add("select");
				
				const FootTheater = document.querySelector(".foot.theater_tab");
			    if (FootTheater) FootTheater.remove();

			    if (theaterName) {
			        const container = document.createElement("div");
			        container.className = "foot theater_tab";

			        container.innerHTML =
			        	'<div class="title">' +
			            '<span>극장</span> <span>일시</span> <span>상영관</span> <span>인원</span>' +
			        '</div>' +
			        '<div class="context">' +
			            '<span class="input_text">CGV ' + theaterName + '</span>' +
			            '<span class="input_text"></span>' +
			            '<span class="input_text"></span>' +
			            '<span class="input_text"></span>' +
			        '</div>';
			        
			        document.querySelector(".foot.second_container").appendChild(container);
			    }
				
			    resetSecondFooter()
				updateTimeSlots();
			}
			
			function dateSelect(dateISO) {
			    selectedDate = dateISO;
			    
			    const preSelected = document.querySelector(".date.select");
				if (preSelected) { preSelected.classList.remove("select"); }
			    
			    const selected = Array.from(document.querySelectorAll(".date")).find(d => d.dataset.date === dateISO);
			    if (selected) selected.classList.add("select");
			    
			    resetSecondFooter()
			    updateTimeSlots();
			}

			function updateTimeSlots() {
				if (!selectedMovie || !selectedTheater || !selectedDate) return;
				
			    const filtered = allData.filter(item => 
			        item.movieName === selectedMovie &&
			        item.theaterName === selectedTheater &&
			        item.screenDate === selectedDate
			    );
				
				const timeColumn = document.querySelector('#timeColumn');
				timeColumn.querySelectorAll(".time_slot").forEach(slot => slot.remove());
				
				// filtered배열을 cinemaName으로 그룹핑.
				// 같은 cinemaName을 가지는 객체끼리 배열로 모임
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
			        					 '<span class="cinema_spe">(' + first.cinemaSpecialName + ')</span></strong><br>';
			        
			        const timeContainer = document.createElement('div');
			        timeContainer.classList.add('time_container');

			        grouped[cinemaName].forEach(item => {
			            const timeBlock = document.createElement('div');
			            const theaterTime = document.createElement('div');
			            
			            timeBlock.classList.add('time_block');
			            theaterTime.classList.add('theater_time');
			            theaterTime.setAttribute('theater_name',first.cinemaName);
			            
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
			}
			
			function resetSecondFooter(){
				const spans = document.querySelectorAll('.input_text');
			    if(spans){
			    	spans[1].textContent = ' ';
			    	spans[2].textContent = ' ';
			    }
			}
		});
</script>
</body>
</html>