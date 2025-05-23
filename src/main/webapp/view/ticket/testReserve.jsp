<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 예매 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	height: 100vh;
	overflow: hidden;
}

.column {
	overflow-y: auto;
	border-right: 1px solid #ddd;
	padding: 10px;
}

.movies {
	width: 20%;
	background: #f9f9f9;
}

.theaters {
	width: 20%;
	background: #fff;
}

.dates {
	width: 10%;
	background: #f9f9f9;
}

.times {
	width: 50%;
	background: #fff;
}

.movie, .region, .date, .time-slot {
	padding: 8px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	cursor: pointer;
}

.movie:hover, .region:hover, .date:hover, .time-slot:hover {
	background-color: #eee;
}

.highlight {
	background-color: #ddd !important;
}

.label {
	display: inline-block;
	padding: 2px 6px;
	font-size: 12px;
	font-weight: bold;
	margin-right: 5px;
	border-radius: 3px;
}

.label.orange {
	background-color: orange;
	color: white;
}

.label.green {
	background-color: green;
	color: white;
}

.time-slot span {
	margin-right: 10px;
}

.selected {
	background-color: #eee;
	border: 1px solid #000;
}
</style>
</head>
<body>
	<div class="column movies" id="movieColumn">
		<h3>영화</h3>
	</div>

	<div class="column theaters" id="theaterColumn">
		<h3>극장</h3>
	</div>

	<!-- 날짜는 더미데이터상 정적으로 생성 
	변경시 오늘 날짜로부터 2주정도 동적으로 생성하게 바꿀 것 -->
	<div class="column dates" id="dateColumn">
		<h3>날짜</h3>
		<div class="date">2025-05-10</div>
		<div class="date">2025-05-11</div>
		<div class="date">2025-05-12</div>
	</div>

	<div class="column times" id="timeColumn">
		<div class="title">시간</div>
	</div>

	<script
		src='${pageContext.request.contextPath}/asset/js/jquery-3.7.1.min.js'></script>

	<script>
		$(document).ready(function() {
			let selectedMovie = null;
			let selectedTheater = null;
			let selectedDate = null;
			let allData = [];
			
			$.ajax({
				url : '${pageContext.request.contextPath}/testReserve.tiw',
				type : 'get',
				dataType : 'json',
				success : function(res) {
					allData = res;
					
					const movieColumn = document.getElementById("movieColumn");
					const theaterColumn = document.getElementById("theaterColumn");
					const dateColumn = document.getElementById("dateColumn");

					const movieSet = new Set(); // 중복 제거용
					const theaterSet = new Set(); // 중복 제거용
					const dateSet = new Set(); // 중복 제거용

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
							const label = document.createElement("span");
							label.className = "label green";
							label.textContent = res[i].movieAgeGrade;

							const name = document.createElement("span");
							name.textContent = movieName;

							div.appendChild(label);
							div.appendChild(name);

							movieColumn.appendChild(div);
						}

						if (!theaterSet.has(theaterName)) {
							theaterSet.add(theaterName);

							const div = document.createElement("div");
							div.className = "region";
							div.onclick = function() {
								citySelect(theaterName);
							};

							const name = document.createElement("span");
							name.textContent = theaterName;

							div.appendChild(name);

							theaterColumn.appendChild(div);
						}
					}
				}
			});
			
			document.querySelectorAll(".date").forEach(dateDiv => {
				dateDiv.onclick = function () {
					dateSelect(this.textContent);
				};
			})
			
			function movieSelect(movieName) {
				selectedMovie = movieName;
				document.querySelectorAll(".movie").forEach(m => m.classList.remove("selected"));
				const selected = Array.from(document.querySelectorAll(".movie")).find(m => m.textContent.includes(movieName));
				if (selected) selected.classList.add("selected");

				updateTimeSlots();
			}

			function citySelect(theaterName) {
				selectedTheater = theaterName;
				document.querySelectorAll(".region").forEach(r => r.classList.remove("selected"));
				const selected = Array.from(document.querySelectorAll(".region")).find(r => r.textContent.includes(theaterName));
				if (selected) selected.classList.add("selected");

				updateTimeSlots();
			}
			
			function dateSelect(dateText) {
				selectedDate = dateText;
				document.querySelectorAll(".date").forEach(d => d.classList.remove("selected"));
				const selected = Array.from(document.querySelectorAll(".date")).find(d => d.textContent.includes(dateText));
				if (selected) selected.classList.add("selected");

				updateTimeSlots();
			}

			function updateTimeSlots() {
				if (!selectedMovie || !selectedTheater || !selectedDate) return;
				
				// 선택된 조건에 맞는 데이터만 필터링
			    const filtered = allData.filter(item => 
			        item.movieName === selectedMovie &&
			        item.theaterName === selectedTheater &&
			        item.screenDate === selectedDate
			    );
				
				console.log(filtered);
				
				const timeColumn = document.getElementById('timeColumn');
				timeColumn.querySelectorAll('.time-slot').forEach(slot => slot.remove());
				
				// filtered배열을 cinemaName으로 그룹핑.
				// 같은 cinemaName을 가지는 객체끼리 배열로 모임
				const grouped = filtered.reduce((acc, cur) => {
			        if (!acc[cur.cinemaName]) acc[cur.cinemaName] = [];
			        acc[cur.cinemaName].push(cur);
			        return acc;
			    }, {});
				
				console.log(grouped);
				
				// grouped의 cinemaName(키)를 하나씩 순회
				for (const cinemaName in grouped) {
			        const timeslot = document.createElement('div');
			        timeslot.classList.add('time-slot');
			        const first = grouped[cinemaName][0];
			        timeslot.innerHTML = '<strong><span class="theater_type">2D(자막)></span>' 
			        					+ first.cinemaName + '(' + first.cinemaSpecialName + ')</strong><br>';
			        
			        const timeContainer = document.createElement('div');
			        timeContainer.classList.add('time_container');

			        // 상영 시간과 좌석 수 표시
			        grouped[cinemaName].forEach(item => {
			            const timeBlock = document.createElement('div');
			            timeBlock.classList.add('time_block');

			            const timeDiv = document.createElement('div');
			            timeDiv.classList.add('theater_time');
			            timeDiv.textContent = item.screenStartTime;

			            timeBlock.appendChild(timeDiv);
			            timeContainer.appendChild(timeBlock);
			        });

			        timeslot.appendChild(timeContainer);
			        timeColumn.appendChild(timeslot);
			    }	
			}	    
		});
</script>
</body>
</html>