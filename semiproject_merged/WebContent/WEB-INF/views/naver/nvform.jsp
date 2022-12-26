<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp"%>

<link href="fullcalendar/main.css" rel="stylesheet" />
<script src="fullcalendar/main.js"></script>
<script defer src="fullcalendar.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			contentHeight : 800
		});
		calendar.render();
	});
</script>

<style>
th {
	background-color: aliceblue;
}
</style>

<!-- Content영역  myLoginForm.jsp-->
<div class="container mt-5">
	<div class="row">
		<div id="sub1">
			<fieldset>
				<pre></pre>
				<pre></pre>
				<pre></pre>
				<pre></pre>
				<pre></pre>
				<pre></pre>

				<h2 align="center">예약하기</h2>
				<hr>

				<h3 align="center">환자 정보 확인</h3>
				<table border="1" style="border-collapse: collapse;" width=80%
					height=100% align="center">
					<tr>
						<th>이름</th>
						<td>홍길동</td>
						<th>생년월일</th>
						<td>2010년 10월 30일</td>
					</tr>

					<tr>
						<th>전화번호</th>
						<td>01022222222</td>
						<th>이메일 주소</th>
						<td>abc123@gamil.com</td>
					</tr>
				</table>

				<div class="container mt-3" align="center">
					<button type="button" class="btn btn-secondary">정보 수정</button>
				</div>

				<pre></pre>
				<pre></pre>
				<pre></pre>
				<pre></pre>
				<h3 align="center">진료과 및 의사 선택</h3>
				<div align="center">
					<div class="col-sm-5">
						<label
							style="font-weight: bold; font-size: large; align-self: center;
							background-color: #D6EAF8;">진료과
							선택</label>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1"> 호흡기내과
							</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								순환기내과 </label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								소화기내과 </label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								알레르기내과 </label>
						</div>
					</div>
					<br>
					<div class="col-sm-5">
						<label
							style="font-weight: bold; font-size: large; align-self: center;
							background-color: #D6EAF8;">의료진 선택 &nbsp;</label> <select name="doc" required="required">
							<option>김연경</option>
							<option>김연아</option>
							<option>김희진</option>
							<option>손흥민</option>
							<option>박세리</option>
						</select>
					</div>
				</div>
			</fieldset>


			<pre></pre>
			<pre></pre>
			<pre></pre>
			<pre></pre>
			<h3 align="center">날짜 지정</h3>


			<div class="row mb-3">
				<div id="calendar-container" style="size: 100px">
					<div id='calendar'></div>
				</div>
			</div>



			<div class="row mb-3">
				<label class="col-sm-2 col-form-label">시간</label>
				<div class="col-sm-10">
					<select name="timechoice" required="required">
						<option>10:00</option>
						<option>11:00</option>
						<option>13:00</option>
						<option>14:00</option>
						<option>15:00</option>
						<option>16:00</option>
					</select>

				</div>
			</div>
			<div class="container mt-3" align="center">
				<button type="button" class="btn btn-primary">예약하기</button>
			</div>

		</div>
	</div>
</div>

<div class="row mb-3">
	<div id='calendar'></div>
</div>



<%@ include file="../footer.jsp"%>