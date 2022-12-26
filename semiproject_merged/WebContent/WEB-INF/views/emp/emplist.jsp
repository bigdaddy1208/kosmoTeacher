<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!-- Content영역 -->
<div class="container mt-5">
	<div class="row">
		<header>
			<h1>Emp 리스트 Demo</h1>
		</header>
		<form method="post" action="pro.kosmo">
			<input type="hidden" name="cmd" value="emplist">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>empno</th>
						<th>ename</th>
						<th>job</th>
						<th>mgr</th>
						<th>hiredate</th>
						<th>sal</th>
						<th>comm</th>
						<th>deptno</th>
					</tr>
				</thead>
				<tbody>
					<%-- 반복시작 --%>
					<c:forEach var="e" items="${list}">
						<tr>
							<td class="align-middle text-center">${e.empno}</td>
							<td class="text-center">${e.ename}</td>
							<td class="align-middle">${e.job}</td>
							<td class="align-middle">${e.mgr}</td>
							<td class="align-middle">${e.hiredate}</td>
							<td class="align-middle">${e.sal}</td>
							<td class="align-middle">${e.comm}</td>
							<td class="align-middle">${e.deptno}</td>
						</tr>
					</c:forEach>
					<%--
	} 
	--%>
					<%-- 반복끝 --%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8" >
							<div class="row g-3 align-middle text-center">
								<div class="col-auto">
									<label for="searchType" class="visually-hidden">Search</label>
									<input class="form-control" 
									name="searchType"
									list="datalistOptions" id="searchType">
									<datalist id="datalistOptions">
									  <option value="empno">
									  <option value="ename">
									  <option value="job">
									</datalist>
								</div>
								<div class="col-auto">
									<label for="searchValue" class="visually-hidden">Password</label>
									<input type="text" class="form-control" id="searchValue"
									name="searchValue"
										placeholder="searchValue">
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
