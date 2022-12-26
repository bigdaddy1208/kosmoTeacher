<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content���� -->
<div  class="container mt-5">
<div class="row">
<div id="sub1">
<fieldset>
<legend>MyBoard UP</legend>
<a href="idchk.jsp?id=xman">�����</a>
<form method="post" action="pro.kosmo"  id="boardform">
<input type="hidden" name="cmd" value="myboard">
<input type="hidden" name="scmd" value="binsert">

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�ۼ��� �ڵ����� �Է�</label>
   <div class="col-sm-10">
   <input type="hidden" name="writer" id="writer" value="${sessionScope.pid}" /></div>
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">����</label>
   <div class="col-sm-10">
   <input type="text" name="subject" id="subject"/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">����</label>
    <div class="col-sm-10">
    <input type="text" name="content" id="content"/></div>
</div>

                   
<div class="row mb-3 ">
 <div class="col-sm-10">
 <c:choose>
<c:when test="${sessionScope.pid==null}">
�α����� ��ϰ��� / ����Ʈ�� �̿밡��
 </c:when>
 <c:otherwise>
 <input type="submit" value="���" id="btn1" class="btn btn-info"/>
 </c:otherwise>
 </c:choose>
 
 
 <input type="button" value="����Ʈ" id="listBtn" class="btn btn-danger" />
 </div>
</div>
</form>
</fieldset>
  </div>
  </div>
</div>
<script>
// jQuery ������ Ajax������ �ٽ� ��!
// Ajax�� url�� �ȹٲ��.
 $(function(){
	 //id�� idBtn�� �±׸� Ŭ������ �� ����
	 $('#idBtn').click(function(){
		// alert("Test");
		// �ڹٽ�ũ��Ʈ ���� idv�� �Է°��� ���� 
		var idv = $('#pid').val();
		// �Է°��� �ִ��� ������ �˻� => .trim() �¿� �������� 
		if(idv.trim() === ""){ // ���� ��� �ִٸ� 
			console.log("Test null!"+idv);
		}else{
			// ���� �ִٸ�
			console.log("Test!"+idv);
			//Ajaxó�� => $.ajax({});
			$.ajax({
				// idchk.jsp?id=xman
				// pro.kosmo?cmd=member&scmd=idchk&id=kosmo2
				url:'pro.kosmo?cmd=member&scmd=idchk&id='+idv.trim(),
				success:function(data){ //callback
					//alert(data);
				    // �ݹ��� �⺻ Ÿ���� String ���ڿ� 
					if(data.trim() === "1"){
						alert("�ߺ�"+data);
					}else{ //0
						alert("����"+data);
					}
				}
			});
		}

	 });
	//list ��ư Ŭ�� �̺�Ʈ
	$('#listBtn').click(function() {
		//�����̵�
		//location = "index.jsp";
		location = "pro.kosmo?cmd=myboard&scmd=blist";
	});
 });
 
</script>



<%@ include file="../footer.jsp" %>