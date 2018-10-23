<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- tag library 선언 : c tag --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>게시물 작성하기</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css" />" /> --%>
<script
	src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script type="text/javascript">
		
	$(document).ready(function(){
		//alert('초기 펑션 실행');
		console.log('브라우저 디버깅 수동 로그');
		$('#btnWrite').on('click', doWrite);
	function doWrite(){
		
		//var title = frm.title.value;
		//var contents = frm.contents.value;
		var title = $('#titleId').val();
		if(title.length == 0){
			alert("제목을 입력하세요.");
			//document.writeForm.title.focus();
			//frm.title.focus();
			$('#title').focus();
			return;
		}
		//frm.contents.value = ckEditor.getData();
		var contents = $('#editor').val();
		if(contents.length == 0){
			alert("내용을 입력하세요.");
			//frm.contents.focus();
			return;
		}
		
		console.log("에프알엠");
		console.log(frm);
		console.log("그데이터");
		console.log(formData);
		var frm = document.writeForm;
		var formData = new FormData(frm);
	    var ajaxReq = $.ajax({
	    	url : "<c:url value='/notice/write.do' />",
	          data : formData,
	          type : 'POST',
	          dataType : "text",
	          processData : false,
	          contentType : false,
	          success : function (result, textStatus, XMLHttpRequest) {
	              //var data = $.parseJSON(result);
	              //console.log('data' + data);
	              console.log('data' + result);
	              console.log('good');
	              if(result == 1){
	                  alert("게시글이 작성되었습니다.");
	                  movePage(this, "/notice/nList.do?typeSeq=1", "pageName=notice");
	              } else {
	            	  console.log("1");
	                 alert("게시글 작성 에러\n관리자에게 문의바랍니다.");
	                window.location.href="<c:url value='/index.do'/>";
	              }
	              
	              $("#loading-div-background").hide();   // overlay 숨기기
	          },
	          error : function (XMLHttpRequest, textStatus, errorThrown) {
	                //alert(e);
	                console.log("2");
	                alert("작성 에러\n관리자에게 문의바랍니다.");
	                $("#loading-div-background").hide();   // overlay 숨기기
	              console.log("작성 에러\n" + XMLHttpRequest.responseText);
	          }
	      });
		//frm.action = "javascript:movePage(null,'/notice/write.do')";
		//frm.submit();
	}
	
	
	/* function init(){
		//alert('초기 펑션 실행');
	}
	$(document).ready(init);//도큐먼트를 찾아  ready 상태에서 init을 실행. */
	
	});
	
</script>
</head>
<body>

	<!-- START - Contain Wrapp -->
	<div class="contain-wrapp">
		<div class="container">
			<div class="row">
				<!-- Start billing information -->
				<div class="col-md-12">
					<h5 class="head-title">글쓰기</h5>
					<form name="writeForm" class="form-horizontal" enctype="multipart/form-data">
					<input type="hidden" name="typeSeq" value="1"/>
					<input type="hidden" name="memberId" value="${sessionScope.memberId}"/>
					<input type="hidden" name="memberNick" value="${sessionScope.memberNick}"/>
					<input type="hidden" name="memberIdx" value="${sessionScope.memberIdx}"/>
						<div class="form-group">
							<label for="input1" class="col-sm-3">제목</label>
							<div class="col-sm-9">
								<input id="titleId" type="text" class="form-control" name="title"
									placeholder="제목을 입력하세요" />
							</div>
						</div>

						<div class="form-group">
							<label for="input12" class="col-sm-3">내용</label>
							<div class="col-sm-9">
								<textarea id="editor" class="form-control textarea-e" rows="4" name="contents"
									placeholder="내용을 입력하세요"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="input12" class="col-sm-3">파일 첨부</label>
							<input
								type="file" id="exampleInputFile" name="attFile"/>
								<p class="help-block"></p>
						</div>
						<div>
						<table border="0" width="100%"><tr>
						<td align="left"><button type="button" id="btnWrite" class="btn-e btn-e-primary">작성</button></td>
						<td align="right"><a href="javascript:movePage(this, '/notice/nList.do?typeSeq=1')"><button type="button" class="btn-e btn-e-primary">목록</button></a></td>
						</tr>
						</table>
						</div>
					</form>
				</div>
				<!-- End billing information -->
			</div>
		</div>
	</div>
	<!-- END - Contain Wrapp -->

</body>
</html>