<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- <meta name="viewport" content="initial-scale=0.8, zoom=10%, width=device-width, target-densitydpi=high-dpi"> -->
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<meta name="viewport" content="width=device-width, initial-scale=0.5, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no, target-densitydpi=medium-dpi;""/>
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="keywords" content="corporate html template - agency theme - business html template - creative theme - portfolio html template - gallery theme - restaurant theme - ecommerce template - app template - landing page - real estate theme">
	<meta name="description" content="Bootstrap HTML5 template for agency, corporate, business, app and creative portfolio, it is suitable for any kind of websites, like ecommerce, restaurant, photography, gallery and retail website.">
	<meta name="author" content="encodeslife">
	<link rel="icon" href="<c:url value="/resources/img/favicon.png" />">
	
	<title>Potpole.me - 나의 포트폴리오 커뮤니티</title>
	
	<!-- BOOTSTRAP -->
	<link href="<c:url value="/resources/js/bootstrap/css/bootstrap.css" />" rel="stylesheet">
	
	<!-- CUSTOM STYLES -->
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
	
	<!-- THEME SKINS -->
	<link id="skin" href="<c:url value="/resources/css/theme-colors/dark-red.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/js/style-switcher/css/style-switcher.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/line-icons/line-icons.css" />" rel="stylesheet">

	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	    <script src="<c:url value="/resources/js/html5shiv.min.js" />"></script>
	    <script src="<c:url value="/resources/js/respond.min.js" />"></script>
	<![endif]-->
	
	<!--[if IE 9]>
	    <link href="<c:url value="/resources/css/ie.css" />" rel="stylesheet">
	<![endif]-->
	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	
	<!-- BOOTSTRAP -->
	<script src="<c:url value="/resources/js/bootstrap/js/bootstrap.min.js" />"></script>
	
	<!-- jQuery Easing -->
	<script src="<c:url value="/resources/js/jquery.easing-1.3.min.js" />"></script>
	
	<script src="<c:url value="/resources/js/common.js" />"></script>
	<script src="<c:url value="/resources/js/custom.js" />"></script>
	
	<script type="text/javascript" >
		var ctx = '<%= request.getContextPath() %>';

		var resetPw = '<%= request.getParameter("resetPw") %>';
	    var userId = '<%= request.getParameter("userId") %>';
	    var email = '<%= request.getParameter("email") %>';
	    console.log(resetPw)
	    console.log(userId)
	    console.log(email)
	    $(document).ready(function() {   		       	
		    if(resetPw=='T'){
		    var url = "/mail/goResetPw.do?userId="+userId+"&email="+email
	    	movePage(null, url);
	    	return;
		    }
	    	movePage(null, "/home.do");	       		       	
	    });
	    
	</script>

        <!-- REVOLUTION SLIDER MAIN STYLESHEET -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/revolution/settings.css"/>">

        <!-- REVOLUTION SLIDER LAYERS AND NAVIGATION STYLES -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/revolution/layers.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/revolution/navigation.css"/>">


	
	<!-- Parallax -->
	<script src="<c:url value="/resources/js/parallax/jquery.parallax-1.1.3.js" />"></script>
	<script src="<c:url value="/resources/js/parallax/setting.js" />"></script>
	
	<!-- Custom javaScript for this theme -->
	<script src="<c:url value="/resources/js/custom.js" />"></script>
	
	<!-- Nicescroll -->
	<script src="<c:url value="/resources/js/nicescroll/jquery.nicescroll.min.js" />"></script>
	<script src="<c:url value="/resources/js/nicescroll/settings.js" />"></script>
	
	<!-- Theme option-->
	<script src="<c:url value="/resources/js/style-switcher/js/style-switcher.js" />"></script>
</head>
	<body>
	<%-- <input type="hidden" value="${resetPw}" id="resetPw" name="resetPw"/>
	<input type="hidden" name="userId" id="userId" value="${memberId}" />
    <input type="hidden" name="email" id="email" value="${email}" /> --%>
        <!-- START - Style Switcher -->
