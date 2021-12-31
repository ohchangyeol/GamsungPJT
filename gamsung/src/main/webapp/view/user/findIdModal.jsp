<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!--  ///////////////////////// jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('span:contains("로그인")').on('click',	function() {
		$('#loginModal').on('show.bs.modal');
		$('button:contains("LOGIN")').click(function() {
			var id = $('#modalId').val();
			var pwd = $('#modalPwd').val();
			if (id.length == 0) {
			alert("아이디를 입력해 주세요.");
			return;
			}
			if (pwd.length == 0) {
			alert("패스워드를 입력해 주세요.");
			return;
			}
		$('#loginForm').attr('method', 'post').attr('action', '/user/login').submit();
	});
		$("#logout").on("click", function() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.Auth.logout();
			}
		});
	});
	$('span:contains("회원가입")').on('click', function() {
		$('addModal').on('show.bs.modal');
	});
});
</script>
<section class="bg-dark-30 showcase-page-header module parallax-bg" data-background="../../resources/images/showcase_bg.jpg">
  <div class="titan-caption">
    <div class="row">
      <div class="col-md-4 col-lg-offset-4" style="text-align: center;">
        <div class="row">
          <div class="row">
            <div style="text-align: end; padding-right: 15px;">
                <div id="modalForm" class="modal-block modal-block-primary mfp-hide">
                <section class="panel">
                  <header class="panel-heading">
                    <h2 class="panel-title">Registration Form</h2>
                  </header>
                  <div class="panel-body">
                    <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
                      <div class="form-group mt-lg">
                        <label class="col-sm-3 control-label">Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="name" class="form-control" placeholder="Type your name..." required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9">
                          <input type="email" name="email" class="form-control" placeholder="Type your email..." required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">URL</label>
                        <div class="col-sm-9">
                          <input type="url" name="url" class="form-control" placeholder="Type an URL..." />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Comment</label>
                        <div class="col-sm-9">
                          <textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
                        </div>
                      </div>
                    </form>
                  </div>
                  <footer class="panel-footer">
                    <div class="row">
                      <div class="col-md-12 text-right">
                        <button class="btn btn-primary modal-confirm">Submit</button>
                        <button class="btn btn-default modal-dismiss">Cancel</button>
                      </div>
                    </div>
                  </footer>
                </section>
              </div>
            </div>
          </div>
         </div>
      </div>
    </div>
  </div>
        </section>