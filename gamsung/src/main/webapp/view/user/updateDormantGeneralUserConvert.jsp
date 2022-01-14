<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script src="../../resources/lib/jquery/jquery.js"></script>

		<script type="text/javascript">

			window.onload = (function () {

				var id = '<%=(String)session.getAttribute("id")%>';
				//alert(id);


				Swal.fire({
					title: '일반계정으로 전환하시겠습니까?',
					text: "고객님의 ID는 1년이상 로그인하지 않아 휴면계정으로 전환되었습니다. 일반계정으로 변경시 다시 사용하실 수 있습니다.",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						$.ajax({
							url: '/user/rest/updateDormantGeneralUserConvert',
							headers: {
								"Accept": "application/json",
								"Content-Type": "application/json"
							},
							method: 'POST',
							dataType: 'json',
							data: ({
								"id": id
							}),
							success: function (result) {
								console.log('성공: ' + result);

								if (result == 1) {
									Swal.fire(
										'전환성공!',
										'로그인 후 사용가능합니다.',
										'success'
									).then((result) => {
										document.location.href = "../../main.jsp";
									})
								} else {
									Swal.fire('전환에 실패하였습니다.')
								}
							}



						});

					} else {
						document.location.href = "../../main.jsp";
					}
				})
			});  
		</script>