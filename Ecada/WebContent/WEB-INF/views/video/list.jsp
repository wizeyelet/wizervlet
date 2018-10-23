<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		var url = '/video/vList.do?typeSeq=3&searchType='+searchType+'&searchText='+searchText;
		javascript:movePage(this, url)
		//submit
		/* var frm = document.searchForm;
		var formData = new FormData(frm);
	    var ajaxReq = $.ajax({
	    	url : "<c:url value='/free/fList.do?' />",
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
	                  movePage(this, "/free/fList.do");
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
                        <h4>영상 <span>게시판</span></h4>
                        <ol class="breadcrumb">
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">자유게시판</a></li>
                            <li class="active">영상게시판</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- END - Inner Head -->


        <!-- START - Contain Wrapp -->
        <div class="contain-wrapp padding-bottom-40">
            <div class="container">
                <div class="row">
                    <!-- START - Article -->
                    <div class="col-sm-12 center">
                        <!-- START - Post 1 -->
                        <c:forEach items="${ list }" var="i">
                        <article class="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="img-wrapper" align="center"><!-- width="560" height="315" -->
                                    <iframe id="player" type="text/html" width="350" height="220"
  src="http://www.youtube.com/embed/${ i.linkUrl }?enablejsapi=1&origin=http://example.com"
  frameborder="0"></iframe>
                                        <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
<%--     <div id="player"></div>
                                        <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '220',
          width: '350',
          videoId: $('#linkUrl').val(),
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
                                        <input type="hidden" id="linkUrl" name="linkUrl" value="${ i.linkUrl }"/> --%>
<!--                                         <div class="post-share">
                                            <span>Share:</span>
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div> -->
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="post-heading">
                                        <h5><a href="#">${ i.title }</a></h5>
                                    </div>
                                    <p>
                                        ${ i.content }
                                    </p>
                                    <div class="footer-post margin-bottom-10">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-share-alt"></i> 0</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i> 0</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i> 0</a></li>
                                        </ul>
                                        <div class="rating pull-right">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-e btn-block btn-e-primary">Read more</button>
                                </div>
                            </div>
                        </article>
                  			<div class="divider divider-dashed margin-top-clear margin-bottom-50"></div>
                        </c:forEach>
                        <!-- END - Post 1 -->

<!--                         <div class="divider divider-dashed margin-top-clear margin-bottom-50"></div> -->

                        <!-- START - Post 2 -->
<!--                         <article class="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="img-wrapper">
                                        <img src="img/blog/img_750x500.png" class="img-responsive" alt="" />
                                        <div class="post-share">
                                            <span>Share:</span>
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="post-heading">
                                        <h5><a href="#">Electram definitiones id duo.</a></h5>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                    <div class="footer-post margin-bottom-10">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-share-alt"></i> 174</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i> 24</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i> 8</a></li>
                                        </ul>
                                        <div class="rating pull-right">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-e btn-block btn-e-primary">Read more</button>
                                </div>
                            </div>
                        </article> -->
                        <!-- END - Post 2 -->

<!--                         <div class="divider divider-dashed margin-top-clear margin-bottom-50"></div> -->

                        <!-- START - Post 3 -->
<!--                         <article class="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="img-wrapper">
                                        <img src="img/blog/img_750x500.png" class="img-responsive" alt="" />
                                        <div class="post-share">
                                            <span>Share:</span>
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="post-heading">
                                        <h5><a href="#">Eu vidit voluptaria quo vel.</a></h5>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                    <div class="footer-post margin-bottom-10">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-share-alt"></i> 174</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i> 24</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i> 8</a></li>
                                        </ul>
                                        <div class="rating pull-right">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-e btn-block btn-e-primary">Read more</button>
                                </div>
                            </div>
                        </article> -->
                        <!-- END - Post 3 -->

<!--                         <div class="divider divider-dashed margin-top-clear margin-bottom-50"></div> -->

                        <!-- START - Post 4 -->
<!--                         <article class="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="img-wrapper">
                                        <img src="img/blog/img_750x500.png" class="img-responsive" alt="" />
                                        <div class="post-share">
                                            <span>Share:</span>
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="post-heading">
                                        <h5><a href="#">Fabellas moderatius cum in.</a></h5>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                    <div class="footer-post margin-bottom-10">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-share-alt"></i> 174</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i> 24</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i> 8</a></li>
                                        </ul>
                                        <div class="rating pull-right">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-e btn-block btn-e-primary">Read more</button>
                                </div>
                            </div>
                        </article> -->
                        <!-- END - Post 4 -->

<!--                         <div class="divider divider-dashed margin-top-clear margin-bottom-50"></div> -->

                        <!-- START - Post 5 -->
<!--                         <article class="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="img-wrapper">
                                        <img src="img/blog/img_750x500.png" class="img-responsive" alt="" />
                                        <div class="post-share">
                                            <span>Share:</span>
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="post-heading">
                                        <h5><a href="#">No dicit theophrastus sit.</a></h5>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                    <div class="footer-post margin-bottom-10">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-share-alt"></i> 174</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i> 24</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i> 8</a></li>
                                        </ul>
                                        <div class="rating pull-right">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-e btn-block btn-e-primary">Read more</button>
                                </div>
                            </div>
                        </article> -->
                        <!-- END - Post 5 -->

<!--                         <div class="divider divider-dashed margin-top-clear margin-bottom-40"></div> -->

                        <div class="clearfix"></div>

                        <!-- START - Pagination -->
                    	<div class="row">
						<div class="col-md-12 text-center">
						    <nav>
							    <ul class="pagination pagination-sm">
								    <c:if test='${currentPage > blockSize}'>
								        <li>
								        	<a href="javascript:movePage(null, '/video/vList.do?typeSeq=3&page=${startBlockNo-blockSize}')" aria-label="Previous"><span aria-hidden="true">«</span></a>
								        </li>
								   	</c:if>
							        
							        <c:forEach begin="${startBlockNo}" end="${endBlockNo}" step="1" var="p" >
							        	<c:choose>
							        		<c:when test="${currentPage eq p}">
								        		<li class="active"><a href="#">${p}</a></li>
							        		</c:when>
							        		<c:otherwise>
							        			<li><a href="javascript:movePage(null, '/video/vList.do?typeSeq=3&page=${p}')">${p}</a></li>
							        		</c:otherwise>
							        	</c:choose>
							        	
							        </c:forEach>
							        <c:if test='${totalPage != endBlockNo}'>
								        <li>
								        	<a href="javascript:movePage(null, '/notice/nList.do?typeSeq=3&page=${endBlockNo+1}')" aria-label="Next"><span aria-hidden="true">»</span></a>
								        </li>
							        
							        </c:if>
							    </ul>
							</nav>
						</div>
						</div>
                        <!-- END - Pagination -->
                    </div>
                    <!-- END - Article -->

						<div class="row">
					<form method="post" name="searchForm">
				<table align="center" width="90%"><colgroup><col width="25%"/><col width="50%"/><col width="25%"/></colgroup><tr>
				<td align="right" valign="middle">
					<c:if test='${sessionScope.memberType == 9 }'>
						    <!-- <div class="col-md-12 text-right"> -->
						    	<a href="javascript:movePage(this, '/video/goWrite.do')">
							        <button type="button" class="btn btn-default "><i class="fa fa-pencil"></i> 작성</button>
							    </a>
						    <!-- </div> -->
					</c:if></td><td align="right" valign="middle">
				<!-- board_search -->
				<!-- <div class="col-md-12 text-center"> -->
					<input type="hidden" name="typeSeq" value="3"/>
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
		            
                    <!-- START - Aside -->
<!--                     <div class="col-sm-4">
                        <aside>
                            START - Search widget
                            <div class="widget-search widget">
                                <form action="#" method="get">
                                    <input type="text" class="form-control" placeholder="Search">
                                    <button class="btn-e btn-e-primary no-rounded" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </form>
                            </div>
                            END - Search widget

                            START - Widget 1
                            <div class="widget">
                                <h5 class="widget-head">Categories</h5>
                                <ul class="cat">
                                    <li><a href="#"><i class="fa fa-edit"></i> Web design</a> <span>(20)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> Graphic</a> <span>(43)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> Illustrator</a> <span>(7)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> Tutorial</a> <span>(16)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> Photography</a> <span>(27)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> Marketing</a> <span>(10)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> E-Commerce</a> <span>(8)</span></li>
                                    <li><a href="#"><i class="fa fa-edit"></i> Bloging</a> <span>(19)</span></li>
                                </ul>
                            </div> -->
                            <!-- END - Widget 1 -->

                            <!-- START - Widget 2 -->
<!--                             <div class="widget">
                                <h5 class="widget-head">Recent Posts</h5>
                                <div class="recent-widget">
                                    <div class="post">
                                        <div class="post-heading post-thumbnail">
                                            <a href="#" class="post-thumbnail"><img src="img/blog/thumbs/img.png" class="img-thumb" alt="" /></a>
                                            <h6><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></h6>
                                        </div>
                                    </div>
                                    <div class="post">
                                        <div class="post-heading post-thumbnail">
                                            <a href="#" class="post-thumbnail"><img src="img/blog/thumbs/img.png" class="img-thumb" alt="" /></a>
                                            <h6><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></h6>
                                        </div>
                                    </div>
                                    <div class="post">
                                        <div class="post-heading post-thumbnail">
                                            <a href="#" class="post-thumbnail"><img src="img/blog/thumbs/img.png" class="img-thumb" alt="" /></a>
                                            <h6><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></h6>
                                        </div>
                                    </div>
                                    <div class="post">
                                        <div class="post-heading post-thumbnail">
                                            <a href="#" class="post-thumbnail"><img src="img/blog/thumbs/img.png" class="img-thumb" alt="" /></a>
                                            <h6><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></h6>
                                        </div>
                                    </div>
                                    <div class="post">
                                        <div class="post-heading post-thumbnail">
                                            <a href="#" class="post-thumbnail"><img src="img/blog/thumbs/img.png" class="img-thumb" alt="" /></a>
                                            <h6><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></h6>
                                        </div>
                                    </div>
                                    <div class="post">
                                        <div class="post-heading post-thumbnail">
                                            <a href="#" class="post-thumbnail"><img src="img/blog/thumbs/img.png" class="img-thumb" alt="" /></a>
                                            <h6><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></h6>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- END - Widget 2 -->

                            <!-- START - Widget 3 -->
<!--                             <div class="widget">
                                <h5 class="widget-head">Recent Comments</h5>
                                <div class="row">
                                    <div class="col-md-12 owl-column-wrapp margin-min-bot-30">
                                        <div id="recent-comments" class="owl-carousel">
                                            <div class="item recent-comment">
                                                <blockquote>
                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                                </blockquote>
                                                <a href="#" class="comment-author">John Doe</a>
                                            </div>
                                            <div class="item recent-comment">
                                                <blockquote>
                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                                </blockquote>
                                                <a href="#" class="comment-author">John Doe</a>
                                            </div>
                                            <div class="item recent-comment">
                                                <blockquote>
                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat.
                                                </blockquote>
                                                <a href="#" class="comment-author">John Doe</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- END - Widget 3 -->

                            <!-- START - Widget 4 -->
<!--                             <div class="widget">
                                <h5 class="widget-head">Tags</h5>
                                <a href="#" class="tag">Web (10)</a>
                                <a href="#" class="tag">Clean (8)</a>
                                <a href="#" class="tag">Modern (12)</a>
                                <a href="#" class="tag">Flat (16)</a>
                                <a href="#" class="tag">Graphic (22)</a>
                                <a href="#" class="tag">Logo (11)</a>
                                <a href="#" class="tag">App (4)</a>
                                <a href="#" class="tag">Color (2)</a>
                                <a href="#" class="tag">Minimalis (15)</a>
                                <a href="#" class="tag">Tips (8)</a>
                                <a href="#" class="tag">Tutorial (9)</a>
                                <a href="#" class="tag">News (9)</a>
                            </div>
                            END - Widget 4

                            START - Widget 5
                            <div class="widget">
                                <h5 class="widget-head">Get in touch</h5>
                                <div class="blog-social">
                                    <a href="#" class="btn-e btn-twitter btn-icon btn-block">Twitter <i class="fa fa-twitter"></i></a>
                                    <a href="#" class="btn-e btn-facebook btn-icon btn-block">Facebook <i class="fa fa-facebook"></i></a>
                                    <a href="#" class="btn-e btn-google-plus btn-icon btn-block">Google + <i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="btn-e btn-linkedin btn-icon btn-block">Linkedin <i class="fa fa-linkedin"></i></a>
                                </div>
                            </div> -->
                            <!-- END - Widget 5 -->
<!--                         </aside>
                    </div> -->
                    <!-- END - Aside -->
                </div>
            </div>
        </div>
        <!-- END - Contain Wrapp -->

        <div class="clearfix"></div>

</body>
</html>