<!--         <i class="style-switcher-btn fa fa-cogs hidden-xs"></i>
        <div class="style-switcher animated fadeInRight">
            <div class="style-switcher-header">
                <div class="style-switcher-heading">Style Switcher</div>
                <div class="style-switcher-close"><i class="icon-close"></i></div>
            </div>
            <div class="style-switcher-body">
                Theme Colors
                <div class="style-switcher-heading">Theme Colors</div>
                <ul class="list-unstyled">
                    <li class="theme-orange theme-active" data-style="orange" data-header="light"></li>
                    <li class="theme-red" data-style="red" data-header="light"></li>
                    <li class="theme-dark-red" data-style="dark-red" data-header="light"></li>
                    <li class="theme-aqua" data-style="aqua" data-header="light"></li>
                    <li class="theme-blue" data-style="blue" data-header="light"></li>
                    <li class="theme-dark-blue last" data-style="dark-blue" data-header="light"></li>
                    <li class="theme-purple" data-style="purple" data-header="light"></li>
                    <li class="theme-brown" data-style="brown" data-header="light"></li>
                    <li class="theme-yellow" data-style="yellow" data-header="light"></li>
                    <li class="theme-light-green" data-style="light-green" data-header="light"></li>
                    <li class="theme-teal" data-style="teal" data-header="light"></li>
                    <li class="theme-green last" data-style="green" data-header="light"></li>
                </ul>
                <div class="style-switcher-heading">Header Color</div>
                <button type="button" class="btn-e btn-e-primary btn-sm margin-bottom-15 margin-right-10 header-light">Light</button>
                <button type="button" class="btn-e btn-e-primary btn-sm margin-bottom-15 header-dark">Dark</button>
            </div>
        </div> -->
        <!-- END - Style Switcher -->

        <!-- START - Top area -->
        <div class="top-container">
            <div class="container">
                <div class="top-column-left">
                    <ul class="contact-line">
                        <li><i class="fa fa-envelope"></i> darkonyx@naver.com</li>
                       
                        <li><i class="fa fa-phone"></i> 010-7678-8959</li>
                        
                    </ul>
                </div>
                <div class="top-column-right">
                	<%--
                    <div class="top-social-network">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                    </div>
                	 --%>
                    <ul class="register">
                    	<%--
                        <li class="dropdown language" style="display: block;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i> Languages</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">English <i class="fa fa-check"></i></a></li>
                                <li><a href="#">Spanish</a></li>
                                <li><a href="#">Russian</a></li>
                                <li><a href="#">German</a></li>
                            </ul>
                        </li>
                    	--%>                    
	                    
	                    <c:choose>
	                    	<c:when test='${sessionScope.memberId != null}'>
		                        <li><a href="javascript:movePage(this, '/member/goModify.do')">개인정보 수정</a></li>
	                    		<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
	                    	</c:when>
	                    	<c:otherwise>
		                   		<li><a href="javascript:movePage(this, '/mail/goEmail.do')">비밀번호 찾기</a></li>
		                    	<li><a href="javascript:movePage(this, '/member/goLoginPage.do')">로그인</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
                    </ul>
                </div>
            </div>
        </div>
        <!-- END - Top area -->

        <div class="clearfix"></div>
        
		<!-- START - Navbar -->
		<nav class="navbar navbar-default navbar-dark megamenu">
		    <div class="container">
		
		        <!-- Brand and toggle get grouped for better mobile display -->
		        <div class="navbar-header">
		            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
		                <i class="fa fa-bars"></i>
		            </button>
		            <a class="navbar-brand logo" href="<c:url value='/index.do'/>">
		                <img src="<c:url value="/resources/img/themes/logo-dark-red.png" />" alt="Logo" />
		            </a>
		        </div>
		
		        <!-- Collect the nav links, forms, and other content for toggling -->
		        <div class="collapse navbar-collapse" id="navbar-menu">
		            <ul class="nav navbar-nav navbar-right">
		            <c:if test="${sessionScope.memberType==9}">
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자</a>
		                    <ul class="dropdown-menu">
		                        <!-- <li>
		                            <a href="shop_home.html">Home Page</a>
		                        </li> -->
		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리메뉴</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="javascript:movePage(this, '/grid/goList.do')">회원 관리</a></li>
		                                <li><a href="<c:url value="/ecada.do"/>">템플릿 페이지</a></li>
		                                <li><a href="http://ec2-13-209-68-38.ap-northeast-2.compute.amazonaws.com:8080/potpole/index.do">테스트 페이지</a>
		                                <!-- <li><a href="shop_right_sidebar2.html">Right Sidebar 2</a></li> -->
		                            </ul>
		                        </li>
