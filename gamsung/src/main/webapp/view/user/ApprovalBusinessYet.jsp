<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script src="../../resources/lib/jquery/jquery.js"></script>

		<script type="text/javascript">

			window.onload = (function () {

				var id = '<%=(String)session.getAttribute("id")%>';
				//alert(id);


				Swal.fire({
					title: '아직 가입승인이 되지 않았습니다.',
					text: "회원가입 심사중입니다. 가입 승인시 가입하신 아이디로 승인 메일이 발송됩니다.",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					document.location.href = "../../main.jsp";
				})
			});  
		</script>