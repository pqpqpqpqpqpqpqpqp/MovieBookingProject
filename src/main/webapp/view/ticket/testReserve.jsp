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
</style>
</head>
<body>
	<div class="column movies" id="movieColumn">
		<h3>영화</h3>
	</div>

	<div class="column theaters" id="theaterColumn">
		<h3>극장</h3>
	</div>

	<div class="column dates" id="dateColumn">
		<h3>날짜</h3>
		<div class="date">20 화</div>
		<div class="date highlight">21 수</div>
		<div class="date">22 목</div>
		<div class="date">23 금</div>
		<div class="date">24 토</div>
		<div class="date">25 일</div>
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
			$.ajax({
				url : '${pageContext.request.contextPath}/testReserve.tiw',
				type : 'get',
				dataType : 'json',
				success : function(res) {

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
								movieSelct(movieName);
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
							div.className = "region highlight";
							div.onclick = function() {
								citySelct(theaterName);
							};

							const name = document.createElement("span");
							name.textContent = theaterName;

							div.appendChild(name);

							theaterColumn.appendChild(div);
						}
					}

				}
			})
		});

		function movieSelect() {
			alert("movie");
		}
		function citySelect() {
			alert("city");
		}
		function dateSelect() {
			alert("date");
		}
	</script>

</body>
</html>