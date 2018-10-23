<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>비밀번호 찾기</title>

	<!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'> -->

    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <%-- <link href="<c:url value='/resources/js/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"> --%>

    <!--Nifty Stylesheet [ REQUIRED ]-->
    <%-- <link href="<c:url value='/resources/css/nifty.min.css'/>" rel="stylesheet"> --%>

    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <%-- <link href="<c:url value='/resources/css/demo/nifty-demo-icons.min.css'/>" rel="stylesheet"> --%>

    <!--=================================================-->
    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <%-- <link href="<c:url value='/resources/plugins/pace/pace.min.css'/>" rel="stylesheet"> --%>
    <%-- <script src="<c:url value='/resources/plugins/pace/pace.min.js'/>"></script> --%>
        
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
    <%-- <script src="<c:url value='/resources/js/jquery.min.js'/>"></script> --%>

	 <%-- <script src="<c:url value='/resources/js/common.js'/>"></script> --%>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-ui/css/jquery-ui.css" />" />
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login.css" />" /> --%>

<%-- <script type="text/javascript" src="<c:url value="/resources/jquery/js/jquery-3.2.1.js" />"></script> --%>
<script type="text/javascript" src="<c:url value="/resources/jquery-ui/js/jquery-ui.js" />"></script>
<%-- <script type="text/javascript" src="<c:url value="/resources/jquery/js/jquery-migrate-1.4.1.js" />"></script> --%>
<script type="text/javascript">
var ctx = "<%= request.getContextPath()%>";
function goMailCheck(){
	// id, email 입력 유효성 검사
	var email = $('#email').val();
	var userId = $('#userId').val();
	if(userId == undefined || userId == ''){
		alert("아이디를 입력하세요.");
		$('#userId').focus();
		return;
	}
	if(email == undefined || email == ''){
		alert("가입하신 메일주소를 입력하세요.");
		$('#email').focus();
		return;
	}

	$.ajax({ //입력받은 메일주소로 메일을 보낸다.
		url: '<c:url value="/ckeckEmail.do"/>',//메일을 전송하고 전송된 비밀번호로 지정된 아이디의 비밀번호를 변경할 메서드를 실행
		type: "POST",
		data: {'email' : email, 'userId' : userId}, //보내는 정보는 메일주소와 아이디
		success : function(data, textStatus, XMLHttpRequest) {
			var result = data//$.parseJSON(data); 
			console.log("success", data);
			console.log(result);
			alert(result.msg);
			if (result.code == "ok") { 
				console.log("success, ok");
				window.location.href = ctx+"/index.do"//성공시, 홈 페이지로 돌아간다.
			} 
			if (result.code == "no") {//실패시,
				console.log("success, no");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log("error");
			alert(XMLHttpRequest.responseText);
		}
	
	});

  
}


</script>
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
    <!-- <div id="container" class="cls-container" style="background: null;"> -->
        
		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
	<!-- 	<div id="bg-overlay"></div> -->
		
		
		<!-- PASSWORD RESETTING FORM -->
		<!--===================================================-->
	<div class="contain-wrapp">
    <div class="container">
	<div class="form-block center-block">
		<!-- <div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body"> -->
		            <h2 class="title">비밀번호 찾기</h2>
		            	            <hr />
		            <form class="form-horizontal">
		            <!-- <p class="form-group has-feedback">비밀번호를 찾으려는 아이디와,<br/>해당 아이디에 등록된 메일 주소를 입력해주세요.</p> -->
		            <div class="form-group has-feedback">
	                    <label for="inputName" class="col-sm-3 control-label">아이디 <span class="text-danger small"><!-- * --></span></label>
	                    <div class="col-sm-8">
		                    <input type="text" id="userId" class="form-control" placeholder="Id">
	                        <i class="fa fa-pencil form-control-feedback"></i>
	                    </div>
	                </div>
	                <div class="form-group has-feedback">
	                    <label for="inputName" class="col-sm-3 control-label">이메일 <span class="text-danger small"><!-- * --></span></label>
	                    <div class="col-sm-8">
		                    <input type="text" id="email" class="form-control" placeholder="Email">
	                        <i class="fa fa-envelope form-control-feedback"></i>
	                    </div>
	                </div>
	                <!--  -->
		                <div class="form-group">
		                	<div class="col-sm-offset-3 col-sm-8">
		                    <button class="btn-e btn-block btn-e-primary margin-top-10" onclick="goMailCheck()" type="button">재설정 메일 전송</button>
		                    </div>
		                </div>
		            </form>
		            </div>
		                <p class="text-center space-top"><!-- 이미 아이디가 있으신가요?  --><a href="javascript:movePage(this, '/member/goLoginPage.do')">로그인 화면으로</a> <i class="icon-emoticon-smile"></i></p>
		            </div>
<!-- 		        </div>
		    </div>
		</div> -->
	
	</div>
	
		<!--===================================================-->

	<!-- overlay html start -->
	<div id="loading-div-background">
	      <div id="loading-div" class="ui-corner-all">
	           <img style="height:32px;width:32px;margin:30px;" src="<c:url value='/resources/img/please_wait.gif'/>" alt="Loading.."/>
	           <br>
	           PROCESSING(접속중이에요). PLEASE WAIT(잠시 기다려주세요)...
	      </div>
	</div>
	<!-- overlay html end -->		
		
		
    <!-- </div> -->
    <!--===================================================-->
    <!-- END OF CONTAINER -->

</body>
</html>

