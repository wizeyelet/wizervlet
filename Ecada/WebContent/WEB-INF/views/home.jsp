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
</head>
<body>

        <!-- START - Parallax counter -->
<!--         <div class="parallax bg6" style="background:url('resources/img/slider/revolution/015.jpg')">
            <div class="parallax-container">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row margin-top-30">
                                <div class="col-sm-6">
                                    <div class="icon-box box-default">
                                        <div class="icon-box-contain">
                                            <i class="fa fa-support fa-3x"></i>
                                            <h5>수업정리</h5>
                                            <p>
                                                수업중 작성된 에버노트 링크로 연결됩니다.
                                            </p>
                                            <p><a href="#" class="btn-e btn-e-primary btn-sm">Learn more +</a></p>
                                        </div>
                                        <i class="fa fa-user icon-bg"></i>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="icon-box box-default">
                                        <div class="icon-box-contain">
                                            <i class="fa fa-wrench fa-3x"></i>
                                            <h5>개발 계획</h5>
                                            <p>
                                                추후 개발 계획과 진척도, 운영방향을 소개합니다. 
                                            </p>
                                            <p><a href="#" class="btn-e btn-e-primary btn-sm">Learn more +</a></p>
                                        </div>
                                        <i class="fa fa-wrench icon-bg"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row margin-top-30">
                                <div class="col-sm-6">
                                    <div class="icon-box box-default">
                                        <div class="icon-box-contain">
                                            <i class="fa fa-image fa-3x"></i>
                                            <h5>프로젝트 정보</h5>
                                            <p>
                                                사용된 기술 및 개발과정이 소개되어 있습니다.
                                            </p>
                                            <p><a href="#" class="btn-e btn-e-primary btn-sm">Learn more +</a></p>
                                        </div>
                                        <i class="fa fa-image icon-bg"></i>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="icon-box box-default">
                                        <div class="icon-box-contain">
                                            <i class="fa fa-file-text-o fa-3x"></i>
                                            <h5>빠른 작성</h5>
                                            <p>
                                                바로 자유게시판에 글을 작성합니다.
                                            </p>
                                            <p><a href="#" class="btn-e btn-e-primary btn-sm">Learn more +</a></p>
                                        </div>
                                        <i class="fa fa-file-text-o icon-bg"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- END - Parallax counter -->


	<!-- START - Contain Wrapp -->
	<div class="contain-wrapp" style="padding:30px 0;">
	    <div class="container">
	        <div class="row">
	            <div class="col-xs-12">
	
<!-- 	                <h3>Welcome!!</h3> -->
	                <div class="row">
					    <div class="col-sm-6">
					        <h5>공지사항</h5>
				            <table class="table table-bordered">
				            	<colgroup>
			                		<col width="14%"/>
			                		<col width="60%" />
			                		<col width="26%" />
			                		<%-- <col width="13%"/> --%>
			                	</colgroup>
			                    <thead>
			                        <tr>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >글번호</th>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >제목</th>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >작성일</th>
			                            <!-- <th class="text-center">조회수</th> -->
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${noticeList}" var="i">
			                    		<tr>
				                            <td class="text-center">${i.boardSeq}</td>
				                            <td class="text-left"><a href="javascript:movePage(this, '/notice/read.do?typeSeq=1&amp;boardSeq=${i.boardSeq }')">${i.title}</a></td>
				                            <td class="text-center">
										<c:choose>
										<c:when test="${ dayOp<i.creatDate && i.createDate<dayEd }">
											<fmt:formatDate value="${ i.createDate }" pattern="HH:mm:ss"/>
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${ i.createDate }" pattern="yyyy-MM-dd"/>
										</c:otherwise>
										</c:choose>
											</td>
				                            <%-- <td align="center">${i.hits }</td> --%>
				                        </tr>
			                    	</c:forEach>
			                    </tbody>
			                </table>
					    </div>
					    <div class="col-sm-6">
					        <h5>자유게시판</h5>
				            <table class="table table-bordered">
				            	<colgroup>
			                		<col width="14%"/>
			                		<col width="56%" />
			                		<col width="15%" />
			                		<col width="15%"/>
			                	</colgroup>
			                    <thead>
			                        <tr>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >글번호</th>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >제목</th>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >글쓴이</th>
			                            <th class="text-center" style="background-color:#a10f2b; color:#FFFFFF;" >조회수</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${freeList}" var="i">
			                    		<tr>
				                            <td align="center">${i.boardSeq}</td>
				                            <td><a href="javascript:movePage(this, '/free/read.do?typeSeq=2&amp;boardSeq=${i.boardSeq }')">${i.title}</a></td>
				                            <td align="center">${i.memberNick }</td>
				                            <td align="center">${i.hits }</td>
				                        </tr>
			                    	</c:forEach>
			                    </tbody>
			                </table>
			                <div class="text-right">
			                	<a href="javascript:movePage(null, '/free/fList.do?typeSeq=2&page=1')">[더보기]</a>
			                </div>
					    </div>
					</div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- END - Parallax -->
</body>
</html>