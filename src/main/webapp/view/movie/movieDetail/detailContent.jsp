<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />	
	
<div class="detail_content_container_outbox">
	<div class="detail_content_container">
		<div id="chart" class="graph detail_graph">
                <ul class="graph">
                    <li>
                        <strong>성별 예매 분포</strong>
                        <div id="graph_sex" class="chart jqplot-target" style="position: relative;">
	                        <canvas width="400" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas>
	                        <div class="jqplot-title" style="height: 0px; width: 0px;"></div>
	                        <canvas width="400" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas>
	                        <canvas width="380" height="159" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
	                        <canvas width="380" height="159" class="jqplot-series-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
	                        <canvas width="380" height="159" class="jqplot-donutRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
	                        <span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 99px; top: 128px;">남 <span id="man">90%</span></span>
	                        <span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 248px; top: 35px;">여 10%</span>
	                        <canvas width="380" height="159" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
                        </div>
                    </li>
                    <li>
                        <strong>연령별 예매 분포</strong>
                        <div id="graph_age" class="chart jqplot-target" style="position: relative;">
                        	<canvas width="400" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas>
                        	<div class="jqplot-title" style="height: 0px; width: 0px;"></div>
                        	<div class="jqplot-axis jqplot-xaxis" style="position: absolute; width: 400px; height: 14px; left: 0px; bottom: 0px;">
	                        	<div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 36px;">10대</div>
	                        	<div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 112px;">20대</div>
	                        	<div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 188px;">30대</div>
	                        	<div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 264px;">40대</div>
	                        	<div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 340px;">50대</div>
                        	</div>
                        	<div class="jqplot-axis jqplot-yaxis" style="position: absolute; height: 192px; width: 0px; left: 0px; top: 0px;"></div>
	                        	<canvas width="400" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas>
	                        	<canvas width="380" height="158" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas>
	                        	<canvas width="380" height="158" class="jqplot-series-canvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas>
	                        	<div class="jqplot-point-label jqplot-series-0 jqplot-point-4" style="position: absolute; left: 342.5px; top: 38.61px; display: block;">28.2</div>
	                        	<div class="jqplot-point-label jqplot-series-0 jqplot-point-3" style="position: absolute; left: 266.5px; top: 34.66px; display: block;">29.2</div>
	                        	<div class="jqplot-point-label jqplot-series-0 jqplot-point-2" style="position: absolute; left: 190.5px; top: 45.72px; display: block;">26.4</div>
	                        	<div class="jqplot-point-label jqplot-series-0 jqplot-point-1" style="position: absolute; left: 114.5px; top: 91.54px; display: block;">14.8</div>
	                        	<div class="jqplot-point-label jqplot-series-0 jqplot-point-0" style="position: absolute; left: 41px; top: 144.47px; display: block;">1.4</div>
	                        	<canvas width="380" height="158" class="jqplot-barRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
	                        	<canvas width="380" height="158" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
                        	</div>
                    </li>
                    
                </ul>
                <span class ="graph_gender_txt graph_woman"><div class="color_box_woman"></div>여자: <strong id="graph_woman"></strong></span>
                <span class ="graph_gender_txt graph_man"><div class="color_box_man"></div>남자 : <strong id="graph_man"></strong></span>
            </div>
	</div>
</div>

<script>


/*********************
 *  시작 event
 **********************/
window.addEventListener("DOMContentLoaded", function () {
	원형그래프();
	막대그래프();
  
  
  
  
  genderGraph();
  ageGraph();
});




//성별 그래프 보이기
function genderGraph() {
	$.ajax({
		url: '${pageContext.request.contextPath}/MovieDetailGenderGraph.mo',
		data: {'movieIdx': movieDetailIdx},
		type: 'get',
		dataType: 'json',
		success: function(res) {
			if(res.code === 200) {
				
				//총합 구하기 ( 백분율 구하기 위한 계산 )
				const totalCount = Number(res.data.manCount) + Number(res.data.womanCount);
				
				//각 성별로 Count 추출
				const manCount = res.data.manCount;
				const womanCount = res.data.womanCount;
				
				//각 성별료 백분율
				const manPercent = manCount/totalCount*100;
				const womanPercent = womanCount/totalCount*100;
				
				// 그래프 값 넣기
				원형그래프_데이터[0].value = manCount;
				document.getElementById("graph_man").innerText = manPercent + "%";
				원형그래프_데이터[1].value = womanCount;
				document.getElementById("graph_woman").innerText = womanPercent + "%";

				
				
				원형그래프();
			}
		}
			
	});
}

