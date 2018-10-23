<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- tag library 선언 : c tag --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>게시물 상세페이지</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css" />" /> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	var msg = '${msg}';
	function init(){
		if(msg!=''){
			alert(msg);
		}
	}


	$(document).ready(function() {
		var frm = document.readForm;
		var formData = new FormData(frm);
		var boardSeq = $('#boardSeq').val();
		var typeSeq = $('#typeSeq').val();
		console.log(boardSeq);
		console.log(typeSeq);
		$('#btnDel').on('click', function() {
			if(confirm("게시물을 삭제하시겠습니까?")){
				//frm.action = "<c:url value='/notice/delete.do'/>";
				//frm.submit();
				var ajaxReq = $.ajax({
			    	url : "<c:url value='/notice/delete.do' />",
			        data : {typeSeq:typeSeq, boardSeq:boardSeq},
			        type : 'POST',
			        //dataType : "text",
			        //processData : false,
			        //contentType : false,
			        success : function (result, textStatus, XMLHttpRequest) {
			              //var data = $.parseJSON(result);
			              //console.log('data' + data);
			              console.log('data' + result);
			              console.log('good');
			              if(result == 1){
			                  alert("게시물이 삭제되었습니다.");
			                  movePage(this, "/notice/nList.do?typeSeq=1", "pageName=notice");
			              } else {
			            	  console.log("1");
			                 alert("게시물 삭제 에러\n관리자에게 문의바랍니다.");
			                window.location.href="<c:url value='/index.do'/>";
			              }
			              
			              $("#loading-div-background").hide();   // overlay 숨기기
			          },
			          error : function (XMLHttpRequest, textStatus, errorThrown) {
			                //alert(e);
			                console.log("2");
			                alert("실행 에러\n관리자에게 문의바랍니다.");
			                $("#loading-div-background").hide();   // overlay 숨기기
			              console.log("작성 에러\n" + XMLHttpRequest.responseText);
			          }
			      });
			}

		});
		$('#btnUpdate').on('click', function() {
			var url = '/notice/goUpdate.do?typeSeq='+typeSeq+'&boardSeq='+boardSeq;
			javascript:movePage(this, url)
			//frm.action = "<c:url value='/notice/goUpdate.do'/>";
			//frm.submit();
			
		});
	});
</script>
</head>
<body onload="init()">

        <!-- START - Contain Wrapp -->
        <div class="contain-wrapp padding-bottom-40">
            <div class="container">
                <div class="row">
                    <!-- START - Article -->
                    <div class="col-md-12">
                        <!-- START - Post 1 -->
                        <article class="post post-thumbnail">
<!--                             <div class="img-wrapper">
                                <img src="img/blog/img_1140x560.png" class="img-responsive" alt="" />
                                <div class="post-share">
                                    <span>Share:</span>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </div> -->
                            <div class="post-frame">
                                <div class="post-heading">
                                	<table border="0" width="100%">
                                	<tr>
                                    <td><h4>${ board.title }</h4></td>
                                    <td align="right" valign="top">글번호 : ${ board.board_seq }</td>
                                    </tr>
                                    <tr>
                                    <td valign="bottom"><b>작성자 : ${ board.member_nick }</b></td>
                                    <td align="right" valign="bottom">작성일 : ${ board.create_date }</td>
                                    </tr>
                                    </table>
                                </div>
                                <c:forEach items="${ files }" var="file">
									<c:if test="${ file.file_type=='image/jpeg' or file.file_type=='image/png' or file.file_type=='image/gif'}">
										<div align="center"><img src="/ecada/notice/download.do?fileIdx=${file.file_idx}" width="auto"></img></div><br/>
									</c:if>
								</c:forEach>
                                <p>
                                
                                	${ board.content }
                                </p>
                                    <form name="readForm">
                                    <input type="hidden" id="boardSeq" name="boardSeq" value="${ board.board_seq }"/>
									<input type="hidden" id="typeSeq" name="typeSeq" value="${ board.type_seq }"/>
									</form>
                                <div class="footer-post margin-bottom-10">
                                    <ul>
                                        <li><a href="javascript:movePage(null, '/notice/nList.do?typeSeq=1')"><i class="icon-list"></i> &nbsp;목록으로 
									</a></li>
                                    <c:if test="${sessionScope.memberId == board.member_id}">
                                        <li><a id="btnUpdate"><i class="icon-list"></i> &nbsp;수정하기 
									</a></li>
									</c:if> 
									<c:if test="${sessionScope.memberId == board.member_id || sessionScope.memberType == 9}">
                                        <li><a type="button" id="btnDel"><i class="icon-trash"></i> &nbsp;삭제하기</a></li>
                                    </c:if>
                                        <li><i class="icon-paper-clip"></i> &nbsp;첨부파일</li>
                                    </ul>
                                    <div class="pull-right">
                                    <i>
                                <c:if test="${ !empty files }">
                                    	<c:forEach items="${files}" var="file" varStatus="vs">									
											<c:choose>
												<c:when test="${file.linked=='F' }">
													${file.file_name }(서버에서 파일을 찾을 수 없습니다.)
												</c:when>
												<c:otherwise>
										<a href="<c:url value='/notice/download.do?fileIdx=${file.file_idx}'/>">
										${ file.file_name } (${ file.file_size } bytes)</a>
												</c:otherwise>
											</c:choose>
									</c:forEach>
                                </c:if>
									</i>
                                         <!-- <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i> -->
                                    </div>
                                </div>
                                <!-- <a href="#" class="btn-e btn-e-primary btn-icon">파일 첨부<i class="fa fa-plus"></i></a> -->
                            </div>
                        </article>
                        <!-- END - Post 1 -->

                        <!-- START - Leave Comments -->
