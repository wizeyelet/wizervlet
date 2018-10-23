<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="today" value="${ now }" pattern="yyyyMMdd"/>
<fmt:parseDate var="dayOp" value="${ today }" pattern="yyyyMMdd"/>
<fmt:parseDate var="dayEd" value="${ today + 1 }" pattern="yyyyMMdd"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function(){
	var msg='${msg}';
	if(msg!='') alert(msg);
	
	//검색버튼 클릭
	$('#btnSearch').click(function(){
		var searchType= $('#searchType option:selected').val();
		console.log(searchType);
		var searchText = $('#searchText').val();
		
		if(searchText==''){
			alert('검색어를 입력하세요.');
			return;
		}
		if(searchText.length <= 1){
			alert('두 글자 이상 입력하세요.');
			return;
		}
		var url = '/notice/nList.do?typeSeq=1&searchType='+searchType+'&searchText='+searchText;
		javascript:movePage(this, url)
		//submit
		/* var frm = document.searchForm;
		var formData = new FormData(frm);
	    var ajaxReq = $.ajax({
	    	url : "<c:url value='/notice/fList.do?' />",
	          data : formData,
	          type : 'POST',
	          dataType : "text",
	          processData : false,
	          contentType : false,
	          success : function (result, textStatus, XMLHttpRequest) {
	              //var data = $.parseJSON(result);
	              //console.log('data' + data);
	              //console.log('data' + result);
	              //console.log('good');
	              if(result != null){
	                  //alert("게시글이 작성되었습니다.");
	                  alert("success");
	                  movePage(this, "/notice/fList.do");
	              } else {
	            	  //console.log("1");
	                 alert("검색 에러\n관리자에게 문의바랍니다.");
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
	      }); */
		// frm.action = "<c:url value='/board/fList.do'/>";
		// frm.submit();
	});
});

