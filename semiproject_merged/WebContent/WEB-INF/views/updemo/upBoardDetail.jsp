<%@page import="dto.UpBoardDTO"%>
<%@page import="dao.UpBoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	UpBoardDTO vo = UpBoardDao.getDao().upBoardDetail(num);
%>   
<!-- Content���� -->
<div  class="container mt-5">
  <div class="row">
	<div id="sub1">
<fieldset>
<legend>�̹��� ���ε� ��</legend>
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�� ��</label>
   <div class="col-sm-10"><%=vo.getSub() %></div>
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�ۼ���</label>
   <div class="col-sm-10"><%=vo.getWriter() %></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label"> ����</label>
    <div class="col-sm-10"><%=vo.getCont() %>
    </div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label"> �̹���</label>
    <div class="col-sm-10">
 <img src="<%=request.getContextPath() %>/resources/upload/<%=vo.getImgn()%>" id="imgx" >
</div>
    <div class="col-sm-10 text-center" style="margin: 5px;">
    <a href="<%=request.getContextPath() %>/resources/upload/<%=vo.getImgn()%>" download
    class="btn btn-warning" role="button">download</a>
    </div>
</div>  
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">��¥</label>
    <div class="col-sm-10"><%=vo.getUdate() %>
    </div>
</div>                      
<div class="row mb-3 ">
 <div class="col-sm-10">
 <input type="button" value="���" id="wbtn" class="btn btn-info"/>
 <input type="button" value="����Ʈ" id="listBtn" class="btn btn-danger" onclick="location='ex1_list.jsp?cPage=1'"/>
 </div>
</div>

</fieldset>
  </div>
  </div>
</div>

<script>
	$(function(){
		//wbtn
		$('#wbtn').click(function(){
			location="ex1_upform.jsp";
		});
		
		//listBtn
		$('#listBtn').click(function(){
			location="ex1_upboardList.jsp";
		});
	});
</script>

<%@ include file="../footer.jsp" %>