<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<!--  주변 맛집 페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/nearby.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
//$( document ).ready(function() {
	
 	//$('#openBut').on( "click",function() { //=> 특정 태그에 이벤트 작성시 document.ready(function()을 정의한 곳 안에서 정의해야한다. or INSIDE any FUNCTION.
		//$('#openBut').removeClass("openButtBefore");
	//	$('#openBut').addClass("openButtAfter");
//	}); 
//});




/* 
 $('.del').onClick(
			function(){
				alert(1);
			}		 
		 );
*/
 var sortInfo =''; 		//정렬순 선택 
 var restOpen =''; 		//가게 오픈 여부
 var takeoutInfo =''; 	//테이브아웃 여부
 var lowPrice='';      //낮은 가격순
 //*******append기능 없애고 미리 만들어놓은 자리<p></p>에 해당 카테고리 값이 들어가게 변경함!
 // 두 가지의 선택시 이벤트 기능 
 // 첫번째 setFilter() => 카테고리에서 선택시 중복 선택x, 카테고리중 한개의 옵션만 아래  해당 카테고리<p>자리에 출력됨
 // 두번째 openButChgCL() => 옵션의 유무가 2개여서 버튼 형식으로 변경, 버튼을 누르면 색의 유무로 사용자가 선택유무 알수있음,따로 아래 출력 되지 않음!


 $(document).ready(function(){

	 
	 $.ajax({
			
			type:'post',
			url:'/TeamProject/restaurant/list_nearby_default.do', //이 주소를 찾아서 실행해 , 서버주소 파일의 경로가 아닌 프로젝트의 풀 주소
			//디폴트 페이지 띄우는 것이기 때문에 data는 보낼 것이 없다!  
			success:function(res){
			
				$('#nearbyList').html(res);
			
			}
			
		})

	});
 
 
 
 function setFilter(c ,op){ //선택한 카테고리를 아래 출력 기능, 클릭하므로써 아래 페이지가 변하니까 결국 클릭하지 않으면 저절로 디폴트 페이지가 되는것이다.구현필요)
	 console.log("===========");
	 console.log(op);  //op=> <select> onChange 매개변수 => foodType
	 	
	 	var selectVal = c.value; //onchange된 옵션의 value값을 읽는다 => 값을 읽어 selectOp에서 
	 	var selectOp = '#'+op;   //각각의 카테고리에 parameter값과 아래 출력되는 곳<p id"#~">의 id을 동일하게 주어 네임이 일치하는 경우 선택된 옵션이 아래 <p>의 해당 카테보리 자리에 출력되게 하기위함!! 
	 	
	 	//if 1: 업종카테고리를 선택 시 '전체'이면 ''로 foodTypeOp에 출력되지 않음!,아니면 foodTypeOp에 선택된 값이 들어감
		if( op == 'foodType')
		{ 

			//전체일때는 null값을 보내야 전체리스트가 나오니까
			if(selectVal == '업종전체'){      //전체를 누르면 null로 처리되어(아래서 커테고리당 한개만 on)  foodTypeOp에 어떤 것도 담기지 않음 => 결과적으로 매퍼에서 null이 되므로 
				$('#foodTypeOp').val('');  //null값을 foodTypeOp 자리에 넣어				
				
				
			}else{
				$('#foodTypeOp').val(c.value); //c는 onchange되어 바뀐 값 => c.value=> 바뀐 tag의 value속성 값을 가져옴 => "전체", "한식" , "일식", "양식" ..을 foodTypeOp에 넣어
			

				$(selectOp).html("<a onClick=deleteFilter(this) href='#' id='"+c.value+"' class='selected nearbyselected' data-filter-name='food_cat' data-filter-value='108602' data-nclick-code='rcc.reset'"
				         +"data-filter-action='nclick' title='"+c.value+"'>"+c.value+"<span class='del'>X</span></a>");
			
			
			}
			
		
		
		}
		else if(op == 'sortby')
		{ //if 2: parameter로 받은 값이 sortyby
			//랭킹 카테고리 선택할때 어떤값으로 order by 하기위해서
			//컬럼을 선택해야함
			
				if(selectVal == '랭킹순'){
					
					sortInfo ='rest_rno';
					
					
				}else if(selectVal == '조회순'){
					
					sortInfo ='rest_open';
					
				}else if(selectVal == '평점순'){
					
				
					sortInfo ='rest_grade';
					
				}else if(selectVal == '낮은가격순'){
					
					 lowPrice='menu_price';
					
				}else if(selectVal == '높은가격순'){
					
					sortInfo='menu_price';
					
				}
				
				$(selectOp).html("<a onClick=deleteFilter(this) href='#' id='"+c.value+"' class='selected nearbyselected' data-filter-name='food_cat' data-filter-value='108602' data-nclick-code='rcc.reset'"
				         +"data-filter-action='nclick' title='"+c.value+"'>"+c.value+"<span class='del'>X</span></a>");
			
		
		}
		else{
/* 			if( op == 'foodType'){
				//foodType일때만 여러개가 들어오게 append 함수처리
		 		$(selectOp).append("<a onClick=deleteFilter(this) href='#' id='"+c.value+"' class='selected nearbyselected' data-filter-name='food_cat' data-filter-value='108602' data-nclick-code='rcc.reset'"
				         +"data-filter-action='nclick' title='"+c.value+"'>"+c.value+"<span class='del'>X</span></a>");
				var foodTypeOpVal = $('#foodTypeOp').val();
				if(foodTypeOpVal ==""){
					$('#foodTypeOp').val(c.value);
				}else{
					$('#foodTypeOp').val(foodTypeOpVal+","+c.value);
				}
				
			}else{
				//foodType이 아닌 다른애들은 하나씩만 나오게해야하니까 엎어치는 html함수처리
		 		$(selectOp).html("<a onClick=deleteFilter(this) href='#' id='"+c.value+"' class='selected nearbyselected' data-filter-name='food_cat' data-filter-value='108602' data-nclick-code='rcc.reset'"
				         +"data-filter-action='nclick' title='"+c.value+"'>"+c.value+"<span class='del'>X</span></a>");
			} */
			
			//선택된 옵션들을 위에서 이미 selectOp에 
			$(selectOp).html("<a onClick=deleteFilter(this) href='#' id='"+c.value+"' class='selected nearbyselected' data-filter-name='food_cat' data-filter-value='108602' data-nclick-code='rcc.reset'"
			         +"data-filter-action='nclick' title='"+c.value+"'>"+c.value+"<span class='del'>X</span></a>");
		
		
	 	}
		searchNearby();
};
	


