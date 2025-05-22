<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
	  
  <link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/movieDetail.css" />
	
	
<div class="detail_content_container_outbox">
	<div class="detail_content_container">
		<div class="detail_movie_content_txt">
			디지털상의 모든 정보를 통제할 수 있는 사상 초유의 무기로 인해<br> 
			전 세계 국가와 조직의 기능이 마비되고, 인류전체가 위협받는 절체절명의 위기가 찾아온다.<br> 
			이를 막을 수 있는 건 오직 존재 자체가 기밀인 ‘에단 헌트’와<br>
			그가 소속된 IMF(Impossible Mission Force)뿐이다.<br> <br> 
			
			무기를 무력화하는데 반드시 필요한 키를 손에 쥔 ‘에단 헌트’.<br> 
			오랜 동료 ‘루터’와 ‘벤지’, 그리고 새로운 팀원이 된	‘그레이스’, ‘파리’, ‘드가’와 함께<br> 
			지금껏 경험했던 그 어떤 상대보다도 강력한 적에 맞서<br>
			모두의 운명을 건 불가능한 미션에 뛰어든다!<br> <br> 
			
			<strong>모든 선택이 향하는 단 하나의 미션!<br> 
			&lt;미션 임파서블: 파이널 레코닝&gt;
			</strong>
		</div>
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
	                        <span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 99px; top: 128px;">남 57.3%</span>
	                        <span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 248px; top: 35px;">여 42.7%</span>
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
            </div>
	</div>
</div>
<script>
window.addEventListener("DOMContentLoaded", function () {
  const canvas = document.querySelector("#graph_sex .jqplot-base-canvas");
  const ctx = canvas.getContext("2d");

  const data = [
    { label: "남", value: 57.3, color: "#3e82a4" },
    { label: "여", value: 42.7, color: "#e74c3c" }
  ];

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
    ctx.fillText(`${item.label} ${item.value.toFixed(1)}%`, textX, textY);

    startAngle = endAngle;
  });
});
</script>





<script> // 막대그래프
window.addEventListener("DOMContentLoaded", function () {
  const canvas = document.querySelector("#graph_age .jqplot-series-canvas");
  const ctx = canvas.getContext("2d");

  const values = [1.4, 14.8, 26.4, 29.2, 28.2];
  const labels = ["10대", "20대", "30대", "40대", "50대"];
  const maxValue = 40;

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
});
</script>

