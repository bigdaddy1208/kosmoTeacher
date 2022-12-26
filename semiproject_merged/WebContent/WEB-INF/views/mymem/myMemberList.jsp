<%@page import="dao.MyMemberDao"%>
<%@page import="dto.MymemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!-- Content영역 -->
<div class="container mt-5">
	<div class="row">
		<header>
			<h1>회원관리 리스트 Demo</h1>
		</header>
		<form method="post" action="pro.kosmo">
			<input type="hidden" name="cmd" value="member"> <input
				type="hidden" name="scmd" value="mlist">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>성별</th>
						<th>가입날짜</th>
					</tr>
				</thead>
				<tbody>
					<%-- 반복시작 --%>
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
					<%-- 반복끝 --%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<div class="row g-3 align-middle text-center">
								<div class="col-auto">
									<select class="form-select" 
									name="searchType" id="searchType"
									aria-label="Default select example">
										<option selected value="">검색</option>
										<option value="1">아이디</option>
										<option value="2">이름</option>
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
							type="button" value="글작성" id="wbtn" class="btn btn-outline-info">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
<script>
	$(function() {
		//wbtn 버튼 클릭 이벤트
		$('#wbtn').click(function() {
			//이동
			location = "ex1_upform.jsp";
		});

	});
</script>

<%@ include file="../footer.jsp"%>