<!--                         <h5>댓글 쓰기</h5>
                        <form class="row"> -->
                            <!-- <div class="col-md-6 margin-bottom-30">
                                <input class="form-control" type="text" name="name" placeholder="Enter your full name..." />
                            </div>
                            <div class="col-md-6 margin-bottom-30">
                                <input class="form-control" type="text" name="name" placeholder="Enter your e-mail..." />
                            </div> -->
<!--                             <div class="col-md-12 margin-bottom-30">
                                <textarea class="form-control" rows="9" name="message" placeholder="Your comment here..."></textarea>
                            </div> -->
                            <!-- <div class="col-md-12">
                                <label>Your Rating :</label>
                                <div id="start" class="rate" data-rating="1"></div>
                            </div> -->
<!--                             <div class="col-md-12">
                                <input type="submit" value="Leave comment" class="btn-e btn-rounded btn-e-primary" name="Submit" />
                            </div>
                        </form> -->
                        <!-- END - Leave Comments -->

<!--                         <div class="divider margin-top-25 margin-bottom-40"></div> -->

                        <!-- START - Comments -->
<!--                         <h5>댓글 보기 ()</h5> -->
                        <!-- <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="img/testimonials/img.png" alt="" />
                                </a>
                            </div>
                            <div class="media-body">
                                <h6 class="media-heading"><a href="#">John Doe</a></h6>
                                <p>
                                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
                                </p>
                                <p class="reply"><a href="#"><i class="icon-link"></i> Reply</a></p>
                            </div>
                        </div> -->

<%-- 						<c:forEach items="${ reply }" var="r">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="img/testimonials/img.png" alt="" />
                                </a>
                            </div>
                            <div class="media-body">
                            	<table width="100%"><tr>
                                <td align="left"><h6 class="media-heading"><a href="#">${ r.memberNick }</a></h6></td>
                                <td align="right">${ r.createDate }</td>
                                </tr></table>
                                <p>
                                    ${ r.content }
                                </p>
                                <p class="reply"><a href="#"><i class="icon-link"></i> Reply</a></p>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" src="img/testimonials/img.png" alt="" />
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h6 class="media-heading"><a href="#">John Doe</a></h6>
                                        <p>
                                            ${ rr.content }
                                        </p> --%>
                                        <!-- <p class="reply"><a href="#"><i class="icon-link"></i> Reply</a></p> -->
<!--                                     </div>
                                </div> -->
                                <!-- <div class="media">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" src="img/testimonials/img.png" alt="" />
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h6 class="media-heading"><a href="#">Jane Roe</a></h6>
                                        <p>
                                            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.
                                        </p>
                                        <p class="reply"><a href="#"><i class="icon-link"></i> Reply</a></p>
                                    </div>
                                </div> -->
<%--                             </div>
                        </div>
                        </c:forEach> --%>

                        <!-- <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="img/testimonials/img.png" alt="" />
                                </a>
                            </div>
                            <div class="media-body">
                                <h6 class="media-heading"><a href="#">Jane Roe</a></h6>
                                <p>
                                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
                                </p>
                                <p class="reply"><a href="#"><i class="icon-link"></i> Reply</a></p>
                            </div>
                        </div> -->
                        <!-- END - Comments -->
                    </div>
                    <!-- END - Article -->
                </div>
            </div>
        </div>
        <!-- END - Contain Wrapp -->

</body>
</html>