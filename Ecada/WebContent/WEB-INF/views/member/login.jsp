<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnLogin').click(function(){
			if( $('#inputId').val() == '' || $('#inputPassword').val() == '' ){
				alert('모든 항목은 필수입니다.');
				return;
			}
			
			// overlay 보이기
			$("#loading-div-background").css({'z-index' : '9999'}).show();
			var formData = new FormData(document.loginForm);
			console.log(formData);
			$.ajax({
				url: '<c:url value="/member/login.do" />',
				type: "POST",
				data: formData,
				dataType:'TEXT',
				cache: false,
				processData: false,
				contentType: false,
				success: function(data, textStatus, jqXHR) {
					data = $.parseJSON(data);
					console.log(data);
					if(data.msg != undefined && data.msg != ''){
						alert(data.msg);
					}
					else {
// 						movePage(null, data.nextPage);
						window.location.href = ctx + data.nextPage;
					}
					$("#loading-div-background").hide();	// overlay 숨기기
				},
				error: function(jqXHR, textStatus, errorThrown) {
					$("#loading-div-background").hide();	// overlay 숨기기
					
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
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
	            <h2 class="title">로그인</h2>
	            <hr />
	            <form id="loginForm" name="loginForm" class="form-horizontal">
	                <div class="form-group has-feedback">
	                    <label for="inputUserId" class="col-sm-3 control-label">아이디</label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="inputId" name="memberId" placeholder="User ID" required="" value="darkonyx">
	                        <i class="fa fa-user form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="inputPassword" class="col-sm-3 control-label">비밀번호</label>
	                    <div class="col-sm-8">
	                        <input type="password" class="form-control" id="inputPassword" name="memberPw" placeholder="Password" required="" value="123">
	                        <i class="fa fa-lock form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <div class="col-sm-offset-3 col-sm-8">
	                    	<%--
	                        <div class="checkbox">
	                            <label class="custom-checkbox">Keep me logged in.
	                                <input type="checkbox" name="remember_me"/>
	                                <div class="checkmark"></div>
	                            </label>
	                        </div>
	                    	 --%>
	                        <button type="button" id="btnLogin" class="btn-e btn-block btn-e-primary margin-top-10">확인</button>
	                        <%--
	                        <ul class="lost">
	                            <li><a href="#">Forgot your password ?</a></li>
	                        </ul>
	                        <span class="text-center text-muted">Login with</span>
	                        <ul class="social-links colored circle clearfix">
	                            <li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
	                            <li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
	                            <li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
	                        </ul>
	                         --%>
	                    </div>
	                </div>
	            </form>
	        </div>
	        <p class="text-center space-top">아직 아이디가 없으신가요? <a href="javascript:movePage(this, '/member/goRegisterPage.do')">가입하기</a> <i class="icon-user-follow"></i></p>
	    </div>
	</div>
	<!-- END - Contain Wrapp -->
		
	<!-- overlay html start -->
	<div id="loading-div-background">
	      <div id="loading-div" class="ui-corner-all">
	           <img style="height:32px;width:32px;margin:30px;" src="<c:url value='/resources/img/please_wait.gif'/>" alt="Loading.."/>
	           <br>
	           PROCESSING(접속중이에요). PLEASE WAIT(잠시 기다려주세요)...
	      </div>
	</div>
	<!-- overlay html end -->
</body>
</html>