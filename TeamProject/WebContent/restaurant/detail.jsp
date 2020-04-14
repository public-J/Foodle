<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
    <!--============================= TITLE =============================-->
    <section class="reserve-block">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>${mvo.rName }</h5>
                    <!-- <p><span>\\\</span>\\</p> -->
                    <p>
                    	<div class="stars-outer"> <!-- grey star -->
                    		<div class="stars-inner" style="width: ${mvo.rScore*20}%;"></div>  <!-- yellow star -->
                        </div>
                        &nbsp;| ${mvo.rScoreCount }명 참여
                    </p>
                    <p class="reserve-description">${strContent}</p>
                </div>
                <div class="col-md-6">
                    <div class="reserve-seat-block">
                    	<!-- <div class="wish-btn">
                    		<a href="#" class="btn btn-outline-danger ti-heart"></a>
                    	</div> -->
                        <div class="reserve-rating">
                            <span>${mvo.rScore }</span>
                        </div>
                        <div class="review-btn">
                            <a href="#" class="btn btn-outline-danger">리뷰 쓰기</a>
                        </div>
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="#" class="btn btn-danger">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END TITLE -->
    <!--============================= INFO =============================-->
    <section class="light-bg res_info_wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-8 responsive-wrap">
                    <!-- 음식점 사진 -->
                    <div class="res-photo">
                        <div class="photo">
							<c:forEach var="vo" items="${imageList }">
								<c:if test="${vo.iName=='Mainimage' }">
									<div class="main-img">
										<img src="${vo.iLink}" id="current" style="width: 730px; height: 550px;">
									</div>
								</c:if>
								<c:if test="${vo.iName!='Mainimage' }">
									<div class="imgs" style="display: inline-block;">
										<img src="${vo.iLink}" style="width: 142px; height: 100px;" title="${vo.iName }">
									</div>
								</c:if>
							</c:forEach>
						</div>
                    </div>
                    <!-- 사진 하단 음식점 소개 -->
                    <div class="res_intro_wrap">
                        <p>${svo.rContent }</p>
                    </div>
                    <!-- 상세정보 -->
                    <div class="detail_info my-4">
                        <div class="area_title">
                            <h5>상세정보</h5>
                        </div>
                        <table class="table">
                            <tbody>
                              <tr>
                                <th scope="row" width="20%">전화번호</th>
                                <td width="80%" colspan="3">${mvo.rTel }</td>
                              </tr>
                              <tr>
                                <th scope="row" width="20%">주소</th>
                                <td width="80%" colspan="3">${mvo.rAddr1 }<br>[새주소] ${mvo.rAddr2 }</td>
                              </tr>
                              <tr>
                                <th scope="row" width="20%">영업시간</th>
                                <td width="30%">${rvo.rOpentime }:00 ~ ${rvo.rClosetime }:00</td>
                                <th scope="row"width="20%">업종</th>
                                <td width="30%">${mvo.rType }</td>
                              </tr>
                              <tr>
                                <th scope="row" width="20%">휴일</th>
                                <td width="30%">매주 ${rvo.rHoliday }요일</td>
                                <th scope="row"width="20%">좌석/룸/기타</th>
                                <td width="30%">${rvo.rSeat }석/${rvo.rRoom }개</td>
                              </tr>
                              <tr>
                                <th scope="row" width="20%">주류판매</th>
                                <td width="30%">${svo.rDrink }</td>
                                <th scope="row" width="20%">금연석</th>
                                <td width="30%">${svo.rNosmoking }</td>
                              </tr>
                              <tr>
                                <th scope="row" width="20%">예약정보</th>
                                <td width="30%">${rvo.rReserve }</td>
                                <th scope="row" width="20%">배달/포장</th>
                                <td width="30%">${svo.rDelivery }/${svo.rTakeout }</td>
                              </tr>
                              <tr>
                                <th scope="row" width="20%">주차</th>
                                <td width="30%">${svo.rPark }</td>
                                <th scope="row" width="20%">기타시설</th>
                                <td width="30%">${svo.rOther }</td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                    <!-- 사용자 리뷰 -->
                    <div class="user_review_wrap">
                        <div class="area_title">
                            <h5>리뷰</h5>
                        </div>
                        <div class="review_wrap">
                            <div class="customer-review-avg">
                                <div class="area_grade col-md-4">
                                    <p>사용자 총 평점</p>
                                    <div class="star_avg">
                                        <div class="stars-outer"> <!-- grey star -->
                                            <div class="stars-inner" style="width: 86%;"></div>  <!-- yellow star -->
                                        </div>
                                    </div>
                                    <p><span>4.5 / 5</span></p>
                                </div>
                                <div class="area_reviewNo col-md-4">
                                    <p>전체 리뷰 수</p>
                                    <img src="../images/dialog.png">
                                    <p><span>34</span></p>
                                </div>
                            </div>
                            <hr>
                            <div class="customer-review_wrap">
                                <div class="customer-img">
                                    <img src="../images/customer-img0.png" class="img-fluid" alt="#">
                                    <p>산호다</p>
                                    <span>35 Reviews</span>
                                </div>
                                <div class="customer-content-wrap">
                                    <div class="customer-content">
                                        <div class="customer-review">
                                            <h6>만족</h6>
                                            <!-- (old) 별점 이미지-->
                                            <!-- <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span class="round-icon-blank"></span> -->
                                            <!-- (new) 별점 이미지 -->
                                            <div class="stars-outer"> <!-- grey star -->
                                                <div class="stars-inner" style="width: 86%;"></div>  <!-- yellow star -->
                                            </div>
                                            <p>2015/09/22</p>
                                        </div>
                                        <div class="customer-rating">4.3</div> <!-- 점수 -->
    
                                    </div>
                                    <p class="customer-text">남자친구랑 신사동 놀러갔다가 들린곳인데~ 피자가 고소하고 쫄깃쫄깃 너무 맛있었어요~
                                    </p>
                                    <ul>
                                        <li><img src="../images/review-img1.jpg" class="img-fluid" alt="#"></li>
                                        <li><img src="../images/review-img2.jpg" class="img-fluid" alt="#"></li>
                                        <li><img src="../images/review-img3.jpg" class="img-fluid" alt="#"></li>
                                    </ul>
                                    <span>28명이 이 리뷰가 도움이 되었다고 응답했습니다.</span>
                                    <a href="#"><span class="icon-like"></span>도움이 됐어요</a>
                                </div>
                            </div>
                            <hr>
                            <div class="customer-review_wrap">
                                <div class="customer-img">
                                    <img src="../images/customer-img0.png" class="img-fluid" alt="#">
                                    <p>어흥흥흥</p>
                                    <span>17 Reviews</span>
                                </div>
                                <div class="customer-content-wrap">
                                    <div class="customer-content">
                                        <div class="customer-review">
                                            <h6>화덕피자 좋아하시는 분들에게 추천!!</h6>
                                             <!-- (old) 별점 이미지-->
                                            <!-- <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span class="round-icon-blank"></span> -->
                                            <!-- (new) 별점 이미지 -->
                                            <div class="stars-outer"> <!-- grey star -->
                                                <div class="stars-inner" style="width: 80%;"></div>  <!-- yellow star -->
                                            </div>
                                            <p>2015/09/10</p>
                                        </div>
                                        <div class="customer-rating customer-rating-red">4.0</div>
                                    </div>
                                    <p class="customer-text">화덕피자 진짜 좋아하는뎅~>< 여기 너무 맛있어요! 화덕향도 나고 치즈도 듬뿍올라가서 좋아요~!</p>
                                    <span>10명이 이 리뷰가 도움이 되었다고 응답했습니다.</span>
                                    <a href="#"><span class="icon-like"></span>도움이 됐어요</a>
                                </div>
                            </div>
                            <hr>
                            <div class="customer-review_wrap">
                                <div class="customer-img">
                                    <img src="../images/customer-img0.png" class="img-fluid" alt="#">
                                    <p>어흥흥흥</p>
                                    <span>17 Reviews</span>
                                </div>
                                <div class="customer-content-wrap">
                                    <div class="customer-content">
                                        <div class="customer-review">
                                            <h6>화덕피자 좋아하시는 분들에게 추천!!</h6>
                                             <!-- (old) 별점 이미지-->
                                            <!-- <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span class="round-icon-blank"></span> -->
                                            <!-- (new) 별점 이미지 -->
                                            <div class="stars-outer"> <!-- grey star -->
                                                <div class="stars-inner" style="width: 80%;"></div>  <!-- yellow star -->
                                            </div>
                                            <p>2015/09/10</p>
                                        </div>
                                        <div class="customer-rating customer-rating-red">4.0</div>
                                    </div>
                                    <p class="customer-text">화덕피자 진짜 좋아하는뎅~>< 여기 너무 맛있어요! 화덕향도 나고 치즈도 듬뿍올라가서 좋아요~!</p>
                                    <span>10명이 이 리뷰가 도움이 되었다고 응답했습니다.</span>
                                    <a href="#"><span class="icon-like"></span>도움이 됐어요</a>
                                </div>
                            </div>
                            <hr>
                            <div class="customer-review_wrap">
                                <div class="customer-img">
                                    <img src="../images/customer-img0.png" class="img-fluid" alt="#">
                                    <p>어흥흥흥</p>
                                    <span>17 Reviews</span>
                                </div>
                                <div class="customer-content-wrap">
                                    <div class="customer-content">
                                        <div class="customer-review">
                                            <h6>화덕피자 좋아하시는 분들에게 추천!!</h6>
                                             <!-- (old) 별점 이미지-->
                                            <!-- <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span class="round-icon-blank"></span> -->
                                            <!-- (new) 별점 이미지 -->
                                            <div class="stars-outer"> <!-- grey star -->
                                                <div class="stars-inner" style="width: 80%;"></div>  <!-- yellow star -->
                                            </div>
                                            <p>2015/09/10</p>
                                        </div>
                                        <div class="customer-rating customer-rating-red">4.0</div>
                                    </div>
                                    <p class="customer-text">화덕피자 진짜 좋아하는뎅~>< 여기 너무 맛있어요! 화덕향도 나고 치즈도 듬뿍올라가서 좋아요~!</p>
                                    <span>10명이 이 리뷰가 도움이 되었다고 응답했습니다.</span>
                                    <a href="#"><span class="icon-like"></span>도움이 됐어요</a>
                                </div>
                            </div>
                            <hr>
                            <div class="customer-review_wrap">
                                <div class="customer-img">
                                    <img src="../images/customer-img0.png" class="img-fluid" alt="#">
                                    <p>어흥흥흥</p>
                                    <span>17 Reviews</span>
                                </div>
                                <div class="customer-content-wrap">
                                    <div class="customer-content">
                                        <div class="customer-review">
                                            <h6>화덕피자 좋아하시는 분들에게 추천!!</h6>
                                             <!-- (old) 별점 이미지-->
                                            <!-- <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span class="round-icon-blank"></span> -->
                                            <!-- (new) 별점 이미지 -->
                                            <div class="stars-outer"> <!-- grey star -->
                                                <div class="stars-inner" style="width: 80%;"></div>  <!-- yellow star -->
                                            </div>
                                            <p>2015/09/10</p>
                                        </div>
                                        <div class="customer-rating customer-rating-red">4.0</div>
                                    </div>
                                    <p class="customer-text">화덕피자 진짜 좋아하는뎅~>< 여기 너무 맛있어요! 화덕향도 나고 치즈도 듬뿍올라가서 좋아요~!</p>
                                    <span>10명이 이 리뷰가 도움이 되었다고 응답했습니다.</span>
                                    <a href="#"><span class="icon-like"></span>도움이 됐어요</a>
                                </div>
                            </div>
                            <hr>
                            <div class="page">
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous"> 
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item active">
                                        <span class="page-link">2
                                            <span class="sr-only">(current)</span>
                                        </span>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next"> 
                                            <span aria-hidden="true">&raquo;</span> 
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 responsive-wrap"> 
                    <!-- 예약 -->
                    <div class="reservation">
                        <div class="area_title">
                            <h5>예약</h5>
                        </div>
                        <div class="reserve_wrap">
                            <ul>
                                <li class="menu">
                                    <label for="menu" class="reserve_tit">메뉴 선택</label>
                                    <select id="menu" class="custom-select" name=""> 
                                    	<option value="">메뉴를 선택하세요.</option>
                                    	<c:forEach var="vo" items="${menuList }">
                                    		 <option value="">${vo.mName }</option>
                                    	</c:forEach>
                                      </select>
                                </li>
                                <li class="reserve_date">
                                    <label for="menu" class="reserve_tit">예약일</label>
                                    <input type="text" class="form-control" name="" id="reservation_date" title="" maxlength="8"
                                     autocapitalize="off" placeholder="예약일자" autocomplete="off">
                                </li>
                                <a href="#" class="btn btn-outline-danger btn-reserve">예약하기</a>
                            </ul>
                        </div>
                    </div>
                    <!-- 지도 -->

                    <div class="contact-info mt-4">
                        <div class="area_title">
                            <h5>위치</h5>
                        </div>
                        <!-- 카카오맵 -->
                        <!-- <div class="map-wrap">
                            <div class="map-fix">
                                <div id="map" data-lat="40.674" data-lon="-73.945" data-zoom="14" 
                                style="width: 500px; height: 400px;"></div>
                            </div>
                        </div> -->
                        <!-- 카카오맵 -->
                        <div class="contact_wrap">
		                    <div id="map" data-lat="40.674" data-lon="-73.945" data-zoom="14" 
		                    	style="width: 350px; height: 250px;">
		                    </div>
                            <!-- <img src="../images/map.jpg" class="img-fluid" alt="#"> -->
                        <div class="address">
                            <span class="icon-location-pin"></span>
                            <p id="addr">${mvo.rAddr1 }</p>
                        </div>
                        <div class="address">
                            <span class="icon-screen-smartphone"></span>
                            <p>${mvo.rTel }</p><br>
                        </div>
                        <!-- <div class="address">
                            <span class="icon-clock"></span>
                            <p>Mon - Sun 09:30 am - 05:30 pm <br>
                                <span class="open-now">OPEN NOW</span></p>
                        </div> -->
                        <!-- <a href="#" class="btn btn-outline-danger btn-contact">메시지 보내기</a> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END INFO -->

    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src="../js/jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="../js/swiper.min.js"></script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>
    <script>
        if ($('.image-link').length) {
            $('.image-link').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
        if ($('.image-link2').length) {
            $('.image-link2').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
    </script>
    <!-- Image Gallery Vanilla JavaScript-->
    <script type="text/JavaScript" src="js/detail_imageGallery.js"></script>

    <!-- jQuery Datepicker UI for reservation date -->
    <script src="../js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="../js/jquery-ui-1.12.1/datepicker-ko.js"></script>
    <script>
        $( function() {
        $( "#reservation_date" ).datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0"
        });
        } );
    </script>


    <!-- 이전에 남아있던 map 관련 소스 : 파악 중 -->
    <script>
        $(".map-icon").click(function() {
            $(".map-fix").toggle();
        });
    </script>

    <!-- Kakao Map Script -->
   <script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);
    </script>
    
    
    <!-- 주소로 지도 찾기 -->
    <script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var addr=$('#addr').text();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
		console.log(addr);
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${mvo.rName}</div>'
	        });
	        infowindow.open(map, marker); 
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>

</body>

</html>
