<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header.jsp"%>
<div class="container mt-5">
	<div class="row">
		<div id="sub1">
			<fieldset>
				<legend>MV Detail ${vo.year }�� ${vo.mon }�� ${vo.day }</legend>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">movie</label>
					<div class="col-sm-10">
	<table class="table">
		<tr>
			<th>��</th>
			<th>��</th>
			<th>ȭ</th>
			<th>��</th>
			<th>��</th>
			<th>��</th>
			<th>��</th>
		</tr>
		<tr>
		<c:forEach var="i" begin="1" end="${vo.totalTd }" step="1">
			<%--				
				for(int i=1; i<=totalTd; i=i+1) {
			--%>
					<td>
					<c:set var="num" value="${i-vo.beginBlank }"/>
					<c:choose>
						<c:when test="${num < 1 || num > vo.lastDate }">
							&nbsp;
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${num == vo.day }">
								<span style="color:bluel;background-color: orange">${num }</span>
								</c:when>
								<c:otherwise>
								${num }
								</c:otherwise>
							</c:choose>
							
						
						</c:otherwise>
					</c:choose>
					</td>
					<c:if test="${i != vo.totalTd && i%7==0 }">
						</tr><tr>
					</c:if>
			</c:forEach>		
		</tr>
	</table>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
</div>
					<c:forEach varStatus="i" step="1" begin="1" end="8">
					<p>&nbsp;</p>
					
					</c:forEach>

<script>
	//pro.kosmo?cmd=myboard&scmd=blist
	$(function() {
		//wbtn ��ư Ŭ�� �̺�Ʈ
		$('#listBtn').click(function() {
			//�̵�
			location = "pro.kosmo?cmd=myboard&scmd=blist";
		});

	});
</script>
<script src="resources/js/script.js"></script>













<%@include file="../footer.jsp"%>