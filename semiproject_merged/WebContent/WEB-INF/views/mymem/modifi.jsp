<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content영역 -->
<div  class="container mt-5">
<div class="row">
<div id="sub1">
<fieldset>
<legend>회원가입 데모 폼</legend>
<a href="idchk.jsp?id=xman">동기식</a>
<form method="post" action="pro.kosmo"  id="upform">
<input type="hidden" name="cmd" value="member">
<input type="hidden" name="scmd" value="minsert">

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">아이디</label>
   <div class="col-sm-10">
   <input type="text" name="pid" id="pid" placeholder="id를 입력하세요."/>
   <input type="button" value="중복확인" id="idBtn" class="btn btn-danger" />
   </div>
</div> 

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">비밀번호</label>
   <div class="col-sm-10">
   <input type="password" name="ppwd" id="ppwd" placeholder="pwd를 입력하세요."/></div>
</div> 

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">이름</label>
   <div class="col-sm-10"><input type="text" name="pname" id="pname"/></div>
</div>


<div class="row mb-3">
   <label class="col-sm-2 col-form-label">주소</label>
   <div class="col-sm-10"><input type="text" name="paddr" id="paddr"/></div>
</div>

<div class="row mb-3">
    <label class="col-sm-2 col-form-label">번호</label>
    <div class="col-sm-10"><input type="number" name="ptel" id="ptel"/></div>
</div>

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">주민</label>
   <div class="col-sm-10"><input type="text" name="ppernum" id="ppernum"/></div>
</div>
                   
<div class="row mb-3 ">
 <div class="col-sm-10">
 <input type="submit" value="등록" id="btn1" class="btn btn-info"/>
 <input type="button" value="리스트" id="listBtn" class="btn btn-danger" />
 </div>
</div>
</form>
</fieldset>
  </div>
  </div>
</div>
<script>
// jQuery 수업시 Ajax수업때 다시 함!
// Ajax는 url이 안바뀐다.
 $(function(){
	 //id가 idBtn인 태그를 클릭했을 때 동작
	 $('#idBtn').click(function(){
		// alert("Test");
		// 자바스크립트 변수 idv에 입력값을 저장 
		var idv = $('#pid').val();
		// 입력값이 있는지 없는지 검사 => .trim() 좌우 공백제거 
		if(idv.trim() === ""){ // 값이 비어 있다면 
			console.log("Test null!"+idv);
		}else{
			// 값이 있다면
			console.log("Test!"+idv);
			//Ajax처리 => $.ajax({});
			$.ajax({
				// idchk.jsp?id=xman
				// pro.kosmo?cmd=member&scmd=idchk&id=kosmo2
				url:'pro.kosmo?cmd=member&scmd=idchk&id='+idv.trim(),
				success:function(data){ //callback
					//alert(data);
				    // 콜백의 기본 타입은 String 문자열 
					if(data.trim() === "1"){
						alert("중복"+data);
					}else{ //0
						alert("가능"+data);
					}
				}
			});
		}
		
	 });
	 
 });
 
</script>



<%@ include file="../footer.jsp" %>