<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="findIdModal" style="display:none;">
<div  class="modal-block white-popup-block mfp find" >
	<section class="panel">
		<div role="tabpanel">
			<ul class="nav nav-tabs font-alt" role="tablist">
				<li class="active"><a href="#findId-modal" data-toggle="tab" aria-expanded="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">아이디 찾기</font></font></a></li>
				<li class=""><a href="#findPwd-modal" data-toggle="tab" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비밀번호 찾기</font></font></a></li>
			  </ul>

			  <div class="tab-content">
				<div class="tab-pane active" id="findId-modal">	<div class="panel-body" >
					<form action="" class="was-validated" id="ModalFindId">
						<div class="form-group">
							<label for="findIdName" class="col-sm-offset-1 col-sm-3 control-label"></label>
							<div class="col-sm-6">
							<input type="text" class="form-control" id="findIdName" placeholder="이름을 입력하세요." name="name" required>
					</div>
					</div>
						<div class="form-group">
							<label for="findIdPhone" class="col-sm-offset-1 col-sm-3 control-label"></label>
									<div class="col-sm-6">
									<input id="findIdPhone" name="phone" class="form-control " type="text" placeholder="숫자만 입력해주세요" maxlength="11"/>
									</div>
									<button id="findIdPhoneAuthNum" class="btn btn-circle btn-xs" type="button">인증번호 받기</button>
									<div id="findIdCheckPhoneAuth" class="col-sm-offset-3 col-sm-6" style="display:none;">
									<input id="findIdCheckPhoneAuthNum" name ="checkPhoneAuthNum" class="form-control " type="text" placeholder="인증번호를 입력하세요." maxlength="4"/>
									</div>
									<div id="findId-check-phone" class='col-sm-offset-3 col-sm-6'></div>
									<div id="findId-check-phone-auth" class='col-sm-offset-3 col-sm-6'></div>
												</div>
						<div align="right"><button type="button" class="btn btn-default btn-sm" id="findId">아이디찾기</button></div>
					</form>
						</div>
					</div>
					
				<div class="tab-pane" id="findPwd-modal">	
					<div class="panel-body" >
						<form action="" class="was-validated" id="ModalFindId">
						<div class="form-group">
								<input type="text" class="form-control" id="findPwdId" placeholder="아이디를 입력하세요." name="id" required>
						</div>
						<div class="form-group">
								<input type="text" class="form-control" id="findPwdName" placeholder="이름을 입력하세요." name="name" required>
						</div><div class="form-group">
								<input type="text" class="form-control" id="findPwdPhone" placeholder="연락처를 입력하세요." name="phone" required>
						</div>
						<div align="right"><button type="button" class="btn btn-default btn-sm" id="findId">비밀번호 찾기</button></div>
					</form>
					</div>
				</div>
					
			  </div>
		
	</section>
</div>

</div>
</div>
