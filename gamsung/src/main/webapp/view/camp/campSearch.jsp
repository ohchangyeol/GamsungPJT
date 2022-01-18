<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<section class="bg-dark-30 showcase-page-header module parallax-bg" data-background="../../resources/images/KakaoTalk_Moim_buAhAGzAhL3VZBLn5H9XCNfXpebbgi.jpg" style="background-attachment: inherit;">
  <div id="modalForm" class="modal-block modal-block-primary mfp mfp-hide" style="font-size: 12px;">
            
    <section class="panel">
      <header class="panel-heading"  style="background-color: #f5f5f5; border-radius: 30px 30px 0 0;">
        <h4 class="panel-title" style="font-size: 20px; padding: 15px; border-bottom: 1px solid rgb(219, 218, 213)">캠핑장을 상세하게 검색 하세요!</h4>
      </header>
      <div class="panel-body">
        <form id="detailSearch" class="form-horizontal mb-lg" novalidate="novalidate">
          <div class="form-group mt-lg">
            <label class="col-sm-2 control-label">지역별</label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr1" name="campAddr" value="서울">서울
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr2" name="campAddr" value="부산">부산
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr3" name="campAddr" value="대구">대구
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr4" name="campAddr" value="인천">인천
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr5" name="campAddr" value="광주">광주
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr6" name="campAddr" value="대전">대전
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr7" name="campAddr" value="울산">울산
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr8" name="campAddr" value="세종">세종
                </label>
              </div>
            </div>
            <div class="form-group mt-lg">
              <label class="col-sm-2 control-label"></label>
              <div class="col-sm-10">
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr9" name="campAddr" value="경기">경기
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr10" name="campAddr" value="강원">강원
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr11" name="campAddr" value="충북">충북
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr12" name="campAddr" value="충남">충남
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr13" name="campAddr" value="전북">전북
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr14" name="campAddr" value="전남">전남
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr15" name="campAddr" value="경북">경북
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr16" name="campAddr" value="경남">경남
                </label>
              </div>
            </div>
            <div class="form-group mt-lg">
              <label class="col-sm-2 control-label"></label>
              <div class="col-sm-10">
                <label class="checkbox-inline">
                  <input type="checkbox" id="addr17" name="campAddr" value="제주">제주
                </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">주요시설</label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="main_site1" name="mainSite" value="오토캠핑">오토캠핑
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="main_site2" name="mainSite" value="글램핑">글램핑
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="main_site3" name="mainSite" value="카라반">카라반
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="main_site4" name="mainSite" value="방갈로">방갈로
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="main_site5" name="mainSite" value="펜션">펜션
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="main_site6" name="mainSite" value="자동차 야영장">자동차 야영장
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">부가시설</label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site1" name="subSite" value="전기">전기
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site2" name="subSite" value="온수">온수
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site3" name="subSite" value="화장실">화장실
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site4" name="subSite" value="무선인터넷">무선인터넷
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site5" name="subSite" value="매점">매점
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site6" name="subSite" value="물놀이장">물놀이장
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site7" name="subSite" value="트램폴린">트램폴린
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="sub_site8" name="subSite" value="산책로">산책로
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">주변환경</label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance1" name="circumstance" value="계곡">계곡
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance2" name="circumstance" value="호수">호수
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance3" name="circumstance" value="강">강
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance4" name="circumstance" value="바다">바다
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance5" name="circumstance" value="산">산
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance6" name="circumstance" value="숲">숲
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance7" name="circumstance" value="도시">도시
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="circumstance8" name="circumstance" value="섬">섬
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">테마</label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="theme1" name="theme" value="봄">봄
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme2" name="theme" value="여름">여름
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme3" name="theme" value="가을">가을
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme4" name="theme" value="겨울">겨울
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme5" name="theme" value="일출">일출
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme6" name="theme" value="일몰">일몰
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme7" name="theme" value="등산">등산
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" id="theme8" name="theme" value="낚시">낚시
              </label>
            </div>
          </div>    
          <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
              <label class="checkbox-inline">
                <input type="checkbox" id="theme9" name="theme" value="애완동물동반">애완동물동반
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">가격(1박)</label>
            <div class="col-sm-10">
              <div class="col-sm-3" style="padding-left: 0px;">
                <input type="text" id="price1" class="form-control input-sm mb-md" name="price" value="0"/>  
              </div>
              <div class="col-sm-3" style="padding-left: 0px;">
                <input type="text" id="price2" class="form-control input-sm mb-md" name="price" value="100000"/>  
              </div>
          </div>
          </div>
        </form>
      </div>
      <footer class="panel-footer" style="border-radius: 0 0 30px 30px;">
        <div class="row">
          <div class="col-md-12 text-right">
            <button class="btn btn-success btn-circle"  id="detail_search">검색</button>
            <button class="btn btn-warning modal-dismiss btn-circle">취소</button>
          </div>
        </div>
      </footer>
    </section>
  
  </div>