<!-- 		                        <li>
		                            <a href="shop_product.html">Product Page</a>
		                        </li>
		                        <li>
		                            <a href="shop_checkout.html">Checkout Page</a>
		                        </li>
		                        <li>
		                            <a href="shop_billing.html">Billing Page</a>
		                        </li> -->
		                    </ul>
		                </li></c:if>
		                <li class="active dropdown">
		                    <a href="<c:url value='/index.do'/>" class="dropdown-toggle" data-toggle="dropdown">홈</a>
		                </li>
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판</a>
		                    <ul class="dropdown-menu">
		                    	<li>
		                            <a href="javascript:movePage(this, '/notice/nList.do?typeSeq=1')">공지사항</a>
		                        </li>
		                        <li>
		                            <a href="javascript:movePage(this, '/free/fList.do?typeSeq=2')">자유게시판</a>
		                        </li>
		                        <li>
		                            <a href="javascript:movePage(this, '/video/goNlp.do?typeSeq=3')">영상게시판</a>
		                        </li>
<!-- 		                        <li>
		                            <a href="javascript:movePage(this, '/free/fList.do?typeSeq=2')">영상게시판</a>
		                        </li> -->
<!-- 		                        <li>
		                            <a href="javascript:movePage(this, '/free/fList.do?typeSeq=2')">상담게시판</a>
		                        </li> -->
		                    </ul>
		                </li>
		                
<!-- 		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">블로그</a>
		                    <ul class="dropdown-menu"> -->
<!-- 		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog Left</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="blog_left_sidebar.html">Blog Left 1</a></li>
		                                <li><a href="blog_left_sidebar2.html">Blog Left 2</a></li>
		                                <li><a href="blog_left_sidebar3.html">Blog Left 3</a></li>
		                                <li><a href="blog_left_sidebar4.html">Blog Left 4</a></li>
		                            </ul>
		                        </li>
		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog Right</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="blog_right_sidebar.html">Blog Right 1</a></li>
		                                <li><a href="blog_right_sidebar2.html">Blog Right 2</a></li>
		                                <li><a href="blog_right_sidebar3.html">Blog Right 3</a></li>
		                                <li><a href="blog_right_sidebar4.html">Blog Right 4</a></li>
		                            </ul>
		                        </li>
		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog Full Width</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="blog_no_sidebar.html">Blog Full Width 1</a></li>
		                                <li><a href="blog_no_sidebar2.html">Blog Full Width 2</a></li>
		                                <li><a href="blog_no_sidebar3.html">Blog Full Width 3</a></li>
		                            </ul>
		                        </li>
		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog Item Pages</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="blog_item_full_width.html">Full Width Page</a></li>
		                                <li><a href="blog_item_left_sidebar.html">Left Sidebar Page</a></li>
		                                <li><a href="blog_item_right_sidebar.html">Right Sidebar Page</a></li>
		                            </ul>
		                        </li>
 		                    </ul>
		                </li> -->
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">포트폴리오</a>
		                    <ul class="dropdown-menu">
