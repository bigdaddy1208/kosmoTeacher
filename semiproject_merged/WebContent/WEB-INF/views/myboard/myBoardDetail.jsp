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
			<h1>MyBoard Detail리스트 Demo</h1>
		</header>
			
				<div class="row mb-3">
   				<label class="col-sm-2 col-form-label">writer</label>
   				
   				<div class="col-sm-10">${vo.writer}</div> 
   				</div>
   				<div class="row mb-3">
   				<label class="col-sm-2 col-form-label">subject </label>
   				<div class="col-sm-10">${vo.subject} </div> 
   				</div>
   				<div class="row mb-3">
   				<label class="col-sm-2 col-form-label">content</label>
   				<div class="col-sm-10">${vo.content} </div> 
   				</div>
   				<div class="row mb-3">
   				<label class="col-sm-2 col-form-label">Date</label>
   				<div class="col-sm-10">${vo.regdate} </div> 
   				</div>
   				<div class="row mb-3">
   				<label class="col-sm-2 col-form-label">Reip</label>
   				<div class="col-sm-10">${vo.reip} </div> 
   				</div>
   				<div>
				<tr>
					<td colspan="5" style="text-align: center;">
					<input type="button" value="글작성" id="wbtn" class="btn btn-outline-info"/>
					 <input type="button" value="리스트" id="listBtn" class="btn btn-danger" />
					
				<c:choose>
					<c:when test="${sessionScope.id==vo.writer}">
					<li><a href="pro.kosmo?cmd=myboard&scmd=bdelete&no=${vo.no}">삭제</a></li>
					</c:when>
					
					<c:otherwise>
					<a>본인만 삭제가능
					</c:otherwise>
					
					</c:choose>
					 
					
					
					 
					 
					
					</td>
				</tr>
			</div>
			<h2>댓글등록</h2>
   				<form method="post" action="pro.kosmo">
				<div class="row mb-3">
					<input type="hidden" name="cmd" value="myboard"> 
					<input	type="hidden" name="scmd" value="bcominsert">
					<input	type="hidden" name="mcode" value="${vo.no}">
				</div>
				<div class="col sm-10">
				<label class="col-sm-2 col-form-label">writer</label>
				<input type="text" name="mwriter" id="mwriter" placeholder="writer를 입력하세요"/>
				<textarea rows="3" name="mcontent" class="form-control" id="mcontent"></textarea>
				<input type="submit" value="등록" id="btn1" class="btn btn-info"/>
				</div>

				<table class="table">
				<h2>댓글목록</h2>
				<thead>
				<tr>
					<th>no</th>
					<th>writer</th>
					<th>content</th>
					<th>reip</th>
					<th>date</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="e" items="${listcomm}">
				<tr>
					<td>${e.no }</td>
					<td>${e.mwriter }</td>
					<td>${e.mcontent }</td>
					<td>${e.reip }</td>
					<td>${e.mregdate }</td>
				</tr>
				</c:forEach>
				</tbody>
			
			</table>
		</form>
	</div>
</div>
<script>
	$(function() {
		//wbtn 버튼 클릭 이벤트
		$('#wbtn').click(function() {
			//이동
			location = "pro.kosmo?cmd=myboard&scmd=bform";
		});
		//list 버튼 클릭 이벤트
		$('#listBtn').click(function() {
			//강제이동
			//location = "index.jsp";
			location = "pro.kosmo?cmd=myboard&scmd=blist";
		});
		
	});
</script>

<%@ include file="../footer.jsp"%>
