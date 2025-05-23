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
		<div class="date">10 토</div>
		<div class="date">11 일</div>
		<div class="date">12 월</div>
	</div>

	<div class="column times" id="timeColumn">
		<h3>시간</h3>
		<div class="time-slot">
			<strong>2D(자막) 1관 [예시관] (Laser)</strong><br> <span>11:00
				(100석)</span> <span>14:00 (80석)</span> <span>17:30 (60석)</span>
		</div>
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
						const screenDate = res[i].screenDate;

						console.log(i + "번째: ");
						console.log(res[i]);
						console.log(res[i].movieName);

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

			document.querySelectorAll(".date").forEach(dateDiv => {
				dateDiv.onclick = function () {
					dateSelect(this.textContent.trim());
				};
			})
			
			function updateTimeSlots() {
				if (!selectedMovie || !selectedTheater || !selectedDate) {return;
				} else {
					
				}
			}
		});
	</script>

</body>
</html>