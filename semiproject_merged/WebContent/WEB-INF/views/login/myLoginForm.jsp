<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp"%>
<c:choose>
	<c:when test="${sessionScope.id != null}">
		<script>
			alert("�α��� �߽��ϴ�.");
			if (confirm("�������� �̵��ϰٽ��ϱ�>?")) {
				location = "pro.kosmo?cmd=index";
			}
		</script>
	</c:when>
</c:choose>


<!-- Content����  myLoginForm.jsp-->
<div class="container mt-5">
	<div class="row">
		<div id="sub1">

			<fieldset>
				<br> <br> <br> <br> <br>
				<h2 align="center">�α���</h2>
				<hr>

				<form method="post" action="pro.kosmo" id="loginform">
					<input type="hidden" name="cmd" value="login"> <input
						type="hidden" name="scmd" value="login">


					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">���̵�</span> <input
							type="text" class="form-control" placeholder="���̵�"
							aria-label="pid" aria-describedby="basic-addon1" name="pid"
							id="pid">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">��й�ȣ</span> <input
							type="password" class="form-control" placeholder="��й�ȣ"
							aria-label="pwd" aria-describedby="basic-addon1" name="ppwd"
							id="ppwd">
					</div>

					<%-- 
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">���̵�</label>
						<div class="col-sm-10">
							<input type="text" name="pid" id="pid" placeholder="id�� �Է��ϼ���." />
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">��й�ȣ</label>
						<div class="col-sm-10">
							<input type="password" name="ppwd" id="ppwd"
								placeholder="pwd�� �Է��ϼ���." />
						</div>
					</div>
					
					--%>
			
						<div class="container mt-3" align="center">
							<input type="submit" value="�α���" id="btn1" class="btn btn-primary" />
							<input type="button" value="ȸ������" id="listBtn"
								class="btn btn-secondary" /> <input type="button"
								value="�Ƿ��� ���� �α���" id="docBtn" class="btn btn-success" />
						</div>
						<pre></pre>

				</form>
			</fieldset>
		</div>
	</div>
</div>
<script></script>



<%@ include file="../footer.jsp"%>