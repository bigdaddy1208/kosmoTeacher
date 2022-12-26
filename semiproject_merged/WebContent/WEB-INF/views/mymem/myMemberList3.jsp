<%@page import="dao.MyMemberDao"%>
<%@page import="dto.MymemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<c:set var="pageurl" value="pro.kosmo?cmd=member&scmd=mPagelist2&searchType=${searchType}&searchValue=${searchValue}&cPage"></c:set>
<style>
.pagination > li > a
{
    background-color: white;
    color: purple;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover
{
    color: #ffffff;
    background-color: #eee;
    border-color: #ddd;
}

.pagination > .active > a
{
    color: white;
    background-color: orange;
    border: solid 1px orange;
}

.pagination > .active > a:hover
{
    background-color: orange;
    border: solid 1px orange;
}
</style>
<!-- Content영역 -->
<div class="container mt-5">
	<div class="row">
		<header>
			<h1>회원관리 리스트 Demo3</h1>
		</header>
		<form method="post" action="pro.kosmo">
			<input type="hidden" name="cmd" value="member"> 
			<input type="hidden" name="scmd" value="mPagelist2">
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
					<c:forEach var="e" items="${list}">
						<tr>
							<td class="align-middle text-center">
								<%--=e.getNum() --%>${e.num}</td>
							<td class="text-center">
								<%--=e.getId() --%>${e.id}
							</td>
							<td class="align-middle">
								<%--=e.getName() --%>
								${e.name}
							</td>
							<td class="align-middle">
								<%--=e.getAge() --%>${e.age}</td>
							<td class="align-middle">
								<%--=e.getGender() --%>${e.gender}</td>
							<td class="align-middle">
								<%--=e.getMdate() --%>${e.mdate}

							</td>
						</tr>
					</c:forEach>
					<%-- 반복끝 --%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
								
									<c:choose>
								      <c:when test="${startPage <= pagePerBlock }">
								      <li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">Previous</a>
									   </li>
								      </c:when>
								      <c:otherwise>
								      <li class="page-item active"><a class="page-link"
										href="${pageurl }=${startPage -1 }" tabindex="-1">Previous</a>
									   </li>
								      </c:otherwise>
								     </c:choose>
									<c:forEach varStatus="i" begin="${startPage }" end="${endPage }" step="1">
										<c:choose>
											<c:when test="${i.index == nowPage }">
												<li class="page-item active"><a class="page-link"
													href="#">${i.index}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item "><a class="page-link" 
												href="${pageurl }=${i.index }">${i.index}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<%-- NextPage --%>
									<c:choose>
										<c:when test="${endPage >= totalPage }">
											<li class="page-item">
											<a href="" class="page-link"  aria-disabled="true">Next</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item active">
											<a class="page-link"
												href="${pageurl }=${endPage + 1 }">Next</a>
											</li>
										</c:otherwise>
									</c:choose>

								</ul>
							</nav> <%-- <ul  class="pagination">
							<c:forEach varStatus="i" 
							begin="${startPage }" end="${endPage }" step="1">
							<c:choose>
								<c:when test="${i.index == nowPage }">
								<li class="page-item active" aria-current="page">
								<a href="" class="page-link">${i.index }</a></li>
								</c:when>
								<c:otherwise>
								<li class="page-item"><a href="" class="page-link" >${i.index }</a></li>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							</ul> --%>
						</td>
					</tr>

					<tr>
						<td colspan="6">
							<div class="row g-3 justify-content-center">
								<div class="col-auto">
									<select class="form-select" name="searchType" id="searchType"
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
