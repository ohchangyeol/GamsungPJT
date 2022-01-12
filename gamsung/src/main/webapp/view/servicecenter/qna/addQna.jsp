<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
<div>
  <form id="qna-add-form" name="qna-add-form" class="form-horizontal form-bordered form-bordered notice-form">
    <input type="hidden" name="id" value="${user.id}">
    <input type="hidden" name="campNo" value="">
    <input type="hidden" name="campName" value="">
    <div class="form-group form-group-invisible">
      <label for="qna-title" class="control-label-invisible">제목</label>
      <div class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10">
        <input  name="questionTitle" id="q-title" type="text" class="form-control form-control-invisible"  value="">
      </div>
    </div>
    <div class="form-group form-group-invisible c">
      <label for="qna-content" class="control-label-invisible">내용</label>
      <div class="col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10">
        <textarea  name="questionContent" id="q-content" type="text" class="form-control form-control-invisible"  value=""rows="10" cols="30"></textarea>
      </div>
    </div>

  </form>
</div>