// 선택된 버튼 없애기
function deleteFilter(v){
	var tihsId = "#"+v.id;
	$(tihsId).remove();
	
	
	
	
};






//선택한 카테고리의 정보가 담긴 foodTypeOp을 통해 아래에 ajax로 값을 뿌려주는 FUNCTION!
function searchNearby(){ 
	//type_name = 양식 or 중식 or 일식 중 한개 값 넘어감
		var foodList = $('#foodTypeOp').val();
	//alert('restOpen > '+restOpen);
	
	$.ajax({
	
		type:'post', //post방식(hide parameter)
		url:'/TeamProject/restaurant/list_nearby_result.do', //이 주소를 찾아서 실행해 , 서버주소 파일의 경로가 아닌 프로젝트의 풀 주소
		data:{"type_name":foodList,"rest_open":restOpen,"sortby_col":sortInfo,"lowPrice_col":lowPrice,"takeout_col":takeoutInfo}, //위 url 주소로 보낼 건데, 데이터는 key와 value로 보내고, 위 url(~.do)에서 value를  
		success:function(res){//0또는 1의 값을 가지는 res => db연동후 디폴트 기능 구현 필요
			
			//console.log(res);
			$('#nearbyList').html(res);
		}
	})
};




function openButChgCL(){
	
	//var cateThisId = "#"+n.id;
	
	var nowClass = $('#openBut').attr("class");//현재버튼의 클래스상태(css)
	//var nowClass = $(cateThisId).attr("class");//현재버튼의 클래스상태(css)
	//alert(nowClass);
	
	if(nowClass=="openButtBefore"){//선택전클래스
		//그럼 선택전css를 없애고 선택후 css를 class에 준다
		$('#openBut').removeClass("openButtBefore");
		$('#openBut').addClass("openButtAfter");
		//선택을하면 open됐다는 걸 밸류값줌
		restOpen = 'Y';
	}else{
		//선택후 상태임
		//그럼 선택후css를 없애고 선택전 css를 class에 준다
		$('#openBut').removeClass("openButtAfter");
		$('#openBut').addClass("openButtBefore");
		//선택해제하면 값을 null처리
		restOpen = '';
	}
	
	searchNearby();
	//css변경 및 오픈체크 변수 설정을 다하고 리스트 검색하는 ajax를 콜함
}





