<%@page import="dao.UpBoardDao"%>
<%@page import="dto.UpBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content���� -->
<div  class="container mt-5">
  <div class="row">
	<header>
    <h1>Board Demo</h1>
	</header>
	<table class="table table-bordered table-hover">
	<thead>
	   <tr>
			<th >��ȣ</th>
			<th >�̹���</th>
			<th >����</th>
			<th >�۾���</th>
			<th >�ۼ���¥</th>
		</tr>
	</thead>
	<tbody>
	<%-- �ݺ����� --%>
	<%
		ArrayList<UpBoardDTO> list = UpBoardDao.getDao().upBoardList();
	for(UpBoardDTO e : list){ 
	%>
	<tr>
		<td class="align-middle text-center"><%=e.getNum() %></td>
		<td class="text-center">
		<a href="upBoardDetail.jsp?num=<%=e.getNum() %>">
		<img src="<%=request.getContextPath() %>/resources/upload/<%=e.getImgn()%>"
		style="width: 100px" class="rounded">
		</a>
		</td>
		<td class="align-middle"> <%=e.getSub() %></td>
		<td class="align-middle"> <%=e.getWriter() %></td>
		<td class="align-middle"> <%=e.getUdate() %></td>
	</tr>
	<%
	} 
	%>
	<%-- �ݺ��� --%>
	</tbody>
	<tfoot>
	<tr><td colspan="5" style="text-align: center;">
	<input type="button" value="���ۼ�" id="wbtn" class="btn btn-outline-info"
		
	> 
	</td>
	</tr></tfoot>
	</table>
  </div>
</div>
<script>
	$(function(){
		//wbtn ��ư Ŭ�� �̺�Ʈ
		$('#wbtn').click(function(){
			//�̵�
			location="ex1_upform.jsp";
		});		
	});
</script>


<%@ include file="../footer.jsp" %>
