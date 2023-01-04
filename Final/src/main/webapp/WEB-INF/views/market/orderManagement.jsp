<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/resources/css/product/myWishList.css">
<link rel="stylesheet" href="/resources/css/member/orderManagement.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<div class="content-wrap" style="height: 900px;">
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
				<div class="wish-form">
					<div class="bookmarkList-wrap">
						<div class="card">
							<div class="card-body">
								<div class="directoryDiv">mypage > 주문관리 > 주문상세</div>
								<br>
								<h4>주문상세</h4>
								<div class="category1">
									<a href="#" id="category_class">클래스</a>

									<%--            <a href="/myBookmarkList.do?bookMarkId=${sessionScope.o.ownerId }&reqPage=1" style="color: gold;"> --%>
									<a href="#" id="category_market">마켓</a>
								</div>

								<%-- <c:choose>
							<c:when test="${empty list }">
								<div class="warningMark">
									<span class="material-symbols-outlined"
										style="font-size: 30px;"> error </span>
								</div>

								<div class="noMsg">${msg }</div>
							</c:when>

							<c:otherwise> --%>
								<div class="bookmark-content-list">
									<form action="/searchOrderOwnerList.do?reqPage=1" method="post">
										<select name="type" style="width: 100px; height: 32px;">
											<option value="orderNo">주문번호</option>
											<option value="id">아이디</option>
										</select> <input type="text" name="keyword" style="height: 32px;">
										<input type="submit" value="조회"
											style="background-color: rgb(51, 51, 51); color: white; width: 40px;">
									</form>
									<table class="table"
										style="text-align: center; vertical-align: middle; margin-top: 20px;">
										<tr>
											<th scope="col">주문번호</th>
											<th scope="col">아이디</th>
											<th scope="col">상품명</th>
											<th scope="col">주문일자</th>
											<th scope="col">수량</th>
											<th scope="col">주문금액</th>
											<th scope="col">주문상태</th>
											<th scope="col">처리</th>
										</tr>
										<c:forEach items="${list }" var="ol">
											<tr>
												<td>${ol.orderNo}</td>
												<td>${ol.userId}</td>
												<td>${ol.prdName}</td>
												<td>${ol.orderDate}</td>
												<td>${ol.orderQuan}</td>
												<td>${ol.orderPrice}</td>

												<form
													action="/updateOrderLevel.do?orderNo=${ol.orderNo}&reqPage=1"
													method="post">
													<td class="orderStatusTd"><c:choose>
															<c:when test="${ol.orderStatus eq '배송준비중'}">
																<select name="orderStatus" class="selectbox">
																	<option value="배송준비중" selected>배송준비중</option>
																	<option value="배송중">배송중</option>
																	<option value="배송완료">배송완료</option>
																</select>
															</c:when>
															<c:when test="${ol.orderStatus eq  '배송중'}">
																<select name="orderStatus" class="selectbox">
																	<option value="배송준비중">배송준비중</option>
																	<option value="배송중" selected>배송중</option>
																	<option value="배송완료">배송완료</option>
																</select>
															</c:when>
															<c:when test="${ol.orderStatus eq '배송완료'}">
																<select name="orderStatus" class="selectbox">
																	<option value="배송준비중">배송준비중</option>
																	<option value="배송중">배송중</option>
																	<option value="배송완료" selected>배송완료</option>
																</select>
															</c:when>
														</c:choose></td>
													<td><button class="saveBtn" type="submit">확정</button></td>
												</form>
											</tr>
										</c:forEach>
									</table>
									<%-- 	<table  id="tb"  border="1" style="width:800px;">
										<thead>
											<tr>
												<td style="width: 20%;">상품명</td>
												<td style="width: 20%;">총재고</td>
												<td style="width: 20%;">판매수량</td>
												<td style="width: 20%;">남은재고</td>
											</tr>
										</thead>
										
										<tbody>
										<c:forEach items="${list }" var="list">
											<tr>
												<td>
													<input type="text" name="prdName" value="${prdName }" readonly>
													<input type="text" name="prdStock" value="${prdStock }" readonly>
													<input type="text" name="prdStock1" readonly>
													<input type="text" name="prdStock1" value="${prdStock }" readonly>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table> --%>
									<ul>
										<%--    <c:forEach items="${list }" var="bm">

                    <c:choose>
                       <c:when test="${not empty sessionScope.m }">
                          <li class="list"><a
                             href="/marketDetail.do?pNo=${bm.PNo }&bookMarkId=${sessionScope.m.memberId}">
                                <div class="bookmark-content">
                                   <div class="img-box">
                                      <img src="/resources/upload/market/${bm.PImg }" alt="">
                                   </div>

                                   <div class="bookmark-man">
                                      <ul>
                                         <li>${bm.PName }</li>
                                         <li>${bm.PPrice }</li>
                                      </ul>
                                   </div>
                                </div>
                          </a>
                             <div class="delBtn">
                                <button type="button" class="btn btn-danger"
                                   onclick="deleteBookmark(this,${bm.bmNo})">삭제</button>
                             </div></li>
                       </c:when>

                       <c:otherwise>
                          <li class="list"><a
                             href="/marketDetail.do?pNo=${bm.PNo }&bookMarkId=${sessionScope.o.ownerId}">
                                <div class="bookmark-content">
                                   <div class="img-box">
                                      <img src="/resources/img/${bm.PImg }" alt="">
                                   </div>

                                   <div class="bookmark-man">
                                      <ul>
                                         <li>${bm.PName }</li>
                                         <li>${bm.PPrice }</li>
                                      </ul>
                                   </div>
                                </div>
                          </a>
                             <div class="delBtn">
                                <button type="button" class="btn btn-danger"
                                   style="width: 80px;"
                                   onclick="deleteBookmark(this,${bm.bmNo})">삭제</button>
                             </div></li>
                       </c:otherwise>
                    </c:choose>

                 </c:forEach> --%>

									</ul>
								</div>
								<%-- </c:otherwise>
						</c:choose>
 --%>
								<div class="warningMark1" style="display: none;">
									<span class="material-symbols-outlined"
										style="font-size: 70px;"> error </span>
								</div>
								<div class="noMsg1" style="display: none;">아직 찜한 목록이 없습니다.</div>

								<div class="paging">
									<!-- <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
       chevron_left
       </span>
   </a>
   <a href="#"><span>1</span></a>
   <a href="#"><span>2</span></a>
   <a href="#"><span>3</span></a>
   <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
       chevron_right
       </span></a>  -->
									${pageNavi }

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

	<script type="text/javascript">
		function deleteBookmark(obj, bmNo) {
			if (confirm("삭제하시겠습니까?")) {
				$.ajax({
					url : "/deleteBookMarkNo.do",
					type : "post",
					data : {
						bmNo : bmNo
					},
					success : function(data) {
						console.log(data);
						$(obj).parent().parent().remove();
						console.log($(".list").length);
						if ($(".list").length == 0) {
							$(".bookmark-content-list").hide();
							$(".warningMark1").css("display", "block");
							$(".noMsg1").css("display", "block");
							$(".noMsg1").show();
							console.log($(".noMsg1").text());
							$(".paging").hide();

						}
					}
				})
			} else {
				console.log($(obj).text());
			}

		}
	</script>
</body>
</html>