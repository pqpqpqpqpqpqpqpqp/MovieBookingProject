<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 예매 페이지</title>
<style type="text/css">
body {
	color: #333;
	font-family: 'Tahoma', '돋움', dotum, Nanum Gothic, sans-serif;
	font-size: 12px;
	font-weight: normal;
	overflow-x: hidden !important;
}

.main_ticket_container {
	display: block;
}
/* ticketBox.jsp*/
.ticket_main_box_container {
	display: flex;
	flex-direction: column;
	height: 678px;
	width: 100%;
	align-items: center;
}
/* 영화예매페이지    */
.ticketBox_container {
	width: 996px;
	height: 550px;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	overflow: hidden;
}

.ticketBox_container .column {
	overflow-y: auto;
	border-right: 2px solid #ddd;
	background-color: #f2f0e5;
	box-sizing: border-box;
	min-width: 0;
}

.ticketBox_container .movie, .region, .date, .time-slot {
	padding: 8px;
	margin-bottom: 2px;
	cursor: pointer;
}

.ticketBox_container .column .title {
	border-bottom: 2px solid #ddd;
	background-color: rgb(55, 55, 55);
	width: 100%;
	color: rgb(250, 250, 250);
	text-align: center;
	font-size: 15px;
	font-weight: bolder;
	padding: 6px 0px;
}
/*	영화 스타일	*/
.ticketBox_container .movies {
	width: 20%;
}

.ticketBox_container .label {
	display: inline-block;
	padding: 2px 6px;
	font-size: 12px;
	font-weight: bold;
	margin-right: 5px;
	border-radius: 3px;
}

.ticketBox_container .label.orange {
	background-color: orange;
	color: white;
}

.ticketBox_container .label.green {
	background-color: green;
	color: white;
}

.ticketBox_container .time-slot span {
	margin-right: 10px;
}
/*	극장 스타일	*/
.ticketBox_container .theaters {
	width: 20%;
}
/*	날짜 스타일	*/
.ticketBox_container .dates {
	width: 10%;
}

.ticketBox_container .dates .date_month span.year {
	display: block;
	margin-top: 12px;
	text-align: center;
	color: #666;
	font-size: 11px;
	font-family: Verdana;
	font-weight: bold;
	line-height: 11px;
}

.ticketBox_container .dates .date_month span.month {
	display: block;
	margin-top: 3px;
	text-align: center;
	color: #666;
	font-size: 30px;
	font-family: Verdana;
	font-weight: bold;
	line-height: 30px;
}

.content .date {
	display: flex;
	justify-content: center;
	font-weight: bold;
}

.content .date span.day {
	margin-left: 15px;
	font-weight: bold;
}

/*	시간 스타일	*/
.ticketBox_container .times {
	width: 50%;
}

.ticketBox_container .times .dates div span.day {
	margin-left: 5px;
}

.ticketBox_container .selected {
	outline: 1px solid #5c5c5c;
	outline-offset: -2px;
	text-align: center;
	height: 29px;
	line-height: 29px;
	margin: 1px;
	padding-left: 6px;
	padding-right: 5px;
	color: #fff;
	background-color: #333;
}

.time_slot {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	margin-left: 10px;
	height: auto;
}

.time_slot strong {
	margin-top: 10px;
}

.time_slot .time_container .theater_time {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2.2px 5.5px;
	border: 1px solid #aaa;
	font-weight: 700;
}

.time_slot .time_container {
	margin-top: 10px;
	display: flex;
	flex-direction: row;
	gap: 8px;
	width: 100%;
}

.time_slot .time_container .time_block {
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
	gap: 10px;
}

/* 스크롤바 */
.ticketBox_container .column .date_list.nano {
	position: relative;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.nano>.pane>.slider, .nano>.pane-y>.slider-y, .nano>.pane-x>.slider-x {
	height: 50px;
	top: 0px;
	background: #444;
	background: rgba(0, 0, 0, .5);
	position: relative;
	margin: 0px 2px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
}
</style>
</head>
<body>
	<div class="ticketBox_container">
		<div class="column movies" id="movieColumn">
			<div class="title">영화</div>
		</div>

		<div class="column theaters" id="theaterColumn">
			<div class="title">극장</div>
		</div>

		<!-- 날짜는 더미데이터상 정적으로 생성 
	변경시 오늘 날짜로부터 2주정도 동적으로 생성하게 바꿀 것 -->
		<div class="column dates" id="dateColumn">
			<div class="title">날짜</div>
			<div class="date_list nano has-scroll-y" id="date_list">
				<div class="content scroll-y" tabindex="-1">
					<div class="date_month">
						<span class="year">2025</span> <span class="month">5</span>
					</div>
					<div class="date" data-date="2025-05-10">10 토</div>
					<div class="date" data-date="2025-05-11">11 일</div>
					<div class="date" data-date="2025-05-12">12 월</div>
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
								citySelect(theaterName);
							};

							theaterColumn.appendChild(div);
						}
					}
				}
			});
			
			document.querySelectorAll(".date").forEach(dateDiv => {
				dateDiv.onclick = function () {
					dateSelect(this.dataset.date);
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
			
			function dateSelect(dateISO) {
			    selectedDate = dateISO;

			    document.querySelectorAll(".date").forEach(d => d.classList.remove("selected"));
			    const selected = Array.from(document.querySelectorAll(".date")).find(d => d.dataset.date === dateISO);
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
				
				const timeColumn = document.getElementById('timeColumn');
				timeColumn.querySelectorAll('.time_slot').forEach(slot => slot.remove());
				
				// filtered배열을 cinemaName으로 그룹핑.
				// 같은 cinemaName을 가지는 객체끼리 배열로 모임
				const grouped = filtered.reduce((acc, cur) => {
			        if (!acc[cur.cinemaName]) acc[cur.cinemaName] = [];
			        acc[cur.cinemaName].push(cur);
			        return acc;
			    }, {});
				
				// grouped의 cinemaName(키)를 하나씩 순회
				for (const cinemaName in grouped) {
			        const timeslot = document.createElement('div');
			        timeslot.classList.add('time_slot');
			        const first = grouped[cinemaName][0];
			        timeslot.innerHTML = '<strong><span class="theater_type">2D(자막)></span>' 
			        					+ first.cinemaName + '(' + first.cinemaSpecialName + ')</strong><br>';
			        
			        const timeContainer = document.createElement('div');
			        timeContainer.classList.add('time_container');

			        // 상영 시간과 좌석 수 표시
			        grouped[cinemaName].forEach(item => {
			            const timeBlock = document.createElement('div');
			            timeBlock.classList.add('time_block');
			            
			            timeBlock.onclick = () => {
			                // 모든 time_block에서 'selected' 제거
			                document.querySelectorAll('.time_block.selected').forEach(el => {
			                    el.classList.remove('selected');
			                });

			                // 현재 클릭한 요소에만 selected 추가
			                timeBlock.classList.add('selected');
			            };

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