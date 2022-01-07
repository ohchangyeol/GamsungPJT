<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>공지사항 등록</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<jsp:include page="/resources/commonCssAdmin.jsp"/>

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="../../../resources/lib/bootstrap-tagsinput/bootstrap-tagsinput.css" />
		<link rel="stylesheet" href="../../../resources/lib/summernote/summernote.css" />
		<link rel="stylesheet" href="../../../resources/lib/summernote/summernote-bs3.css" />
		<style>
			.inner-body{border-top-width: 60px !important;margin-left: 0!important;padding-top: 80px;}
            .inner-body .form-group.form-group-invisible h2 {padding-left: 50px;}
            .inner-body .inner-toolbar{position: absolute !important;left: 0 !important;top: 0 !important;}
            .inner-body .inner-toolbar ul li.notice-btn{cursor: pointer; }
            .inner-body .inner-toolbar ul li.notice-btn:hover{color: #fff; }
            .inner-body .file-box{ border: 1px solid #e7e7e7;border-radius: 10px; background-color: #f5f5f5;min-height: 40px;}
            #n-files{opacity: 0;z-index: -11; display: none;}
            #fileDragDesc{margin-top: 8px;}
            #dropZone button{background-color: transparent ;border: none;}
			.inner-wrapper .content-body .add-notice{margin: -100px -40px -53px -40px;}
		</style>

	</head>
	<body class="admin-page">
		<section class="body">

			<!-- start: header -->
			<jsp:include page="../../../view/common/adminHeader.jsp"/>
			
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<jsp:include page="../../../view/common/adminSidebar.jsp"/>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<section class="content-with-menu content-with-menu-has-toolbar mailbox add-notice">
						<div class="content-with-menu-container" data-mailbox data-mailbox-view="compose">
							
							
							
							<div class="inner-body">

								<div class="inner-toolbar clearfix">
									<ul>
										<li class="notice-btn" data-no="1">
											<i class="fa fa-send-o mr-sm"></i>등록
										</li>
										<li class="notice-btn" data-no="2">
											<i class="fa fa-times mr-sm"></i> 초기화
										</li>
									</ul>
								</div>

								<div class="mailbox-compose">
									<form id="notice-form" name="notice-form" class="form-horizontal form-bordered form-bordered notice-form">
							
										<div class="form-group form-group-invisible">
											<h2>공지사항 등록</h2>
										</div>
							
										<div class="form-group form-group-invisible">
											<label for="notice_title" class="control-label-invisible">제목</label>
											<div class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10">
												<input  name="notice_title" id="n-title" type="text" class="form-control form-control-invisible"  value="">
											</div>
										</div>
							
										<div class="form-group form-group-invisible">
											<label for="n-files" class="control-label-invisible">첨부파일</label>
											<div id="dropZone" class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-6 file-box">
                                                <div id="fileDragDesc"> 파일을 드래그 해주세요. </div>
                                                <table id="fileListTable" width="100%" border="0px">
                                                    <tbody id="fileTableTbody">
                                    
                                                    </tbody>
                                                </table>
												<input name="n-files" id="n-files" type="file" class="form-control form-control-invisible" multiple>
											</div>
										</div>
							
										<div class="form-group">
											<div class="compose">
												<div id="compose-field" class="compose-control">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</section>
					<!-- end: page -->
				</section>
			</div>

		</section>

		<jsp:include page="/resources/commonScriptAdmin.jsp"/>
		
		<script src="/resources/lib/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
		<script src="/resources/lib/summernote/summernote.js"></script>

		<script>

            $(document).ready(function() {
				$("#n-files").bind('change', function() {
					selectFile(this.files);
					//this.files[0].size gets the size of your file.
					//alert(this.files[0].size);
				});

                $(".notice-btn").on("click" , (e)=>{
                    const no = $(".notice-btn").data("no");
                    const content = $(".note-editable").html();
                    const file = $("#n-files").val();
                    console.log(file);
                    console.log(content);
                    
                    switch (no) {
                        case 1:
                            
                            break;
                        case 2:

                            break;
                        default:
                            alert("뭘누른거임?")
                            break;
                    }
                    
                })
			});
		
			// 파일 리스트 번호
			var fileIndex = 0;
			// 등록할 전체 파일 사이즈
			var totalFileSize = 0;
			// 파일 리스트
			var fileList = new Array();
			// 파일 사이즈 리스트
			var fileSizeList = new Array();
			// 등록 가능한 파일 사이즈 MB
			var uploadSize = 50;
			// 등록 가능한 총 파일 사이즈 MB
			var maxUploadSize = 500;
	
			$(function() {
				// 파일 드롭 다운
				fileDropDown();
			});
	
			// 파일 드롭 다운
			function fileDropDown() {
				var dropZone = $("#dropZone");
				//Drag기능 
				dropZone.on('dragenter', function(e) {
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#E3F2FC');
				});
				dropZone.on('dragleave', function(e) {
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#FFFFFF');
				});
				dropZone.on('dragover', function(e) {
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#E3F2FC');
				});
				dropZone.on('drop', function(e) {
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#FFFFFF');
	
					var files = e.originalEvent.dataTransfer.files;
					if (files != null) {
						if (files.length < 1) {
							/* alert("폴더 업로드 불가"); */
							console.log("폴더 업로드 불가");
							return;
						} else {
							selectFile(files)
						}
					} else {
						alert("ERROR");
					}
				});
			}
	
			// 파일 선택시
			function selectFile(fileObject) {
				var files = null;
	
				if (fileObject != null) {
					// 파일 Drag 이용하여 등록시
					files = fileObject;
				} else {
					// 직접 파일 등록시
					files = $('#multipaartFileList_' + fileIndex)[0].files;
				}
	
				// 다중파일 등록
				if (files != null) {
					
					if (files != null && files.length > 0) {
						$("#fileDragDesc").hide(); 
						$("fileListTable").show();
					} else {
						$("#fileDragDesc").show(); 
						$("fileListTable").hide();
					}
					
					for (var i = 0; i < files.length; i++) {
						// 파일 이름
						var fileName = files[i].name;
						var fileNameArr = fileName.split("\.");
						// 확장자
						var ext = fileNameArr[fileNameArr.length - 1];
						
						var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
						console.log("fileSize="+fileSize);
						if (fileSize <= 0) {
							console.log("0kb file return");
							return;
						}
						
						var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
						var fileSizeMb = fileSizeKb / 1024;	// 파일 사이즈(단위 :Mb)
						
						var fileSizeStr = "";
						if ((1024*1024) <= fileSize) {	// 파일 용량이 1메가 이상인 경우 
							console.log("fileSizeMb="+fileSizeMb.toFixed(2));
							fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
						} else if ((1024) <= fileSize) {
							console.log("fileSizeKb="+parseInt(fileSizeKb));
							fileSizeStr = parseInt(fileSizeKb) + " kb";
						} else {
							console.log("fileSize="+parseInt(fileSize));
							fileSizeStr = parseInt(fileSize) + " byte";
						}
	
						/* if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
							// 확장자 체크
							alert("등록 불가 확장자");
							break; */
						if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'png', 'pdf', 'jpg', 'jpeg', 'gif', 'zip' ]) <= 0) {
							// 확장자 체크
							/* alert("등록이 불가능한 파일 입니다.");
							break; */
							alert("등록이 불가능한 파일 입니다.("+fileName+")");
						} else if (fileSizeMb > uploadSize) {
							// 파일 사이즈 체크
							alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
							break;
						} else {
							// 전체 파일 사이즈
							totalFileSize += fileSizeMb;
	
							// 파일 배열에 넣기
							fileList[fileIndex] = files[i];
	
							// 파일 사이즈 배열에 넣기
							fileSizeList[fileIndex] = fileSizeMb;
	
							// 업로드 파일 목록 생성
							addFileList(fileIndex, fileName, fileSizeStr);
	
							// 파일 번호 증가
							fileIndex++;
						}
					}
				} else {
					alert("ERROR");
				}
			}
	
			// 업로드 파일 목록 생성
			function addFileList(fIndex, fileName, fileSizeStr) {
				/* if (fileSize.match("^0")) {
					alert("start 0");
				} */
	
				var html = "";
				html += "<tr id='fileTr_" + fIndex + "'>";
				html += "    <td id='dropZone' class='left' >";
				html += "<button clsss='file-delete-btn' type='button'onclick='deleteFile(" + fIndex + "); return false;'><i class='fa fa-times mr-sm'></i></button>";
                html +=  fileName + " (" + fileSizeStr +") " ;
						//+ "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'> 삭제</a>"
						
						
				html += "    </td>";
				html += "</tr>";
	
				$('#fileTableTbody').append(html);
			}
	
			// 업로드 파일 삭제
			function deleteFile(fIndex) {
				console.log("deleteFile.fIndex=" + fIndex);
				// 전체 파일 사이즈 수정
				totalFileSize -= fileSizeList[fIndex];
	
				// 파일 배열에서 삭제
				delete fileList[fIndex];
	
				// 파일 사이즈 배열 삭제
				delete fileSizeList[fIndex];
	
				// 업로드 파일 테이블 목록에서 삭제
				$("#fileTr_" + fIndex).remove();
				
				console.log("totalFileSize="+totalFileSize);
				
				if (totalFileSize > 0) {
					$("#fileDragDesc").hide(); 
					$("fileListTable").show();
				} else {
					$("#fileDragDesc").show(); 
					$("fileListTable").hide();
				}
			}
        </script>

	</body>
</html>