<style>
  
</style>

  <div style="position: relative;">
    <div style="position: absolute; top: -40px;left: 20%;">
      <a class="modal-with-form detail_search-btn" href="#modalForm">상세검색+</a>
    </div>
    <div class="main-search-box" style="position: relative;">
      <h2 style="font-family: 'Gaegu', cursive; font-size: 40px; letter-spacing: -5.5px; "><span class="main-color">지금,</span> 떠나기 좋은 날!</h2>
      <form id="search">
        <div class="input-box">
          <div>
            <select class="form-control  main-search-input" id="sido" name="campAddr">
              <option value="">전체/도</option>
              <option value="서울">서울시</option>
              <option value="부산">부산시</option>
              <option value="대구">대구시</option>
              <option value="인천">인천시</option>
              <option value="광주">광주시</option>
              <option value="대전">대전시</option>
              <option value="울산">울산시</option>
              <option value="세종">세종시</option>
              <option value="경기">경기도</option>
              <option value="강원">강원도</option>
              <option value="충북">충청북도</option>
              <option value="충남">충청남도</option>
              <option value="전북">전라북도</option>
              <option value="전남">전라남도</option>
              <option value="경북">경상북도</option>
              <option value="경남">경상남도</option>
              <option value="제주">제주도</option>
            </select>
          </div>
          <div>
            <select class="form-control main-search-input" id="sigungu" name="campAddr">
              <option value="">전체/시/군</option>
            </select>

          </div>
          <div>
            <input type="text" id="searchKeyword" name="searchKeyword" class="form-control main-search-input" placeholder="키워드를 입력하세요">
          </div>
        </div>
        <button class="btn btn-primary btn-lg btn-block send-camp" type="button" id="searchbtn">검색</button>
    </form>
    </div>
  </div>
</section>


<!-- <div class="titan-caption">
  <div class="row">
    <div class="col-xs-4 col-lg-offset-4" style="text-align: center;">
      <h2  style="margin-bottom: 20px;">캠핑장을 검색 하세요!</h2>
      <div class="row">
        <div class="row">
          <div style="text-align: end; padding-right: 15px;">
            <a class="modal-with-form btn btn-success" href="#modalForm" style="padding: 5px;">상세검색+</a>
            
          </div>
        </div>

      <form id="search">  
        <div class="row" style="margin-bottom: 15px;">
          <div class="form-group">
            <label class="col-sm-3 control-label">키워드</label>
            <div class="col-sm-9">
              <input type="text" id="searchKeyword" name="searchKeyword" class="form-control">
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="row">
            <label class="col-md-3 control-label">지역별</label>
            <div class="col-md-3">
              <select class="form-control" id="sido" name="campAddr">
                <option value="">전체/도</option>
                <option value="서울">서울시</option>
                <option value="부산">부산시</option>
                <option value="대구">대구시</option>
                <option value="인천">인천시</option>
                <option value="광주">광주시</option>
                <option value="대전">대전시</option>
                <option value="울산">울산시</option>
                <option value="세종">세종시</option>
                <option value="경기">경기도</option>
                <option value="강원">강원도</option>
                <option value="충북">충청북도</option>
                <option value="충남">충청남도</option>
                <option value="전북">전라북도</option>
                <option value="전남">전라남도</option>
                <option value="경북">경상북도</option>
                <option value="경남">경상남도</option>
                <option value="제주">제주도</option>
              </select>
            </div>
            <div class="col-md-3" style="text-align: start; padding-left: 0px;" >
              <select class="form-control" id="sigungu" name="campAddr">
                  <option value="">전체/시/군</option>
              </select>
            </div>
            <div class="col-md-3" style="text-align: end;">
              <button class="btn btn-success btn-round" type="button" id="searchbtn">검색</button>
            </div>
          </div>
        </div>
      </form>
      </div>
    </div>
  </div>
</div> -->