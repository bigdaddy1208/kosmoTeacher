<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content���� -->
<div  class="container mt-5">
  <div class="row">
<div id="sub1">
<fieldset>
<legend>�̹��� ���ε� ��</legend>
<form method="post" action="insert.jsp" enctype="multipart/form-data" id="upform">
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�� ��</label>
   <div class="col-sm-10"><input type="text" name="sub" id="sub" placeholder="������ �Է��ϼ���."/></div>
   
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�ۼ���</label>
   <div class="col-sm-10"><input type="text" name="writer" id="writer"/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">��й�ȣ</label>
    <div class="col-sm-10"><input type="password" name="pwd" id="pwd"/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">�̹��� ����</label>
    <textarea name="cont" id="cont" rows="10" cols="13"></textarea>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">*�̹������ε�</label>
    <div class="col-sm-10"><input type="file" name="upfile" id="upfile"/></div>
    <div class="col-sm-10"><img src="../resources/image/noimage.jpg" id="imgx" ></div>
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
// javascript �� Ŭ���̾�Ʈ �� ��� 
// HTML,CSS�� �������� �����ϴ� �������� �ַ� ��� 
// html5 ���� �������ִ� FileReader() �Լ��� ����ؼ� �̹��� �̸����⸦ ���� 
// �Լ��� �޼���� ���
/*
 �޼���:	public void readURL(String input) {} 
 ���� : String reader => var reader  
 */
function readURL(input){
	 // input type="file" �� �ּҸ� �����´�.
	 if (input.files && input.files[0]) {
		// �ڹٽ�ũ��Ʈ I/O 
		var reader = new FileReader();
		// ������
		reader.onload = function(e) {
			// �̹����� �о �� �����ų ����!
			//console.log("Path :"+e.target.result);
			//�̹����� id�� �����غ���.
			// $('#imgx') => <img src="�̹��� ���" id="imgx">
			// src�� �Ӽ��� �����ϱ� ���ؼ� attr()�� �Լ��� �ҷ��� �Ӽ��� ������
			// console.log($('#imgx').attr('src')); => getter
			$('#imgx').attr('src', e.target.result);  // setter �ְڴ�.
			
		}
		// input type="file"�� ���� ���̳ʸ� �����ͷ� �о� �´�.
		reader.readAsDataURL(input.files[0]);
	 }
}
 // jQuery ���� 
 $(function(){
	 //jQuery ������
	// ������ڿ��� ��ȭ�� �����ϴ� �̺�Ʈ : change()
	 $('#upfile').change(function(){
		 //���â - 
		 //alert("���â");
		 //alert($(this).val());
		 // ������ �ܼ�â�� ��� 
		 console.log($(this).val());
		 console.log($(this).val().length);
		 if($(this).val().length > 0){
			 console.log("�̹��� �ִ�.");
			 //�Լ� ȣ��
			 readURL(this);
		 }else{
			 console.log("�̹��� ����.");
		 }
	 });
 
 	// ����Ʈ ��ư Ŭ�� 
	//listBtn ��ư Ŭ�� �̺�Ʈ
		$('#listBtn').click(function(){
			//�̵�
			location="ex1_upboardList.jsp";
		});	
 
 
 });
</script>
<%@ include file="../footer.jsp" %>