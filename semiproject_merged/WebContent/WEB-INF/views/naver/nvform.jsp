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

<!-- Content����  myLoginForm.jsp-->
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

				<h2 align="center">�����ϱ�</h2>
				<hr>

				<h3 align="center">ȯ�� ���� Ȯ��</h3>
				<table border="1" style="border-collapse: collapse;" width=80%
					height=100% align="center">
					<tr>
						<th>�̸�</th>
						<td>ȫ�浿</td>
						<th>�������</th>
						<td>2010�� 10�� 30��</td>
					</tr>

					<tr>
						<th>��ȭ��ȣ</th>
						<td>01022222222</td>
						<th>�̸��� �ּ�</th>
						<td>abc123@gamil.com</td>
					</tr>
				</table>

				<div class="container mt-3" align="center">
					<button type="button" class="btn btn-secondary">���� ����</button>
				</div>

				<pre></pre>
				<pre></pre>
				<pre></pre>
				<pre></pre>
				<h3 align="center">����� �� �ǻ� ����</h3>
				<div align="center">
					<div class="col-sm-5">
						<label
							style="font-weight: bold; font-size: large; align-self: center;
							background-color: #D6EAF8;">�����
							����</label>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1"> ȣ��⳻��
							</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								��ȯ�⳻�� </label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								��ȭ�⳻�� </label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								�˷����⳻�� </label>
						</div>
					</div>
					<br>
					<div class="col-sm-5">
						<label
							style="font-weight: bold; font-size: large; align-self: center;
							background-color: #D6EAF8;">�Ƿ��� ���� &nbsp;</label> <select name="doc" required="required">
							<option>�迬��</option>
							<option>�迬��</option>
							<option>������</option>
							<option>�����</option>
							<option>�ڼ���</option>
						</select>
					</div>
				</div>
			</fieldset>


			<pre></pre>
			<pre></pre>
			<pre></pre>
			<pre></pre>
			<h3 align="center">��¥ ����</h3>


			<div class="row mb-3">
				<div id="calendar-container" style="size: 100px">
					<div id='calendar'></div>
				</div>
			</div>



			<div class="row mb-3">
				<label class="col-sm-2 col-form-label">�ð�</label>
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
				<button type="button" class="btn btn-primary">�����ϱ�</button>
			</div>

		</div>
	</div>
</div>

<div class="row mb-3">
	<div id='calendar'></div>
</div>



<%@ include file="../footer.jsp"%>