<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="col-sm-4 col-md-3 sidebar">
      <div class="widget">
        <form role="form">
          <div class="form-group">
            <select class="form-control" name="searchCondition">
              <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>닉네임
              </option>
              <option value="1" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목
              </option>
              <option value="2" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>번호
              </option>
              <option value="3" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>내용
              </option>
              <option value="4" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>해시태그
              </option>
            </select>
          </div>



          <div class="search-box">
            <label class="sr-only" for="searchKeyword">검색어</label>
            <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해주세요."
              value="">
            <button class="search-btn" name="search-btn" type="submit"><i class="fa fa-search"></i></button>
          </div>
        </form>


      </div>
      <div class="widget">
        <h5 class="widget-title font-alt">카테고리</h5>
        <ul class="icon-list">
          <li><a href='/community/listPost?postType=1'>캠핑 리포트</a></li>
          <li><a href='/community/listPost?postType=2'>캠핑 노하우</a></li>
          <li><a href='/community/listPost?postType=3'>추억 한 컷</a></li>
          <li><a href='/community/listPost?postType=4'>캠핑 기록</a></li>
          <li><a href='/community/listPost?postType=5'>캠핑 지식인 </a></li>
        </ul>
      </div>

      <div class="widget">
        <h5 class="widget-title font-alt">Tag</h5>
        <div class="tags font-serif"><a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a href="#"
            rel="tag">Video</a><a href="#" rel="tag">Image</a><a href="#" rel="tag">Minimal</a><a href="#"
            rel="tag">Post</a><a href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a href="#"
            rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a href="#" rel="tag">Popular</a><a href="#"
            rel="tag">English</a>
        </div>
      </div>
      <div class="widget">
        <a class="addPost" href="/community/addPost">
          <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-pencil"
            viewBox="0 0 16 16">
            <path
              d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z">
            </path>
          </svg>
        </a>
        <div style="font-size: 12px" class="addPost font-alt">게시글 등록</div>
      </div>
    </div>


<script type="text/javascript">



$(function () {
    $("button:button[name='search-btn']").on("click", function () {
       	
	$("form").attr("method" , "POST").attr("action","/community/listPost").submit();	    
        
    });
});


</script>
