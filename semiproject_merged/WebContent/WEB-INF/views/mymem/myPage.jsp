<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp"%>

<style>
th {
	background-color: aliceblue;
}

h3 {
	color: #6495ed;

}

</style>
<!-- Content영역 -->
<link href="fullcalendar/main.css" rel="stylesheet" />
<script src="fullcalendar/main.js"></script>
<!-- calendar -->
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



<!-- view 영역 -->
<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>

<pre></pre>
<pre></pre>


<h1 align="center">마이페이지</h1>

<hr>

<br>
<h3 align="center">&nbsp;환자 정보</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<td rowspan="3" align="center" width="100" height="100"></td>
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

	<tr>
		<th>환자번호</th>
		<td>77894263</td>
		<th>(만) 나이</th>
		<td>11세</td>
	</tr>

	<tr>
		<th>주소</th>
		<td colspan="4">서울특별시 동작구 구구구동 11-1 302동 802호</td>
	</tr>
</table>

<div class="container mt-3" align="center">
	<button type="button" class="btn btn-secondary">정보 수정</button>
</div>


<pre></pre>
<pre></pre>

<h3 align="center">&nbsp;진료내역</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<th rowspan="4" align="center" width="100" height="100">진료내역</th>
	</tr>

	<tr>
		<td>초진: 2형 당뇨 - 혈당: 120mg/dL, 당화혈색소: 6.1%</td>
	</tr>

	<tr>
		<td>초진: 2형 당뇨 - 혈당: 130mg/dL, 당화혈색소: 5.1%</td>
	</tr>

	<tr>
		<td>초진: 2형 당뇨 - 혈당: 100mg/dL, 당화혈색소: 5.5%</td>
	</tr>

	<tr>
		<th>특이사항</th>
		<td>2형 당뇨약 3개월치 처방 / 인슐린 처방</td>
	</tr>
</table>

<div class="container mt-3" align="center">
	<button type="button" class="btn btn-secondary" style="width: 50">진료내역</button>
</div>

<pre></pre>
<pre></pre>

<h3 align="center">&nbsp;건강 검진 차트</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
		<th>간 수치</th>
		<td>0000</td>
		<th>혈당 수치</th>
		<td>120</td>
	</tr>

	<tr>
		<th>혈압</th>
		<td>0000</td>
		<th>헤모글로빈 수치</th>
		<td>120</td>
	</tr>

	<tr>
		<th>신장 수치</th>
		<td>0000</td>
		<th>혈장</th>
		<td>120</td>
	</tr>

	<tr>
		<th>산소포화도</th>
		<td>0000</td>
		<th>심맥</th>
		<td>120</td>
	</tr>

	<tr>
		<th>체중</th>
		<td>90</td>
		<th>콜레스트롤</th>
		<td>120</td>
	</tr>

	<tr>
		<th>시력(좌)</th>
		<td>1.0</td>
		<th>시력(우)</th>
		<td>2.0</td>
	</tr>
</table>
<div class="container mt-3" align="center">
	<button type="button" class="btn btn-secondary">정보 수정</button>
</div>


<%
	String yyear = "2022"; //원하는 년도 세팅
	String mmonth = "12"; //원하는 월 세팅
	int year = 0, month = 0;
	year = Integer.parseInt(yyear); //int로 형변환
	month = Integer.parseInt(mmonth); //int로 형변환
%>

<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>
<h3 align="center">&nbsp;예약관련</h3>
<table border="1" style="border-collapse: collapse;" width=50%
	height=50% align="center">
	<%
		Calendar cal = Calendar.getInstance(); //Calendar 객체 호출
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1); //0월 ~11월 컴퓨터는 한달 빠르므로 -1을 해야 원하는 달을 얻을 수 있다.
		cal.set(Calendar.DATE, 1);
		int statOfDay = cal.get(Calendar.DAY_OF_WEEK); //1일이 어떤 요일

		int endOfDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 월의 마지막 날짜
		out.print("<tr><td colspan='7' align= center>" + year + "년 " + month + "월 </td></tr>");
		out.print("<tr><td>Sun</td><td>Mon</td><td>Tus</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>");
		out.print("<tr>");
		for (int i = 1; i < statOfDay; i++) { //해당 월의 1일의 요일값 만큼 공백 세팅
			out.print("<td>&nbsp;</td>");
		}

		for (int i = 1; i <= endOfDay; i++) {
			if ((statOfDay - 2 + i) % 7 == 0) { //토요일 세팅
				out.print("<td><font color='red'>" + i + "</font></td>");
			} else if ((statOfDay - 1 + i) % 7 == 0) { //일요일 세팅
				out.print("<td><font color='blue'>" + i + "</font></td>");
			} else {
				out.print("<td>" + i + "</td>"); //그외 평일
			}
			if ((statOfDay - 1 + i) % 7 == 0) {
				out.print("</tr><tr>"); //1주일이 끝날때 마다 tr 태그 닫고 새로 시작
			}
		}
		out.print("</tr>");
	%>

</table>
<div class="container mt-3" align="center">
	<button type="button" class="btn btn-primary">예약 수정</button>
	<button type="button" class="btn btn-secondary">예약 취소</button>
</div>


<pre></pre>
<pre></pre>
<pre></pre>


<h3 align="center">&nbsp; 당뇨 차트 확인</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<td rowspan="6" align="center" width="400" height="100"><img
			src="img/chartPng.PNG"></td>
	</tr>

	<tr>
	<th>12/1</th>
		<td> 2형 당뇨 - 혈당: 120mg/dL, 당화혈색소: 6.1%</td>
		<th>12/2</th>
		<td>혈당: 120mg/dL, 당화혈색소: 6.1%</td>

	</tr>

	<tr>
		<th>12/2</th>
		<td>2형 당뇨 - 혈당: 130mg/dL, 당화혈색소: 5.1%</td>
		<th>12/2</th>
		<td>혈당: 120mg/dL, 당화혈색소: 6.1%</td>
	</tr>

	<tr>
		<th>12/3</th>
		<td>2형 당뇨 - 혈당: 100mg/dL, 당화혈색소: 5.5%</td>
		<th>12/2</th>
		<td>혈당: 120mg/dL, 당화혈색소: 6.1%</td>
	</tr>

	<tr>
		<th>12/4</th>
		<td>2형 당뇨 - 혈당: 120mg/dL, 당화혈색소: 6.1%</td>
		<th>12/2</th>
		<td>혈당: 120mg/dL, 당화혈색소: 6.1%</td>
	</tr>

	<tr>
		<th>12/5</th>
		<td>2형 당뇨 - 혈당: 130mg/dL, 당화혈색소: 5.1%</td>
		<th>12/2</th>
	</tr>



</table>
<div class="container mt-3" align="center">
	<button type="button" class="btn btn-primary">당뇨 진단</button>
	<button type="button" class="btn btn-secondary">혈당 수치 입력</button>
</div>




<%@ include file="../footer.jsp"%>