function takeoutButChgCL(){
	
	//var cateThisId = "#"+n.id;
	
	var nowClass = $('#takeoutBut').attr("class");//현재버튼의 클래스상태(css)
	//var nowClass = $(cateThisId).attr("class");//현재버튼의 클래스상태(css)
	//alert(nowClass);
	
	if(nowClass=="openButtBefore"){//선택전클래스
		//그럼 선택전css를 없애고 선택후 css를 class에 준다
		$('#takeoutBut').removeClass("openButtBefore");
		$('#takeoutBut').addClass("openButtAfter");
		//선택을하면 open됐다는 걸 밸류값줌
		takeoutInfo = 'Y';
	}else{
		//선택후 상태임
		//그럼 선택후css를 없애고 선택전 css를 class에 준다
		$('#takeoutBut').removeClass("openButtAfter");
		$('#takeoutBut').addClass("openButtBefore");
		//선택해제하면 값을 null처리
		takeoutInfo = '';
	}
	searchNearby(); 
	//css변경 및 오픈체크 변수 설정을 다하고 리스트 검색하는 ajax를 콜함
}

/* 
$('#openBut').on( "click",function() {
	  alert( "클릭" );
	}); */

</script>
   

</head>
<body>
    <!--============================= LIST =============================-->
    <form action="">
    <section class="list-block">
    
     	<!-- ============================================주변맛집 전체화면============================================ -->
        <div class="container-fluid py-4 container py-5">
			<div class="row nearbyrow">

				<!-- ======================================주변맛집 페이지 왼쪽 화면============================================= -->
				<div class="col-md-7 responsive-wrap nearbymd7">
					<!-- ===================================검색 결과 타이틀 "~ 주변 검색 결과" ===================================-->
					<h5 class="styled-heading">Best Places near 주변 맛집 ###</h5>
					
					<p>
						총 <span>###개</span>
					</p>
					<!-- ============================================카테고리!!============================================= -->

