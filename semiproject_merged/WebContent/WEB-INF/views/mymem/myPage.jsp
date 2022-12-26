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
<!-- Content���� -->
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



<!-- view ���� -->
<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>

<pre></pre>
<pre></pre>


<h1 align="center">����������</h1>

<hr>

<br>
<h3 align="center">&nbsp;ȯ�� ����</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<td rowspan="3" align="center" width="100" height="100"></td>
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

	<tr>
		<th>ȯ�ڹ�ȣ</th>
		<td>77894263</td>
		<th>(��) ����</th>
		<td>11��</td>
	</tr>

	<tr>
		<th>�ּ�</th>
		<td colspan="4">����Ư���� ���۱� �������� 11-1 302�� 802ȣ</td>
	</tr>
</table>

<div class="container mt-3" align="center">
	<button type="button" class="btn btn-secondary">���� ����</button>
</div>


<pre></pre>
<pre></pre>

<h3 align="center">&nbsp;���᳻��</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<th rowspan="4" align="center" width="100" height="100">���᳻��</th>
	</tr>

	<tr>
		<td>����: 2�� �索 - ����: 120mg/dL, ��ȭ������: 6.1%</td>
	</tr>

	<tr>
		<td>����: 2�� �索 - ����: 130mg/dL, ��ȭ������: 5.1%</td>
	</tr>

	<tr>
		<td>����: 2�� �索 - ����: 100mg/dL, ��ȭ������: 5.5%</td>
	</tr>

	<tr>
		<th>Ư�̻���</th>
		<td>2�� �索�� 3����ġ ó�� / �ν��� ó��</td>
	</tr>
</table>

<div class="container mt-3" align="center">
	<button type="button" class="btn btn-secondary" style="width: 50">���᳻��</button>
</div>

<pre></pre>
<pre></pre>

<h3 align="center">&nbsp;�ǰ� ���� ��Ʈ</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
		<th>�� ��ġ</th>
		<td>0000</td>
		<th>���� ��ġ</th>
		<td>120</td>
	</tr>

	<tr>
		<th>����</th>
		<td>0000</td>
		<th>���۷κ� ��ġ</th>
		<td>120</td>
	</tr>

	<tr>
		<th>���� ��ġ</th>
		<td>0000</td>
		<th>����</th>
		<td>120</td>
	</tr>

	<tr>
		<th>�����ȭ��</th>
		<td>0000</td>
		<th>�ɸ�</th>
		<td>120</td>
	</tr>

	<tr>
		<th>ü��</th>
		<td>90</td>
		<th>�ݷ���Ʈ��</th>
		<td>120</td>
	</tr>

	<tr>
		<th>�÷�(��)</th>
		<td>1.0</td>
		<th>�÷�(��)</th>
		<td>2.0</td>
	</tr>
</table>
<div class="container mt-3" align="center">
	<button type="button" class="btn btn-secondary">���� ����</button>
</div>


<%
	String yyear = "2022"; //���ϴ� �⵵ ����
	String mmonth = "12"; //���ϴ� �� ����
	int year = 0, month = 0;
	year = Integer.parseInt(yyear); //int�� ����ȯ
	month = Integer.parseInt(mmonth); //int�� ����ȯ
%>

<pre></pre>
<pre></pre>
<pre></pre>
<pre></pre>
<h3 align="center">&nbsp;�������</h3>
<table border="1" style="border-collapse: collapse;" width=50%
	height=50% align="center">
	<%
		Calendar cal = Calendar.getInstance(); //Calendar ��ü ȣ��
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1); //0�� ~11�� ��ǻ�ʹ� �Ѵ� �����Ƿ� -1�� �ؾ� ���ϴ� ���� ���� �� �ִ�.
		cal.set(Calendar.DATE, 1);
		int statOfDay = cal.get(Calendar.DAY_OF_WEEK); //1���� � ����

		int endOfDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //�ش� ���� ������ ��¥
		out.print("<tr><td colspan='7' align= center>" + year + "�� " + month + "�� </td></tr>");
		out.print("<tr><td>Sun</td><td>Mon</td><td>Tus</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>");
		out.print("<tr>");
		for (int i = 1; i < statOfDay; i++) { //�ش� ���� 1���� ���ϰ� ��ŭ ���� ����
			out.print("<td>&nbsp;</td>");
		}

		for (int i = 1; i <= endOfDay; i++) {
			if ((statOfDay - 2 + i) % 7 == 0) { //����� ����
				out.print("<td><font color='red'>" + i + "</font></td>");
			} else if ((statOfDay - 1 + i) % 7 == 0) { //�Ͽ��� ����
				out.print("<td><font color='blue'>" + i + "</font></td>");
			} else {
				out.print("<td>" + i + "</td>"); //�׿� ����
			}
			if ((statOfDay - 1 + i) % 7 == 0) {
				out.print("</tr><tr>"); //1������ ������ ���� tr �±� �ݰ� ���� ����
			}
		}
		out.print("</tr>");
	%>

</table>
<div class="container mt-3" align="center">
	<button type="button" class="btn btn-primary">���� ����</button>
	<button type="button" class="btn btn-secondary">���� ���</button>
</div>


<pre></pre>
<pre></pre>
<pre></pre>


<h3 align="center">&nbsp; �索 ��Ʈ Ȯ��</h3>
<table border="1" style="border-collapse: collapse;" width=70%
	align="center">
	<tr>
		<td rowspan="6" align="center" width="400" height="100"><img
			src="img/chartPng.PNG"></td>
	</tr>

	<tr>
	<th>12/1</th>
		<td> 2�� �索 - ����: 120mg/dL, ��ȭ������: 6.1%</td>
		<th>12/2</th>
		<td>����: 120mg/dL, ��ȭ������: 6.1%</td>

	</tr>

	<tr>
		<th>12/2</th>
		<td>2�� �索 - ����: 130mg/dL, ��ȭ������: 5.1%</td>
		<th>12/2</th>
		<td>����: 120mg/dL, ��ȭ������: 6.1%</td>
	</tr>

	<tr>
		<th>12/3</th>
		<td>2�� �索 - ����: 100mg/dL, ��ȭ������: 5.5%</td>
		<th>12/2</th>
		<td>����: 120mg/dL, ��ȭ������: 6.1%</td>
	</tr>

	<tr>
		<th>12/4</th>
		<td>2�� �索 - ����: 120mg/dL, ��ȭ������: 6.1%</td>
		<th>12/2</th>
		<td>����: 120mg/dL, ��ȭ������: 6.1%</td>
	</tr>

	<tr>
		<th>12/5</th>
		<td>2�� �索 - ����: 130mg/dL, ��ȭ������: 5.1%</td>
		<th>12/2</th>
	</tr>



</table>
<div class="container mt-3" align="center">
	<button type="button" class="btn btn-primary">�索 ����</button>
	<button type="button" class="btn btn-secondary">���� ��ġ �Է�</button>
</div>




<%@ include file="../footer.jsp"%>