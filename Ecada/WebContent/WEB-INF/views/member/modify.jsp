<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	$("#loading-div-background").css({ opacity: 1 });
	$('#btnSignUp').click(function(e){
		
		if( $('#inputId').val() == '' || $('#inputName').val() == '' 
				|| $('#inputNickName').val() == '' || $('#inputPassword').val() == '' || $('#inputEmail').val() == ''){
			alert('모든 항목은 필수입니다.');
			return;
		}console.log("좀 보자"+$('#inputId').val())
		if($('#inputId').val().length<=4 || $('#inputId').val().length>=13){
			alert("아이디는 5자 이상, 12자 이하입니다.");
			$('inputId').focus();
			return;
		}
		if($('#inputNickName').val().length<=1 || $('#inputNickName').val().length>=13){
			alert("닉네임은 12자 이하입니다.");
			$('inputNickName').focus();
			return;
		}
		if($('#inputPassword').val()!=$('#rePassword').val()){
			alert("패스워드가 일치하지 않습니다.");
			$('inputPassword').focus();
			return;
		}
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{3,4}$/i;
		if($('#inputEmail').val().match(regExp)==null){
			alert("이메일 형식이 올바르지 않습니다.")
			$('#email').focus();
			return
		}
		
		// overlay 보이기
		$("#loading-div-background").css({'z-index' : '9999'}).show();
		
		var formData = new FormData(document.modForm);
//			var formData = $("#registerForm").serialize();
		console.log(formData);
		$.ajax({
			url: '<c:url value="/member/modify.do" />',
			type: "POST",
			data: formData,
			dataType:'TEXT',
			cache: false,
			processData: false,
			contentType: false,
			success: function(result, textStatus, XMLHttpRequest) {
	              //var data = $.parseJSON(result);
	              //console.log('data' + data);
	              console.log('data' + result);
	              console.log('good');
	              if(result == 1){
	                  alert("회원정보가 수정되었습니다.");
	                  movePage(this, "/index.do", "pageName=free");
	              } else {
	            	  console.log("1");
	                 alert("정보 수정 에러\n관리자에게 문의바랍니다.");
	                window.location.href="<c:url value='/index.do'/>";
	              }
	              
	              $("#loading-div-background").hide();   // overlay 숨기기
	          },
	          error : function (XMLHttpRequest, textStatus, errorThrown) {
	                //alert(e);
	                console.log("2");
	                alert("시스템 에러\n관리자에게 문의바랍니다.");
	                $("#loading-div-background").hide();   // overlay 숨기기
	              console.log("작성 에러\n" + XMLHttpRequest.responseText);
	          }
	      });
	});
});
</script>
</head>
<body>
	<!-- START - Contain Wrapp -->
	<div class="contain-wrapp">
	    <div class="container">
	        <div class="form-block center-block">
	            <h2 class="title">회원정보 수정</h2>
	            <hr />
	            <form id="modifyForm" name="modForm" class="form-horizontal">
	            <input type="hidden" name="memberIdx" value="${ member.member_idx }"/>
	                <div class="form-group has-feedback">
	                    <label for="inputName" class="col-sm-3 control-label">아이디 <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input value="${ member.member_id }" readonly="readonly" type="text" class="form-control" id="inputId" name="memberId" placeholder="User ID" required>
	                        <i class="fa fa-pencil form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="inputName" class="col-sm-3 control-label">이름 <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input value="${ member.member_name }" type="text" class="form-control" id="inputName" name="memberName" placeholder="User Name" required>
	                        <i class="fa fa-pencil form-control-feedback"></i>
	                    </div>
	                </div>
	                <%--
	                <div class="form-group has-feedback">
	                    <label for="inputLastName" class="col-sm-3 control-label">Last Name <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="inputLastName" placeholder="Last Name" required>
	                        <i class="fa fa-pencil form-control-feedback"></i>
	                    </div>
	                </div>
	                 --%>
	                <div class="form-group has-feedback">
	                    <label for="inputUserName" class="col-sm-3 control-label">닉네임 <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input value="${ member.member_nick }" type="text" class="form-control" id="inputNickName" name="memberNick" placeholder="Nick Name" required>
	                        <i class="fa fa-user form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="inputPassword" class="col-sm-3 control-label">비밀번호 <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input type="password" name="memberPw" class="form-control" id="inputPassword" placeholder="Password" required>
	                        <i class="fa fa-lock form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="inputPassword" class="col-sm-3 control-label">비밀번호 확인 <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input type="password" class="form-control" id="rePassword" placeholder="rePassword" required>
	                        <i class="fa fa-lock form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="inputEmail" class="col-sm-3 control-label">이메일 <span class="text-danger small">*</span></label>
	                    <div class="col-sm-8">
	                        <input value="" type="email" class="form-control" id="inputEmail" name="email" placeholder="E-mail" required>
	                        <i class="fa fa-envelope form-control-feedback"></i>
	                    </div>
	                </div>
	                <%-- 
	                <div class="form-group">
	                    <div class="col-sm-offset-3 col-sm-8">
	                        <div class="checkbox">
	                            <label class="custom-checkbox">I have read <a href="#">privacy policy</a> and <a href="#">customer agreement</a>
	                                <input type="checkbox" name="terms" required/>
	                                <div class="checkmark"></div>
	                            </label>
	                        </div>
	                    </div>
	                </div>
	                --%>
	                <div class="form-group">
	                    <div class="col-sm-offset-3 col-sm-8">
	                        <button type="button" id="btnSignUp" class="btn-e btn-block btn-e-primary">수정하기</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	        <!-- <p class="text-center space-top">이미 아이디가 있으신가요? <a href="javascript:movePage(this, '/member/goLoginPage.do')">로그인</a> <i class="icon-emoticon-smile"></i></p> -->
	    </div>
	</div>
	<!-- END - Contain Wrapp -->
	
	<!-- overlay html start -->
	<div id="loading-div-background">
	      <div id="loading-div" class="ui-corner-all">
	           <img style="height:32px;width:32px;margin:30px;" src="<c:url value='/resources/img/please_wait.gif'/>" alt="Loading.."/>
	           <br>
	           PROCESSING. PLEASE WAIT...
	      </div>
	</div>
	<!-- overlay html end -->
</body>
</html>