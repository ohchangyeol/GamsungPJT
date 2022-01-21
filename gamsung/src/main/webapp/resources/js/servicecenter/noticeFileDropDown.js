
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
        
        var oldFiles = Array.from( $("#n-files")[0].files);
        var dataTranster = new DataTransfer();

        console.log("오래된 파일 oldFiless = >",oldFiles , typeof oldFiles)
        console.log(oldFiles.length);

        if(oldFiles.length){
            // console.log("참")
            oldFiles.forEach(fileItem => {
                dataTranster.items.add(fileItem);
            });
        }

        if (files != null && files.length > 0) {
            $("#fileDragDesc").hide(); 
            $("fileListTable").show();
        } else {
            $("#fileDragDesc").show(); 
            $("fileListTable").hide();
        }
        for (var i = 0; i < files.length; i++) {
            
            var file = files[i];
            console.log("file => " , file)
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

             if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
                // 확장자 체크
                alert("등록이 불가능한 파일 입니다");
                break; 
            /*if ($.inArray(ext, [  'ppt', 'pptx', 'txt', 'zip' ]) <= 0) {
                // 확장자 체크
                /* alert("등록이 불가능한 파일 입니다.");
                break; 
                alert("등록이 불가능한 파일 입니다.("+fileName+")");*/
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
                dataTranster.items.add(file);
                
                // 파일 번호 증가
                fileIndex++;


            }
        }
        $("#n-files")[0].files = dataTranster.files;
        // oldFiles.files = files;

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

    var oldFiles = Array.from( $("#n-files")[0].files);
    var dataTranster = new DataTransfer();

    // console.log("오래된 파일 oldFiless = >",oldFiles , typeof oldFiles)
    console.log(oldFiles.length);
    
    oldFiles.forEach(fileItem => {
        dataTranster.items.add(fileItem);
    });
    dataTranster.items.remove(fIndex);

    $("#n-files")[0].files = dataTranster.files;				
    
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