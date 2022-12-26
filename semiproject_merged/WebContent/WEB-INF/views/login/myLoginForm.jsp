<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp"%>
<c:choose>
	<c:when test="${sessionScope.id != null}">
		<script>
			alert("로그인 했습니다.");
			if (confirm("메인으로 이동하겟습니까>?")) {
				location = "pro.kosmo?cmd=index";
			}
		</script>
	</c:when>
</c:choose>


<!-- Content영역  myLoginForm.jsp-->
<div class="container mt-5">
	<div class="row">
		<div id="sub1">

			<fieldset>
				<br> <br> <br> <br> <br>
				<h2 align="center">로그인</h2>
				<hr>

				<form method="post" action="pro.kosmo" id="loginform">
					<input type="hidden" name="cmd" value="login"> <input
						type="hidden" name="scmd" value="login">


					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">아이디</span> <input
							type="text" class="form-control" placeholder="아이디"
							aria-label="pid" aria-describedby="basic-addon1" name="pid"
							id="pid">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">비밀번호</span> <input
							type="password" class="form-control" placeholder="비밀번호"
							aria-label="pwd" aria-describedby="basic-addon1" name="ppwd"
							id="ppwd">
					</div>

					<%-- 
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" name="pid" id="pid" placeholder="id를 입력하세요." />
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" name="ppwd" id="ppwd"
								placeholder="pwd를 입력하세요." />
						</div>
					</div>
					
					--%>
			
						<div class="container mt-3" align="center">
							<input type="submit" value="로그인" id="btn1" class="btn btn-primary" />
							<input type="button" value="회원가입" id="listBtn"
								class="btn btn-secondary" /> <input type="button"
								value="의료진 전용 로그인" id="docBtn" class="btn btn-success" />
						</div>
						<pre></pre>

				</form>
			</fieldset>
		</div>
	</div>
</div>
<script></script>



<%@ include file="../footer.jsp"%>