</script>
</head>
<body>

        <!-- START - Inner Head -->
        <div class="parallax inner-head" style="background:url('resources/img/slider/revolution/002.jpg'); padding:30px 0 20px 0;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <i class="fa fa-list-ol"></i>
                        <h4>공지사항 <span></span></h4>
                        <ol class="breadcrumb">
                            <li class="active">공지사항</li>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">영상게시판</a></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- END - Inner Head -->

	<!-- START - Contain Wrapp -->
	<div class="contain-wrapp">
	    <div class="container">
	        <div class="row">
	            <div class="col-xs-12">
	                <!-- <h3 >공지사항</h3> --><!-- style="color:#f0f0f0" -->
	                <table class="table table-bordered">
	                	<colgroup>
	                		<col width="7%"/>
	                		<%-- <col width="7%"/> --%>
	                		<col width="66%" />
	                		<col width="10%" />
	                		<col width="7%"/>
	                		<col width="10%" />
	                	</colgroup>
	                    <thead>
	                        <tr>
	                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;">글번호</th>
	                            <!-- <th class="text-center">썸네일</th> -->
	                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;">제목</th>
	                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;">글쓴이</th>
	                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;">조회수</th>
	                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;">작성일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${list}" var="i">
	                    		<tr>
		                            <td align="center" valign="middle">${i.boardSeq}</td>
		                            <%-- <td align="center" valign="middle">
		                            	<c:choose>
											<c:when test="${ !empty i.fileIdx }">
												<img src="<c:url value='/notice/download.do?fileIdx=${i.fileIdx}'/>" height="40" width="60" alt=""/>
											</c:when>
											<c:otherwise>
												<img src="<c:url value='/resources/null.jpg' />" height="40" width="60" alt="" />
											</c:otherwise>
										</c:choose>
										</td> --%>
		                            <td valign="middle"><a href="javascript:movePage(this, '/notice/read.do?typeSeq=1&amp;boardSeq=${i.boardSeq }')">${i.title}</a></td>
		                            <td align="center" valign="middle">${i.memberNick }</td>
		                            <td align="center" valign="middle">${i.hits }</td>
		                            <td align="center" valign="middle">
										<c:choose>
											<c:when test="${ dayOp<i.createDate && i.createDate<dayEd }">
												<fmt:formatDate value="${ i.createDate }" pattern="HH:mm:ss"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${ i.createDate }" pattern="yyyy-MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>
		                        </tr>
	                    	</c:forEach>
	                    	<%--
	                        <tr>
	                            <td>1</td>
	                            <td>Mark</td>
	                            <td class="hidden-sm">Otto</td>
	                            <td>@mdo</td>
	                            <td>
	                                <button type="button" class="btn btn-warning btn-table"><i class="fa fa-pencil"></i> Edit</button>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>2</td>
	                            <td>Jacob</td>
	                            <td class="hidden-sm">Thornton</td>
	                            <td>@fat</td>
	                            <td>
	                                <button type="button" class="btn btn-success btn-table"><i class="fa fa-check"></i> Submit</button>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>3</td>
	                            <td>Larry</td>
	                            <td class="hidden-sm">the Bird</td>
	                            <td>@twitter</td>
	                            <td>
	                                <button type="button" class="btn btn-danger btn-table"><i class="fa fa-trash-o"></i> Delete</button>
	                            </td>
	                        </tr>
	                    	--%>
	                    </tbody>
	                </table>
	                <div class="row">
					    <div class="col-md-12 text-center">
						    <nav>
							    <ul class="pagination pagination-sm">
								    <c:if test='${currentPage > blockSize}'>
								        <li>
								        	<a href="javascript:movePage(null, '/notice/nList.do?typeSeq=1&page=${startBlockNo-blockSize}')" aria-label="Previous"><span aria-hidden="true">«</span></a>
								        </li>
								   	</c:if>
							        
							        <c:forEach begin="${startBlockNo}" end="${endBlockNo}" step="1" var="p" >
							        	<c:choose>
							        		<c:when test="${currentPage eq p}">
								        		<li class="active"><a href="#">${p}</a></li>
							        		</c:when>
							        		<c:otherwise>
							        			<li><a href="javascript:movePage(null, '/notice/nList.do?typeSeq=1&page=${p}')">${p}</a></li>
							        		</c:otherwise>
							        	</c:choose>
							        	
							        </c:forEach>
							        <c:if test='${totalPage != endBlockNo}'>
								        <li>
								        	<a href="javascript:movePage(null, '/notice/nList.do?typeSeq=1&page=${endBlockNo+1}')" aria-label="Next"><span aria-hidden="true">»</span></a>
								        </li>
							        
							        </c:if>
							    </ul>
							</nav>
					    </div>
					</div>
						<div class="row">
					<form method="post" name="searchForm">
				<table align="center" width="90%"><colgroup><col width="25%"/><col width="50%"/><col width="25%"/></colgroup><tr>
				<td align="right" valign="middle">
					<c:if test='${sessionScope.memberType == 9 }'>
						    <!-- <div class="col-md-12 text-right"> -->
						    	<a href="javascript:movePage(this, '/notice/goWrite.do')">
							        <button type="button" class="btn btn-default "><i class="fa fa-pencil"></i> 작성</button>
							    </a>
						    <!-- </div> -->
					</c:if></td><td align="right" valign="middle">
				<!-- board_search -->
				<!-- <div class="col-md-12 text-center"> -->
					<input type="hidden" name="typeSeq" value="1"/>
					<div class="col-sm-3">
					<select class="form-control input-sm" name="searchType" id="searchType">
						<option selected="selected" value="search">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> 
					</div>
					<div class="col-sm-9">
					<input class="form-control input-sm" type="text" id="searchText" name="searchText" title="검색어 입력박스" value="${ searchText }"/>
					</div> 
				<!-- </div> -->
				<!-- //board_search -->
				</td><td align="left" valign="middle">
					<button type="button" id="btnSearch" class="btn btn-default"><i class="fa fa-search"></i> 검색</button>
				</td></tr></table>
					</form>
		            </div>
				</div>
	        </div>
	    </div>
	</div>
	<!-- END - Parallax -->
</body>
</html>