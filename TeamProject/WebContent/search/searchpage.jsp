<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="main-block light-bg" id="popular">
  <div class="container">
	<div class="row">
		<c:forEach var="vo" items="${list }"><!-- 형식만해놓은것 -->
		  <div class="col-md-4 featured-responsive">
		    <div class="featured-place-wrap">
		      <a href="#">
		        <img src="${vo.ivo.iLink }" class="img-fluid" alt="#">
		        <span class="featured-rating">${vo.rScore }</span>
		        <div class="featured-title-box">
		          <h6>${vo.rName }</h6>
		          <p>${vo.rType }</p> <span>• </span>
		          <p>리뷰 ${vo.rScoreCount }</p> <span> • </span>
		          <fmt:parseNumber var="sre" value="${vo.rScore }" integerOnly="true"/>
		          <c:choose>
		            <c:when test="${sre=='5' }">
		              <p><span>★★★★★</span></p>
		            </c:when>
		            <c:when test="${sre=='4' }">
		              <p><span>★★★★</span>★</p>
		            </c:when>
		            <c:when test="${sre=='3' }">
		              <p><span>★★★</span>★★</p>
		            </c:when>
		            <c:when test="${sre=='2' }">
		              <p><span>★★</span>★★★</p>
		            </c:when>
		            <c:when test="${sre=='1' }">
		              <p><span>★</span>★★★★</p>
		            </c:when>
		            <c:otherwise>
		              <p><span></span>★★★★★</p>
		            </c:otherwise>
		          </c:choose>
		          <!-- <p><span>★★★★</span>★</p> -->
		          <ul>
		            <li><span class="icon-location-pin"></span>
		              <p>${vo.rAddr1 }</p>
		            </li>
		            <li><span class="icon-screen-smartphone"></span>
		              <p>${vo.rTel }</p>
		            </li>
		          </ul>
		          <div class="bottom-icons">
		            <div class="closed-now">CLOSED NOW</div>
		            <span class="ti-heart"></span>
		          </div>
		        </div>
		      </a>
		    </div>
		  </div>
		</c:forEach>
	</div>
	<div class="mt-3">
	  <nav aria-label="...">
		<ul class="pagination justify-content-center">
			<c:if test="${startPage>1 }">
			    <li class="page-item">
			      <a class="page-link" aria-label="Previous" href="../search/searchpage.do?page=${startPage-1 }">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			</c:if>
			<c:set var="type" value=""/>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
			  <c:if test="${curPage==i }">
			    <c:set var="type" value="class=\"page-item active\""/>
			  </c:if>
			  <c:if test="${curPage!=i }">
			    <c:set var="type" value="class=page-item"/>
			  </c:if>
			  <li ${type }>
			    <a class="page-link" href="../search/searchpage.do?page=${i }">${i }</a>
			  </li>
			</c:forEach>
			<c:if test="${endPage<allPage }">
			  <li class="page-item">
				<a class="page-link" href="../search/searchpage.do?page=${endPage+1 }" aria-label="Next"> 
				  <span aria-hidden="true">&raquo;</span> 
				  <span class="sr-only">Next</span>
				</a>
			  </li>
			</c:if>
		</ul>
	  </nav>
    </div>
  </div>
</section>
<!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</body>
</html>