<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>비밀번호 변경</title>
<!--STYLESHEET-->
    <!--=================================================-->
    <!--Open Sans Font [ OPTIONAL ]-->
    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'> -->
    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <%-- <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet"> --%>
    <!--Nifty Stylesheet [ REQUIRED ]-->
    <%-- <link href="<c:url value='/resources/css/nifty.min.css'/>" rel="stylesheet"> --%>
    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <%-- <link href="<c:url value='/resources/css/demo/nifty-demo-icons.min.css'/>" rel="stylesheet"> --%>
    <!--=================================================-->
    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <%-- <link href="<c:url value='/resources/plugins/pace/pace.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/resources/plugins/pace/pace.min.js'/>"></script> --%>
       
    <!--Demo [ DEMONSTRATION ]-->
    <%-- <link href="<c:url value='/resources/css/demo/nifty-demo.min.css'/>" rel="stylesheet"> --%>
   
         <!--Animate.css [ OPTIONAL ]-->
    <%-- <link href="<c:url value='/resources/plugins/animate-css/animate.min.css'/>" rel="stylesheet"> --%>
    <!--=================================================
    REQUIRED
    You must include this in your project.
    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.
    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.
    DEMONSTRATION
    This is to be removed, used for demonstration purposes only. This category must not be included in your project.
    SAMPLE
    Some script samples which explain how to initialize plugins or components. This category should not be included in your project.
    Detailed information and more samples can be found in the document.
    =================================================-->
    <!--JAVASCRIPT-->
    <!--=================================================-->
    <!--jQuery [ REQUIRED ]-->
    <%-- <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/common.js'/>"></script> --%>
    <!--BootstrapJS [ RECOMMENDED ]-->
    <%-- <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script> --%>
    <!--NiftyJS [ RECOMMENDED ]-->
    <%-- <script src="<c:url value='/resources/js/nifty.min.js'/>"></script> --%>
   
          <!--Bootbox Modals [ OPTIONAL ]-->
    <%-- <script src="<c:url value='/resources/plugins/bootbox/bootbox.min.js'/>"></script> --%>
    <!--=================================================-->
   
    <!--Background Image [ DEMONSTRATION ]-->
    <%-- <script src="<c:url value='/resources/js/demo/bg-images.js'/>"></script> --%>
   
    <script src="https://cdn.ckeditor.com/4.9.1/standard/ckeditor.js"></script>
	<script type="text/javascript">
var ctx = "<%= request.getContextPath()%>";
function changePassword(){
var password = $('#password').val();
var passwordCf = $('#passwordCf').val();
var userId = $('#RuserId').val();
var email = $('#Remail').val();
$(document).ready(function(){
console.log(userId);
console.log(email);
});
if(password == undefined || password == ''){
alert("Enter new password");
$('#password').focus();
return;
}
if(passwordCf == undefined || passwordCf == ''){
alert("Enter confirm password");
$('#passwordCf').focus();
return;
}
if(passwordCf != password){
alert("Password and confrim password does not match");
$('#passwordCf').focus();
return;
}
$.ajax({
url: '/ecada/resetPassword.do',
type: "post",
data:	{	'password' : password,
			'passwordCf' : passwordCf,
			"memberId" : encodeURIComponent(userId),
			"email" : encodeURIComponent(email)
		},
				success : function(data, textStatus, XMLHttpRequest) {
					alert(data.msg);
					if (data.code == "ok") {
						//window.location.href = ctx + "/member/goLoginPage.do"
						movePage(this, "/member/goLoginPage.do");
					}
					if (data.code == "no") {
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				}
			});

		}
	</script>
</head>
<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>
    <!-- <div id="container" class="cls-container" style="background: rgba(17, 30, 46, 1);"> -->
       
<!-- BACKGROUND IMAGE -->
<!--===================================================-->
<!-- <div id="bg-overlay"></div> -->
<!-- PASSWORD RESETTING FORM -->
<!--===================================================-->
<div class="contain-wrapp">
    <div class="container">
        <div class="form-block center-block">
            <h2 class="title">비밀번호 변경</h2>
            <hr/>
            <!-- <p class="pad-btm">새로 등록할 비밀번호를 입력하세요. </p> -->
           
            <form class="form-horizontal">
                <input type="hidden" name="userId" id="RuserId" value="${userId}" />
                <input type="hidden" name="email" id="Remail" value="${email}" />
                <div class="form-group has-feedback">
	                    <label for="inputName" class="col-sm-3 control-label">새 비밀번호 <span class="text-danger small"><!-- * --></span></label>
	                    <div class="col-sm-8">
                    <input type="password" id="password" class="form-control" placeholder="password">
                <i class="fa fa-pencil form-control-feedback"></i>
	                    </div>
	                </div>
                <div class="form-group has-feedback">
	                    <label for="inputName" class="col-sm-3 control-label">비밀번호 확인 <span class="text-danger small"><!-- * --></span></label>
	                    <div class="col-sm-8">
                    <input type="password" id="passwordCf" class="form-control" placeholder="confirm password">
                <i class="fa fa-envelope form-control-feedback"></i>
	                    </div>
	                </div>
                <div class="form-group">
		                	<div class="col-sm-offset-3 col-sm-8">
                    <button class="btn-e btn-block btn-e-primary margin-top-10" onclick="changePassword()" type="button">변경</button>
                </div>
		                </div>
            </form>
           
        </div>
    </div>
</div>
<!--===================================================-->
    </div>
    <!--===================================================-->
    <!-- END OF CONTAINER -->
</body>
</html>