//연령별 불러오기
function ageGraph() {
	$.ajax({
		url: '${pageContext.request.contextPath}/MovieDetailAgeGraph.mo',
		data: {'movieIdx': movieDetailIdx},
		type: 'get',
		dataType: 'json',
		success: function(res) {
			
			if(res.code === 200) {
				막대그래프_연령데이터[0] = (res.data.age10 / res.data.ageAll) *100;
				막대그래프_연령데이터[1] = (res.data.age20 / res.data.ageAll) *100;
				막대그래프_연령데이터[2] = (res.data.age30 / res.data.ageAll) *100;
				막대그래프_연령데이터[3] = (res.data.age40 / res.data.ageAll) *100;
				막대그래프_연령데이터[4] = (res.data.age50 / res.data.ageAll) *100;
				
				
				막대그래프();
			}
		}
			
	});
}




/*********************
 *  그래프 당당 영역
 **********************/
 
 //성별 데이터
 let 원형그래프_데이터 = [
				    { label: "남", value: 10, color: "#3e82a4" },
				    { label: "여", value: 20, color: "#e74c3c" }
				  ];
				  
let 막대그래프_연령라벨 = ["10대", "20대", "30대", "40대", "50대"];
let 막대그래프_연령데이터 = [1.4, 14.8, 26.4, 29.2, 28.2];
let 막대그래프_최대값 = 100;

 
 //원형 그래프
function 원형그래프(){
	const canvas = document.querySelector("#graph_sex .jqplot-base-canvas");
	  const ctx = canvas.getContext("2d");

	  let data = 원형그래프_데이터;

	  const total = data.reduce((acc, item) => acc + item.value, 0);
	  const centerX = canvas.width / 2;
	  const centerY = canvas.height / 2;

	  const outerRadius = 80;
	  const innerRadius = 20;  // 도넛 중앙 공간 확보
	  
	  let startAngle = -Math.PI / 2; // 시작 각도 (12시 방향)

	  ctx.clearRect(0, 0, canvas.width, canvas.height);

	  data.forEach((item) => {
		    const sliceAngle = (item.value / total) * 2 * Math.PI;
		    const endAngle = startAngle + sliceAngle;
	
		    // 도넛 그리기
		    ctx.beginPath();
		    ctx.arc(centerX, centerY, outerRadius, startAngle, endAngle);
		    ctx.arc(centerX, centerY, innerRadius, endAngle, startAngle, true);
		    ctx.closePath();
		    ctx.fillStyle = item.color;
		    ctx.fill();
	
		    // 텍스트 표시 (도넛 중간 지점에)
		    const midAngle = startAngle + sliceAngle / 2;
		    const textRadius = (outerRadius + innerRadius) / 2;
		    const textX = centerX + textRadius * Math.cos(midAngle);
		    const textY = centerY + textRadius * Math.sin(midAngle);
	
		    ctx.fillStyle = "#111";
		    ctx.font = "bold 14px Arial";
		    ctx.textAlign = "center";
		    ctx.textBaseline = "middle";
		    // ctx.fillText(`${item.label} ${item.value.toFixed(1)}%`, textX, textY);
	
		    startAngle = endAngle;
	});
};


/**************
 * 막대 그래프
 **************/
function 막대그래프() {
  const canvas = document.querySelector("#graph_age .jqplot-series-canvas");
  const ctx = canvas.getContext("2d");

  const labels = 막대그래프_연령라벨;
  const values = 막대그래프_연령데이터;
  const maxValue = 막대그래프_최대값;

  const width = canvas.width;
  const height = canvas.height;

  const barWidth = 25;
  const gap = 50;
  const baseX = 30;
  const baseY = height - 20;
  const scale = (height - 20) / maxValue;

  // 가장 높은 값 찾기
  const maxDataValue = Math.max(...values);

  ctx.clearRect(0, 0, width, height);
  ctx.font = "12px Arial";

  values.forEach((value, index) => {
    const x = baseX + index * (barWidth + gap);
    const barHeight = value * scale;

    // 막대 색상: 최대값은 갈색, 나머지는 검정색
    ctx.fillStyle = (value === maxDataValue) ? "#a16423" : "#222";

    // 막대 그리기
    ctx.fillRect(x, baseY - barHeight, barWidth, barHeight);

    // 수치 텍스트 가운데 정렬
    const valueText = value.toFixed(1);
    const valueWidth = ctx.measureText(valueText).width;
    ctx.fillStyle = "#333";
    ctx.fillText(valueText, x + (barWidth / 2) - (valueWidth / 2), baseY - barHeight - 8);

    // 레이블 가운데 정렬
    const labelText = labels[index];
    const labelWidth = ctx.measureText(labelText).width;
 // 레이블 가운데 정렬 (하단 여백 조절 ↓)
    ctx.fillText(labelText, x + (barWidth / 2) - (labelWidth / 2), baseY + 15);

  });
};
</script>