<!-- 		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">No Space Boxed</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="portfolio_2_columns_grid_no_space.html">2 Columns</a></li>
		                                <li><a href="portfolio_3_columns_grid_no_space.html">3 Columns</a></li>
		                                <li><a href="portfolio_4_columns_grid_no_space.html">4 Columns</a></li>
		                            </ul>
		                        </li>
		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grid Boxed</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="portfolio_2_columns_grid.html">2 Columns</a></li>
		                                <li><a href="portfolio_3_columns_grid.html">3 Columns</a></li>
		                                <li><a href="portfolio_4_columns_grid.html">4 Columns</a></li>
		                            </ul>
		                        </li>
		                        <li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grid Text Boxed</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="portfolio_2_columns_grid_text.html">2 Columns</a></li>
		                                <li><a href="portfolio_3_columns_grid_text.html">3 Columns</a></li>
		                                <li><a href="portfolio_4_columns_grid_text.html">4 Columns</a></li>
		                            </ul>
		                        </li>-->
		                        <!-- <li>
		                            <a href="portfolio_left.html">사이트맵</a>
		                        </li> -->
 		                        <li>
		                            <a href="javascript:movePage(this, '/goDevNote.do')">개발노트</a>
		                        </li>
		                        <!-- <li>
		                            <a href="portfolio_single_item.html">Portfolio Single Item</a>
		                        </li> -->
		                    </ul>
		                </li>
<!-- 		                <li class="dropdown megamenu-fw">
 		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">컨텐츠</a>
		                    <ul class="dropdown-menu megamenu-content" role="menu">
		                        <li>
		                            <div class="row">
		                                <div class="col-menu col-md-3">
		                                    <h6 class="title">학술</h6>
		                                    <div class="content">
		                                        <ul class="menu-col">
		                                            <li><a href="shortcode_comp_call_to_action.html"><i class="fa fa-code"></i> 심리학</a></li>
		                                            <li><a href="shortcode_comp_parallax_counters.html"><i class="fa fa-calculator"></i> 수학</a></li> -->
<!-- 		                                            <li><a href="shortcode_comp_modal.html"><i class="fa fa-bars"></i> Modals</a></li>
		                                            <li><a href="shortcode_comp_blog_post_style.html"><i class="fa fa-edit"></i> Blog Post Style</a></li>
		                                            <li><a href="shortcode_comp_process_style.html"><i class="fa fa-hourglass-half"></i> Process Style</a></li>
		                                            <li><a href="shortcode_comp_team_style.html"><i class="fa fa-user"></i> Team Style</a></li>
		                                            <li><a href="shortcode_comp_pricing_tables.html"><i class="fa fa-shopping-cart"></i> Pricing Tables</a></li>
		                                            <li><a href="shortcode_comp_testimonials.html"><i class="fa fa-comments"></i> Testimonials</a></li> -->
<!-- 		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="col-menu col-md-3">
		                                    <h6 class="title">예술</h6>
		                                    <div class="content">
		                                        <ul class="menu-col">
		                                            <li><a href="shortcode_btn_general.html"><i class="fa fa-flask"></i> 문예</a></li>
		                                            <li><a href="shortcode_btn_brands.html"><i class="fa fa-html5"></i> 음악</a></li> -->
		                                            <!-- <li><a href="shortcode_btn_effects.html"><i class="fa fa-bolt"></i> Loading & Hover Effects</a></li>
		                                            <li><a href="shortcode_icon_general.html"><i class="fa fa-chevron-circle-right"></i> General Icons</a></li>
		                                            <li><a href="shortcode_icon_fa.html"><i class="fa fa-chevron-circle-right"></i> Font Awesome Icons</a></li>
		                                            <li><a href="shortcode_icon_line.html"><i class="fa fa-chevron-circle-right"></i> Line Icons</a></li>
		                                            <li><a href="shortcode_icon_glyph.html"><i class="fa fa-chevron-circle-right"></i> Glyphicons Icons (Bootstrap)</a></li> -->