<!-- <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" class="icon_svg">
												<path d="M8 10.5a1 1 0 0 1-.7-.29l-3.06-3a1 1 0 1 1 1.41-1.42L8 8.1l2.35-2.31a1 1 0 0 1 1.41 1.42l-3.06 3a1 1 0 0 1-.7.29z"></path></svg></span> -->

					<div class="mt-4">
					
						<div class="filter_row area">
							<div class="category">
							
								<!-- <button onclick="searchNearby()">test</button> -->


								<!-- 업종선택 버튼 - setFilter() 사용! -->
								<select  class="menuarrow" onchange="setFilter(this ,'foodType' ),searchNearby() ;" style="color: black;">
									<option value="업종전체" class="lemonmenu">업종전체</option>
									<option value="한식" class="lemonmenu">한식</option>
									<option value="일식" class="lemonmenu">일식</option>
									<option value="중식" class="lemonmenu">중식</option>
									<option value="카페" class="lemonmenu">카페</option>
									<option value="베이커리" class="lemonmenu">베이커리</option>
									<option value="패스트푸드" class="lemonmenu">패스트푸드</option>
									<option value="양식" class="lemonmenu">양식</option>
									<option value="뷔페" class="lemonmenu">뷔페</option>
									<option value="기타" class="lemonmenu">기타/세계</option>
								</select> 
								
								
								<!-- 정렬선택 버튼 - setFilter() 사용! -->
								<select class="menuarrow" onchange="setFilter(this,'sortby' ),searchNearby();">
									<option value="정렬안함" class="lemonmenu">정렬순</option>
									<option value="랭킹순" class="lemonmenu">랭킹순</option>
									<option value="평점순" class="lemonmenu">평점순</option>
									<option value="조회순" class="lemonmenu">조회순</option>
									<option value="낮은가격순" class="lemonmenu">낮은가격순</option>
									<option value="높은가격순" class="lemonmenu">높은가격순</option>
								</select> 

			
								<%--    
								<!-- 가격순선택 버튼 - setFilter() 사용!-->
								<select class="menuarrow" onchange="setFilter(this, 'price');">
									<option value="가격전체" class="lemonmenu">가격순</option>
																</select> 
								--%>
					
								<!--  아래 button type으로 변경!
								<select  title="현재오픈" class="menuarrow select7" onchange="setFilter(this);">
									<option value="현재오픈" class="lemonmenu">현재오픈</option>
								</select>  -->
								
								<!-- 가게오픈 유무 버튼 - openButChgCL()사용  -->
								<button id="openBut" class="openButtBefore" onclick="openButChgCL();">현재오픈</button>
								
								<!--아래 button type으로 변경! 
								<select title="TakeOut" class="menuarrow" onchange="setFilter(this);">
									<option value="테이크아웃" style="display: none;">테이크아웃</option>
								</select> -->
								<button id="takeoutBut" class="openButtBefore" onclick="takeoutButChgCL();">테이크아웃</button>

							</div><!-- div category 끝!! -->

							<!-- ========================================카테고리 끝 =============================================== -->
					
							<!--================================= 선택한 옵션 출력 부분!!=========================================-->
							<!--  각 카테고리마다 각각의 정의된 자리에 출력되기! -->
							<div class="selected_filter mt-2 displaymenu" id="test2">
							<p id="foodType"></p>
							<p id="sortby"></p>
							<p></p>
							<p></p>
							
							<!-- #foodTypeOp를 읽어들여 선택된값들을 model로 보내기 위함! -->
							<input type='text' id='foodTypeOp' value='' /> <!--  hidden="" 추가하기 -->
							
								<!-- 
                        <a href="#" class="selected" data-filter-name="food_cat" data-filter-value="108602" data-nclick-code="rcc.reset"
                            data-filter-action="nclick" title="양식">강남역<span class="del">X</span></a>
                        <a href="#" class="selected" data-filter-name="food_cat" data-filter-value="108602" data-nclick-code="rcc.reset"
                            data-filter-action="nclick" title="양식">양식<span class="del">X</span></a>
                        <a href="javascript:deleteFilter(this);" class="selected" data-filter-name="food_cat" data-filter-value="108602" data-nclick-code="rcc.reset"
                            data-filter-action="nclick" title="양식">카페/술집<span class="del">X</span></a>
                             -->
                             
							</div>


						<!-- ================================가게 1개 =============================================-->  

        
                   <div class="row light-bg detail-options-wrap pt-3 nearbysearchlist" id="nearbyList"></div>
               
    	<%--			
    	          <c:if test="${defList != ''}">
					 <c:forEach var="i" items="${defList }" >  
    
								
                        <div class=" featured-responsive" >
                            <div class="featured-place-wrap" >
                                <a href="main.jsp?mode=5">
                   
                   
                   <!--  =======================그림 부분 시작 ============================= -->
                                	<div class="featured-title-box">
                                   	 <img src="${pageContext.request.contextPath }/images/featured1.jpg" class="img-fluid" alt="#">
                                    </div>
                                    <span class="featured-rating">6.5</span>
                    <!--  =======================그림 부분  끝============================= -->
                    
                    
                   <!--  =======================요약설명  시작============================= -->
                         
                                    <div class="featured-title-box">
                                        <h6> rno: ${i.rest_rno } DEFAULT</h6>
                                        <p>${i.type_name} </p> <span>• </span>
                                        <p>테이크아웃- ${i.takeout_col }</p> <span> • </span>
                                        <p><span>${i.menu_price }</span>\</p>
                                        <ul>
                                            <li><span class="icon-location-pin"></span>
                                                <p>${i.rest_adress }</p>
                                            </li>
                                            <li><span class="icon-screen-smartphone"></span>
                                                <p>평점순 - ${i.rest_grade }</p>
                                            </li>
                                        </ul>
                                        <div class="bottom-icons">
                                            <div class="closed-now">CLOSED NOW</div>
                                            <span class="ti-heart"></span>
                                        </div>
                                    </div>
                   <!--  =======================요약설명  끝 ============================= -->                  
                                    
                                </a>
                            </div>
                        </div>
                        
                	</c:forEach>
                </c:if>	     
             --%>
					<!-- ===============================가게 한개 끝!=================================== -->
				
						</div>
					</div>
					<!--============================= KAKAO MAP ============================= -->
					<div class="col-md-5 responsive-wrap map-wrap nearbymapwrap">
						<div class="map-fix nearbymapfix">
							<div id="map" data-lat="40.674" data-lon="-73.945" data-zoom="14"></div>
						</div>
					</div>
				</div>

			</div>


		</div>
        </div>
    </section>
   </form> 
    
    <!--//END DETAIL -->
    
    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

    <!-- 이전에 남아있던 map 관련 소스 :  파악 중 -->
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
</body>
</html>