<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content���� -->
<div  class="container mt-5">
<div class="row">
<div id="sub1">
<fieldset>
<legend>ȸ������ ���� ��</legend>
<a href="idchk.jsp?id=xman">�����</a>
<form method="post" action="pro.kosmo"  id="upform">
<input type="hidden" name="cmd" value="member">
<input type="hidden" name="scmd" value="minsert">

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">���̵�</label>
   <div class="col-sm-10">
   <input type="text" name="pid" id="pid" placeholder="id�� �Է��ϼ���."/>
   <input type="button" value="�ߺ�Ȯ��" id="idBtn" class="btn btn-danger" />
   </div>
</div> 

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">��й�ȣ</label>
   <div class="col-sm-10">
   <input type="password" name="ppwd" id="ppwd" placeholder="pwd�� �Է��ϼ���."/></div>
</div> 

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�̸�</label>
   <div class="col-sm-10"><input type="text" name="pname" id="pname"/></div>
</div>


<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�ּ�</label>
   <div class="col-sm-10"><input type="text" name="paddr" id="paddr"/></div>
</div>

<div class="row mb-3">
    <label class="col-sm-2 col-form-label">��ȣ</label>
    <div class="col-sm-10"><input type="number" name="ptel" id="ptel"/></div>
</div>

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�ֹ�</label>
   <div class="col-sm-10"><input type="text" name="ppernum" id="ppernum"/></div>
</div>
                   
<div class="row mb-3 ">
 <div class="col-sm-10">
 <input type="submit" value="���" id="btn1" class="btn btn-info"/>
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
	 
 });
 
</script>



<%@ include file="../footer.jsp" %>