<!-- 		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="col-menu col-md-3">
		                                    <h6 class="title">역술</h6>
		                                    <div class="content">
		                                        <ul class="menu-col">
		                                            <li><a href="shortcode_elem_accordion.html"><i class="fa fa-list-ol"></i> 주역</a></li>
		                                            <li><a href="shortcode_elem_tabs.html"><i class="fa fa-list-ol"></i> 관상</a></li>
		                                            <li><a href="shortcode_elem_tables.html"><i class="fa fa-table"></i> 수상</a></li> -->
		                                            <!-- <li><a href="shortcode_elem_progress_bars.html"><i class="fa fa-align-left"></i> Progress Bars</a></li>
		                                            <li><a href="shortcode_elem_form.html"><i class="fa fa-server"></i> Form Layouts</a></li>
		                                            <li><a href="shortcode_elem_google_maps.html"><i class="fa fa-map-marker"></i> Google Maps</a></li>
		                                            <li><a href="shortcode_elem_icon_boxes.html"><i class="fa fa-cubes"></i> Icon Boxes</a></li>
		                                            <li><a href="shortcode_elem_image_style.html"><i class="fa fa-picture-o"></i> Image Style</a></li> -->
<!-- 		                                        </ul>
		                                    </div>
		                                </div> -->
		                                <!-- <div class="col-menu col-md-3">
		                                    <h6 class="title">Typography</h6>
		                                    <div class="content">
		                                        <ul class="menu-col">
		                                            <li><a href="shortcode_typo_typography.html"><i class="fa fa-sort-alpha-asc"></i> Typography</a></li>
		                                            <li><a href="shortcode_typo_headings.html"><i class="fa fa-text-height"></i> Headings Options</a></li>
		                                            <li><a href="shortcode_typo_highlights.html"><i class="fa fa-pencil"></i> Highlights Options</a></li>
		                                            <li><a href="shortcode_typo_dropcaps.html"><i class="fa fa-font"></i> Dropcaps</a></li>
		                                            <li><a href="shortcode_typo_blockquote.html"><i class="fa fa-quote-left"></i> Blockquote Blocks</a></li>
		                                            <li><a href="shortcode_typo_pagination.html"><i class="fa fa-arrows-h"></i> Paginations</a></li>
		                                            <li><a href="shortcode_typo_list.html"><i class="fa fa-ellipsis-v"></i> List style</a></li>
		                                            <li><a href="shortcode_typo_dividers.html"><i class="fa fa-ellipsis-h"></i> Dividers</a></li>
		                                            <li><a href="shortcode_typo_alerts.html"><i class="fa fa-comment"></i> Alerts</a></li>
		                                            <li><a href="shortcode_typo_grid.html"><i class="fa fa-align-justify"></i> Grid Layouts</a></li>
		                                        </ul>
		                                    </div>
		                                </div> -->
<!-- 		                            </div>
		                        </li>
		                    </ul>
		                </li> -->
<!-- 		                <li><a href="page_contact.html">연락처</a></li> -->
		            </ul>
		        </div>
		    </div>
		</nav>
		<!-- END - Navbar -->
		
		
        <!-- START REVOLUTION SLIDER 5.0 -->
