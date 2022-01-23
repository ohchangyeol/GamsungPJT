<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   


      <style>
     
        .tags a {
		    background: #b3c2d170;
		    display: inline-block;
		    font-size: 12px;
		    color: #666;
		    padding: 4px 13px 4px 12px;
		    margin: 0 1px 4px;
		    border-radius: 2px;
		    
		}
		
        .widget {
		    color: #666;   
		}
		
		.tooltip-arrow,
		.red-tooltip + .tooltip > .tooltip-inner {background-color: #b3c2d1;}
		
		.red-tooltip + .tooltip.top > .tooltip-arrow {background-color: #b3c2d1;}
		
		
		.tooltip-arrow, .red-tooltip + .tooltip > .tooltip-inner{
		
		background-color:#1110;}
		
		.tooltip-arrow{
		
		background-color:#1110;}
		
		.tooltip-inner{
		
		color:#666666;
		background-color:#1110;}
		
		.tooltip.right .tooltip-arrow{
		border-right-color : #1110;
		}
		
		a {
		    color: #666;
		}
		
		.widget .widget-title {
		    color: #666;
		    letter-spacing: 3px;
		}
		
		
		
		.form-control {
		    color: #666;
		}

      </style>



    
    <div class="col-sm-4 col-md-3 sidebar">
      <div class="widget">
        <form role="form" id="community-search-form">
          <div class="form-group">
            <select class="form-control" name="searchCondition" style="font-size: 12px; ">
              <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID
              </option>
              <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목
              </option>
              <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>번호
              </option>
              <option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>내용
              </option>
              <option value="4" ${ ! empty search.searchCondition && search.searchCondition==4 ? "selected" : "" }>해시태그
              </option>
            </select>
          </div>



          <div class="search-box">
            <label class="sr-only" for="searchKeyword">검색어</label>
            <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해주세요."
              value="${search.searchKeyword}">
            <button id="left-search-btn" class="search-btn" name="search-btn" type="submit"><i
                class="fa fa-search"></i></button>
          </div>
          <input type="hidden" id="currentPage" name="currentPage" value="1"/>
        </form>


      </div>
      <div class="widget">
        <h5 class="widget-title font-alt">카테고리</h5>
        <ul class="icon-list">
          <li><a href='/community/listPost?postType=1' data-toggle="tooltip" data-placement="right" data-html="true" title="감성캠핑에서 캠핑에 대한 <br>유용한 정보를 알려드립니다.">캠핑 리포트</a></li>
          <li><a href='/community/listPost?postType=2' data-toggle="tooltip" data-placement="right" data-html="true" title="여러분의 <br>캠핑 노하우를 알려주세요">캠핑 노하우</a></li>
          <li><a href='/community/listPost?postType=3' data-toggle="tooltip" data-placement="right" data-html="true" title="남는건 사진뿐이라고 했던가요?<br>여러분의 추억을 자랑해주세요">추억 한 컷</a></li>
          <li><a href='/community/listPost?postType=4' data-toggle="tooltip" data-placement="right" data-html="true" title="캠핑장소후기를 남겨주세요<br>(감성캠핑등록 캠핑장후기는 <br>해당캠핑장 이용후기에<br>등록됩니다*^^*">캠핑 기록</a></li>
          <li><a href='/community/listPost?postType=5' data-toggle="tooltip" data-placement="right" data-html="true" title="캠핑 관련 지식에 대해 <br>묻고 답할 수 있습니다.">캠핑 지식인</a></li>
        </ul>
      </div>

      <div class="widget">
        <h5 class="widget-title font-alt">Tag</h5>
        <div class="tags font-serif"><a href="#" rel="tag">글램핑</a><a href="#" rel="tag">캠핑</a><a href="#"
            rel="tag">힐링</a><a href="#" rel="tag">감성</a><a href="#" rel="tag">감성캠핑</a><a href="#"
            rel="tag">데이트</a><a href="#" rel="tag">가족여행</a><a href="#" rel="tag">여행</a><a href="#"
            rel="tag">텐트</a><a href="#" rel="tag">캠핑카</a><a href="#" rel="tag">산</a><a href="#"
            rel="tag">바다</a>
        </div>
      </div>
      <div class="widget">
        <a class="addPost" href="/community/addPost">
          <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="#666" class="bi bi-pencil"
            viewBox="0 0 16 16"  style=" transform: translateY(12px) translateX(140px); ">
            <path
              d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z">
            </path>
          </svg>
        
          <div style="font-size: 12px; font-family: 'Gaegu', cursive;  font-size: 34px; letter-spacing: -4px;" class="addPost font-alt">
            <p style="transform: translateX(10px)translateY(-77px); ">게시글</p>
            <p style=" transform: translateX(85px)translateY(-99px);">등록</p>
          </div>
        </a>
      </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    