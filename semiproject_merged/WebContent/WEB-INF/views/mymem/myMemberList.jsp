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
			<h1>ȸ������ ����Ʈ Demo</h1>
		</header>
		<form method="post" action="pro.kosmo">
			<input type="hidden" name="cmd" value="member"> <input
				type="hidden" name="scmd" value="mlist">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>��ȣ</th>
						<th>���̵�</th>
						<th>�̸�</th>
						<th>����</th>
						<th>����</th>
						<th>���Գ�¥</th>
					</tr>
				</thead>
				<tbody>
					<%-- �ݺ����� --%>
					<%--
	List<MymemberDTO> list = MyMemberDao.getDao().listMember();
	for(MymemberDTO e : list){ 
	--%>
					<c:forEach var="e" items="${list}">
						<tr>
							<td class="align-middle text-center">
								<%--=e.getNum() --%>${e.num}</td>
							<td class="text-center">
								<%--=e.getId() --%>${e.id}
							</td>
							<td class="align-middle">
								<%--=e.getName() --%>${e.name}</td>
							<td class="align-middle">
								<%--=e.getAge() --%>${e.age}</td>
							<td class="align-middle">
								<%--=e.getGender() --%>${e.gender}</td>
							<td class="align-middle">
								<%--=e.getMdate() --%>${e.mdate}
								
								</td>
						</tr>
					</c:forEach>
					<%--
	} 
	--%>
					<%-- �ݺ��� --%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<div class="row g-3 align-middle text-center">
								<div class="col-auto">
									<select class="form-select" 
									name="searchType" id="searchType"
									aria-label="Default select example">
										<option selected value="">�˻�</option>
										<option value="1">���̵�</option>
										<option value="2">�̸�</option>
									</select>
								</div>
								<div class="col-auto">
									<label for="searchValue" class="visually-hidden">searchValue</label>
									<input type="text" class="form-control" id="searchValue"
										name="searchValue" placeholder="searchValue">
								</div>
								<div class="col-auto">
									<button type="submit" class="btn btn-primary mb-3">Search</button>
								</div>
							</div>
						</td>
					</tr>


					<tr>
						<td colspan="5" style="text-align: center;"><input
							type="button" value="���ۼ�" id="wbtn" class="btn btn-outline-info">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
<script>
	$(function() {
		//wbtn ��ư Ŭ�� �̺�Ʈ
		$('#wbtn').click(function() {
			//�̵�
			location = "ex1_upform.jsp";
		});

	});
</script>

<%@ include file="../footer.jsp"%>
