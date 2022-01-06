<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../resources/lib/bootstrap/css/bootstrap.css">
    <title>Document</title>
    <style>
        /* div{border: 1px solid #2e2e2e;} */
        .report-main{padding: 40px;}
        .report-header h3{ font-weight: bold;}
        .report-body textarea{resize: none;}
        .report-body div {display: flex; flex-direction: column;margin-top: 15px}
        /* .report-body div+div{ ;} */
        .report-body div p {margin: 0;}
        .report-body div .img-content {flex-direction: initial !important; gap: 5%;}
        .report-body div .img-content img{width: 30%; box-sizing: border-box;}
        .report-footer{ margin-top: 15px;}
        .report-footer button{width: 100%; height: 40px;font-weight: bold;}
    </style>
</head>
<body>
    <div class="report-main white-popup-block">
        <main>
            <div class="report-header">
                <!-- <h3>신고 하기</h3> -->
                <h3>신고상세 보기</h3>
            </div>
            <div class="report-body">
                <div>
                    <label for="report-type">유형 선택</label>
                    <select name="report-type" id="report-type" class="form-control">
                        <option value="1" selected>캠핑장 신고</option>
                        <option value="2">경매 신고</option>
                        <option value="3">커뮤니티 신고</option>
                        <option value="4">예약양도 신고</option>
                        <option value="5">고객 신고</option>
                    </select>
                </div>
                <div>
                    <label id="receiver-name" for="report-receiver"></label>
                    <input type="text" class="form-control">
                </div>
                <div>
                    <label for="report-content">신고 내용 *</label>
                    <textarea name="report-content" id="" cols="30" rows="10"class="form-control">
                    </textarea>
                </div>
                <div >
                    <p>사진첨부</p>
                    <div class="img-content">
                        <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA0Njg3NSIgeT0iNzAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNDB4MTQwPC90ZXh0PjwvZz48L3N2Zz4=" alt=""class="img-rounded">
                        <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA0Njg3NSIgeT0iNzAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNDB4MTQwPC90ZXh0PjwvZz48L3N2Zz4=" alt=""class="img-rounded">
                        <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA0Njg3NSIgeT0iNzAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNDB4MTQwPC90ZXh0PjwvZz48L3N2Zz4=" alt=""class="img-rounded">
                    </div>
                </div>
            </div>
            <div class="report-footer">
                <!-- <button type="button" class="btn btn-danger">신고하기</button> -->
                <button type="button" class="btn btn-danger">취소하기</button>
            </div>
        </main>
    </div>


    <script src="../../../resources/lib/jquery/jquery.min.js"></script>
    <script src="/resources//lib/bootstrap/js/bootstrap.js"></script>

    <script>
        $(document).ready(function(){
            $("#report-type").on("change", ()=>{
                const $value = $("option:selected", this).attr("value");
                const $receiver = $("#receiver-name");
                // console.log();

                console.log($value, typeof $value);
                if($value == "1"){
                    $receiver.text("캠핑장명 *")
                }else{
                    $receiver.text("상대방 닉네임 *")
                }
            }).trigger("change");
        })
    </script>
</body>
</html>