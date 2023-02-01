<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
	<title>bonjour noël</title>
    <link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<style>
.prod_icon.new{
    border-width: 1px;
    border-style: solid;
    border-color: #4f4f4f;
}

#sale_pay{
    font-size: 9.1px;
    text-decoration:line-through;
}

.ns-icon{
    margin-bottom: 20px;
    align-content: center;
}

.prod_icon.new {
    background: #4f4f4f;
    text-align: center;
    align-content: center;
}

.prod_icon {
    padding: 2px 8px;
    font-family: Helvetica, Arial, Sans-Serif;
    display: inline-block;
    text-align: center;
    color: #fff;
    font-size: 11px;
    vertical-align: middle;
    text-rendering: optimizeLegibility;
}

.prod_icon.sale, .prod_icon.timesale {
    background: #fe5356;
    border: 1px solid #fe5356;
}

#class_content{
    text-align: center;
    font-size: 17px;
    font-weight: normal;
}

.noMsg {
	width: 800px;
	margin: 0 auto;
	text-align: center;
	font-size: 35px;
	padding-bottom: 50px;
	border-bottom: 1px solid gray;
}

.warningMark {
	width: 800px;
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid gray;
	margin-top: 30px;
	padding-top: 50px;
}
</style>
<body>
<link rel="stylesheet" href="/resources/css/class/classList.css">

<jsp:include page="/WEB-INF/views/layouts/header.jsp" />



<!-- ////////////////////////////////////////////////////////////////// -->
<div class="storeList-content-wrap">
    <!-- 맛집 리스트 생성 -->
    <div class="storeList-list">
        <div class="storeList-list-content">
        
			<c:if test="${empty list }">
				<div class="warningMark">
					<span class="material-symbols-outlined" style="font-size: 70px;">
						error </span>
				</div>
				<div class="noMsg">${msg}</div>
			</c:if>
        
            <c:forEach items="${list}" var="s">
                <div class="showList">
                    <c:choose>
                    
                    <c:when test="${not empty sessionScope.m }">
                    <a href="/classReviewDetail?classReviewNo=${s.classReviewNo }&userId=${m.userId}">
                    </c:when>

                        <c:when test="${not empty sessionScope.o}">
                        <a href="/classReviewDetail?classReviewNo=${s.classReviewNo }&userId='mlolw2'">
                        </c:when>
                                <c:otherwise>
                                <a href="/classReviewDetail?classReviewNo=${s.classReviewNo }">
                                </c:otherwise>
                                </c:choose>
                                <div>
                                    <img src="resources/upload/classReview/${s.thumNail }">
                                </div>

                                <div id="font">
                                    <div style="display: none">${s.classReviewNo }</div>
                                    <div id = "class_content" style="text-align: center"> ${s.className }</div>
                                    <div id = "class_content" style="text-align: center"> ${s.classReviewName }</div>
                                </div>
                            </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- 페이지 네비 -->
    <div class="page">${pageNavi }</div>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>