<!--         <div id="slider_container" class="rev_slider_wrapper">
            <div id="rev-slider" class="rev_slider" data-version="5.0">
                <ul>
                    <li data-transition="slideremovedown">
                        MAIN IMAGE
                        <img src="resources/img/slider/revolution/001.jpg" alt="" width="1920" height="600">
                        LAYER NR. 1
                        <div class="tp-caption captionHeadline1" id="slide-397-layer-1" data-x="center" data-y="top" data-voffset="152" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="500" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 8; white-space: nowrap;"><img src="resources/img/border_top.png" alt=""></div>
                        <div class="tp-caption captionHeadline1 highlight primary" id="slide-397-layer-2" data-x="center" data-y="top" data-voffset="200" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="500" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 7; white-space: nowrap;">Freelance designer</div>
                        <div class="tp-caption captionHeadline1" id="slide-397-layer-3" data-x="center" data-y="top" data-voffset="236" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="500" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 8; white-space: nowrap;"><img src="resources/img/border_bottom.png" alt=""></div>
                        LAYER NR. 3
                        <div class="tp-caption captionHeadline2" id="slide-397-layer-4" data-x="center" data-y="top" data-voffset="300" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="800" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="color: #fff;z-index: 7; white-space: nowrap;">Creative design</div>
                        LAYER NR. 3
                        <div class="tp-caption captionButtonlink hidden-xs" id="slide-399-layer-5" data-x="center" data-y="top" data-voffset="380" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1200" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 6; white-space: nowrap;"><a href="#" class="btn-e btn-e-primary">Learn more <i class="fa fa-plus"></i></a> <a href="#" class="btn-e">Our Work</a></div>
                    </li>

                    <li data-transition="slideremovedown">
                        MAIN IMAGE
                        <img src="resources/img/slider/revolution/002.jpg" alt="" width="1920" height="600">
                        LAYER NR. 1
                        <div class="tp-caption captionHeadline1" id="slide-397-layer-6" data-x="center" data-y="top" data-voffset="152" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 8; white-space: nowrap;"><img src="resources/img/border_top.png" alt=""></div>
                        <div class="tp-caption captionHeadline1 highlight purple" id="slide-397-layer-7" data-x="center" data-y="top" data-voffset="200" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 7; white-space: nowrap;">Art directions</div>
                        <div class="tp-caption captionHeadline1" id="slide-397-layer-8" data-x="center" data-y="top" data-voffset="236" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 8; white-space: nowrap;"><img src="resources/img/border_bottom.png" alt=""></div>
                        LAYER NR. 3
                        <div class="tp-caption captionHeadline2" id="slide-397-layer-9" data-x="center" data-y="top" data-voffset="300" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1500" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 7; white-space: nowrap;">Creative agency</div>
                        LAYER NR. 3
                        <div class="tp-caption captionButtonlink hidden-xs" id="slide-399-layer-10" data-x="center" data-y="top" data-voffset="380" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="2000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 6; white-space: nowrap;"><a href="#" class="btn-e btn-e-primary">Learn more <i class="fa fa-plus"></i></a> <a href="#" class="btn-e">Our Work</a></div>
                    </li>

                    <li data-transition="slideremovedown">
                        MAIN IMAGE
                        <img src="resources/img/slider/revolution/003.jpg" alt="" width="1920" height="600">
                        LAYER NR. 1
                        <div class="tp-caption captionHeadline1" id="slide-397-layer-11" data-x="center" data-y="top" data-voffset="152" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 8; white-space: nowrap;"><img src="resources/img/border_top.png" alt=""></div>
                        <div class="tp-caption captionHeadline1 highlight green" id="slide-397-layer-12" data-x="center" data-y="top" data-voffset="200" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 7; white-space: nowrap;">Web development</div>
                        <div class="tp-caption captionHeadline1" id="slide-397-layer-13" data-x="center" data-y="top" data-voffset="236" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 8; white-space: nowrap;"><img src="resources/img/border_bottom.png" alt=""></div>
                        LAYER NR. 3
                        <div class="tp-caption captionHeadline2" id="slide-397-layer-14" data-x="center" data-y="top" data-voffset="300" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1500" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 7; white-space: nowrap;">Creative team</div>
                        LAYER NR. 3
                        <div class="tp-caption captionButtonlink hidden-xs" id="slide-399-layer-15" data-x="center" data-y="top" data-voffset="380" data-width="['auto','auto','auto','auto']" data-height="['auto','auto','auto','auto']" data-transform_idle="o:1;" data-transform_in="x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-transform_out="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="2000" data-splitin="none" data-splitout="none" data-responsive_offset="on" style="z-index: 6; white-space: nowrap;"><a href="#" class="btn-e btn-e-primary">Learn more <i class="fa fa-plus"></i></a> <a href="#" class="btn-e">Our Work</a></div>
                    </li>
                </ul>
            </div> -->
            <!-- END REVOLUTION SLIDER -->
        </div>
        <!-- END OF SLIDER WRAPPER -->		
		
        <!-- 내용이 들어가는 div -->
        <div id="contentDiv" ></div><!-- style="background-color: #222222" -->

        <div class="clearfix"></div>

        <!-- START - Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="footer-description">
                            <img class="footer-logo" src="<c:url value="/resources/img/themes/logo-dark-red.png" />" alt="Footer logo" />
                            <span>나의 포트폴리오 커뮤니티,&nbsp;&nbsp;potpole.me</span>
                            <div class="widget" id="text-footer">
                                <p>- 이 페이지는 아래 항목을 이용하여 구현하였습니다.&nbsp;&nbsp;&nbsp;(클릭시 요약본으로 링크됩니다.)</p>
                            </div>
                        </div>
                        <div class="footer-details">
                            <ul class="list-unstyled footer-list">
                            <li >&nbsp;개발 환경</li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">JDK 1.8.4</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">IDE : Eclipse Photon</a></li>
                                <!-- <li><i class="fa fa-angle-double-right"></i><a href="#">테스트 : jUnit 4.12</a></li> -->
                                <li><i class="fa fa-angle-double-right"></i><a href="#">빌드 : Maven</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">형상관리 : SVN</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">DB : MySQL 5.7</a></li>
                                <!-- <li><i class="fa fa-angle-double-right"></i><a href="#">WAS : Tomcat 8.5</a></li> -->
                            </ul>
                            <ul class="list-unstyled footer-list">
                            <li>&nbsp;서버 환경</li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">AWS t2.micro free tier</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">OS : Ubuntu</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">Client : Putty SSH </a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">WAS : Tomcat 8.5</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">SVN server</a></li>
                                <!-- <li><i class="fa fa-angle-double-right"></i><a href="#">Nam libero tempore</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">Ecada terms</a></li> -->
                            </ul>
                            <ul class="list-unstyled footer-list">
                            <li>&nbsp;백엔드</li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">Java Basic</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">Spring Framework</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">myBatis 3.4.1</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">Log4j 1.2.17</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">jUnit 4.12</a></li>
                                <!-- <li><i class="fa fa-angle-double-right"></i><a href="#"></a></li> -->
                                <!-- <li><i class="fa fa-angle-double-right"></i><a href="#">Contact</a></li> -->
                            </ul>
                            <ul class="list-unstyled footer-list">
                            <li>&nbsp;프론트엔드</li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">jsp/html/jstl</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">jQuery 3.2.1</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">jqGrid 4.4.3</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">BootStrap</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">ajax</a></li>
                                <!-- <li><i class="fa fa-angle-double-right"></i><a href="#">Nam libero tempore</a></li>
                                <li><i class="fa fa-angle-double-right"></i><a href="#">Ecada terms</a></li> -->
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h5>스팸메일 보내기</h5>
                        <p>아래에 아무 내용을 입력해주시면 Spring Quartz 기능을 통해, 매년 오늘 날짜에 관리자의 메일로 그 내용이 전송됩니다.</p>
                        	익명성 보장! - 저지르기
                        <div class="input-group margin-bottom-20">
                            <input type="text" class="form-control" placeholder="Enter your 아무 덕담이나">
                            <span class="input-group-btn">
                                <button class="btn-e btn-e-primary" type="button"><i class="fa fa-send-o"></i></button>
                            </span>
                        </div>
                        <!-- END - Subscribe -->
                        <div class="footer-social-networks">
                            <!-- <a href="#"><i class="fa fa-facebook fa-2x icon-square"></i></a>
                            <a href="#"><i class="fa fa-twitter fa-2x icon-square"></i></a>
                            <a href="#"><i class="fa fa-google-plus fa-2x icon-square"></i></a>
                            <a href="#"><i class="fa fa-instagram fa-2x icon-square"></i></a>
                            <a href="#"><i class="fa fa-linkedin fa-2x icon-square"></i></a> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="subfooter">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 center">
                            <div class="footer-brand">
                                <p><a href="#">potpole.me</a> &copy; 2018 - All rights reserved.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- <ul class="list-inline sponsors-icons">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul> -->
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- END - Footer -->

        <!-- START - to top -->
        <a href="#" class="toTop">
            <i class="fa fa-chevron-up"></i>
        </a>
        <!-- END - to top -->
        
    </body>
</html>