<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>
<!-- Content영역 -->
<div  class="container mt-5">
  <div class="row">
<div id="sub1">
<fieldset>
<legend>이미지 업로드 폼</legend>
<form method="post" action="insert.jsp" enctype="multipart/form-data" id="upform">
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">제 목</label>
   <div class="col-sm-10"><input type="text" name="sub" id="sub" placeholder="제목을 입력하세요."/></div>
   
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">작성자</label>
   <div class="col-sm-10"><input type="text" name="writer" id="writer"/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10"><input type="password" name="pwd" id="pwd"/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">이미지 내용</label>
    <textarea name="cont" id="cont" rows="10" cols="13"></textarea>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">*이미지업로드</label>
    <div class="col-sm-10"><input type="file" name="upfile" id="upfile"/></div>
    <div class="col-sm-10"><img src="../resources/image/noimage.jpg" id="imgx" ></div>
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
// javascript 는 클라이언트 측 언어 
// HTML,CSS를 동적으로 제어하는 목적으로 주로 사용 
// html5 부터 제공해주는 FileReader() 함수를 사용해서 이미지 미리보기를 구현 
// 함수는 메서드와 비슷
/*
 메서드:	public void readURL(String input) {} 
 변수 : String reader => var reader  
 */
function readURL(input){
	 // input type="file" 의 주소를 가져온다.
	 if (input.files && input.files[0]) {
		// 자바스크립트 I/O 
		var reader = new FileReader();
		// 감지자
		reader.onload = function(e) {
			// 이미지를 읽어낸 후 적용시킬 구문!
			//console.log("Path :"+e.target.result);
			//이미지를 id로 선택해보자.
			// $('#imgx') => <img src="이미지 경로" id="imgx">
			// src란 속성을 접근하기 위해서 attr()란 함수로 불러올 속성을 지정함
			// console.log($('#imgx').attr('src')); => getter
			$('#imgx').attr('src', e.target.result);  // setter 넣겠다.
			
		}
		// input type="file"의 값을 바이너리 데이터로 읽어 온다.
		reader.readAsDataURL(input.files[0]);
	 }
}
 // jQuery 문법 
 $(function(){
	 //jQuery 선택자
	// 대상선택자에서 변화를 감지하는 이벤트 : change()
	 $('#upfile').change(function(){
		 //경고창 - 
		 //alert("경고창");
		 //alert($(this).val());
		 // 브라우저 콘솔창에 출력 
		 console.log($(this).val());
		 console.log($(this).val().length);
		 if($(this).val().length > 0){
			 console.log("이미지 있다.");
			 //함수 호출
			 readURL(this);
		 }else{
			 console.log("이미지 없다.");
		 }
	 });
 
 	// 리스트 버튼 클릭 
	//listBtn 버튼 클릭 이벤트
		$('#listBtn').click(function(){
			//이동
			location="ex1_upboardList.jsp";
		});	
 
 
 });
</script>
<%@ include file="../footer.jsp" %>