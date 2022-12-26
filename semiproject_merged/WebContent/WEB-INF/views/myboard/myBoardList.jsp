<%@page import="dao.MyMemberDao"%>
<%@page import="dto.MymemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!-- Content���� -->
<div class="container mt-5">
	<div class="row">
		<header>
			<h1>MyBoard ����Ʈ Demo</h1>
		</header>
		<form method="post" action="pro.kosmo">
			<input type="hidden" name="cmd" value="myboard"> 
			<input	type="hidden" name="scmd" value="blist">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>��ȣ</th>
						<th>����</th>
						<th>�ۼ���</th>
						<th>������</th>
						<th>��¥</th>
					</tr>
				</thead>
				<tbody>
					<%-- �ݺ����� --%>
					<c:forEach var="e" items="${list}">
						<tr>
							<td  class="align-middle text-center">${e.no}</td>
							<td class="text-center">
							<a href="pro.kosmo?cmd=myboard&scmd=bdetail&no=${e.no}">
							${e.subject} </a>[${e.cnt}]
							</td>
							<td class="text-center">${e.writer}</td>
							<td class="align-middle">${e.reip}</td>
							<td class="align-middle">${regdate}</td>
						</tr>
					</c:forEach>
					<%-- �ݺ��� --%>
				</tbody>
				<div>
				<c:choose>
					<c:when test="${sessionScope.id==null}">
			<h3>�α��� ���� ���ۼ� ����~</h3>
			

               </c:when>
               <c:otherwise>
					<tr>
						<td colspan="5" style="text-align: center;">
						<input type="button" value="���ۼ�" id="wbtn" class="btn btn-outline-info">
						</td>
					</tr>
					</c:otherwise>
				</c:choose>
				</div>
			</table>
		</form>
	</div>
</div>
<script>
	$(function() {
		//wbtn ��ư Ŭ�� �̺�Ʈ
		$('#wbtn').click(function() {
			//�̵�
			location = "pro.kosmo?cmd=myboard&scmd=bform";
		});

	});
</script>

<%@ include file="../footer.jsp"%>
