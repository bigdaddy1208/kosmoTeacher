<%@page import="dao.UpBoardDao"%>
<%@page import="dto.UpBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content영역 -->
<div  class="container mt-5">
  <div class="row">
	<header>
    <h1>Board Demo</h1>
	</header>
	<table class="table table-bordered table-hover">
	<thead>
	   <tr>
			<th >번호</th>
			<th >이미지</th>
			<th >제목</th>
			<th >글쓴이</th>
			<th >작성날짜</th>
		</tr>
	</thead>
	<tbody>
	<%-- 반복시작 --%>
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
	<%-- 반복끝 --%>
	</tbody>
	<tfoot>
	<tr><td colspan="5" style="text-align: center;">
	<input type="button" value="글작성" id="wbtn" class="btn btn-outline-info"
		
	> 
	</td>
	</tr></tfoot>
	</table>
  </div>
</div>
<script>
	$(function(){
		//wbtn 버튼 클릭 이벤트
		$('#wbtn').click(function(){
			//이동
			location="ex1_upform.jsp";
		});		
	});
</script>


<%@ include file="../footer.jsp" %>
