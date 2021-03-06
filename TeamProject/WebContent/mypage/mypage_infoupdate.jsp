<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 무조건 입력하게 하는 속성값을 쓰려면 5.0버전으로 만들어줘야함 기본 4.0으로 되어있음 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
  <!--============================= SINGUP =============================-->
  <section class="singup-block light-bg">
    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-md-6 mb-4">
          <h5>회원가입</h5>
        </div>
      </div>
      
      <!-- ============================== Start of signup_frm ============================== -->
      <form name="signup_frm" action="../mypage/infoupdate_ok.do" method="post" id="signup_frm">
      <!-- START OF SIGNUP INFO INPUTS -->
      <div class="row justify-content-center">
        <div class="col-md-6 signup">
          <!-- 회원 유형 선택 : 개인/기업 -->
          <div class="member_type mb-3">
            <ul class="member_category">
              <li class="on">
                <!-- 클릭 시 on으로 변경 -->
                <h2 class="tab01 mb-0">
                  <a href="signup.do?usertype=person" class="tab_btn">개인정보 수정</a>
                </h2>
              </li>
            </ul>
          </div>
          
          <!-- 회원정보 입력 : 필수정보-->
          <div class="cont_division">
          	<!-- 회원유형 (hidden) -->
          	<input type="hidden" name="utype" value="user">
            <ul class="write_base select_input">
              <!-- ID (N-N) -->
              <li class="item must">
                <label for="user_id" class="tit_inp"><span class="essential">*</span>ID</label>
                <input type="text" name="id" id="user_id" autocapitalize="off" autocomplete="off"
                  placeholder="" style="background-color:#E2E2E2" value="${vo.userid }" readonly>
              </li>
              <!-- Password (N-N) -->
              <li class="item must">
                <label for="user_pwd" class="tit_inp"><span class="essential">*</span>비밀번호</label>
                <input type="password" name="pwd" id="user_pwd" autocapitalize="off"
                  placeholder="비밀번호" required>
              </li>
              <!-- 이름 (N-N)-->
              <li class="item must">
                <label for="user_nm" class="tit_inp"><span class="essential">*</span>이름</label>
                <input type="text" name="name" id="user_name" autocapitalize="off" autocomplete="off"
                  placeholder="" style="background-color:#E2E2E2" value = "${vo.uname }" readonly >
                <p class="alert_column warning_txt hidden" id="user_name_msg" name="user_nm_msg">필수정보 입니다.</p>
              </li>
              <!-- 성별  -->
              <input type="hidden" name="gender" id="user_gender_male" value="${vo.ugender }">
             
              <!-- 생년월일 (N-N ) -->
              <li class="item must">
                <div class="select_align_row">
                  <label for="birth_date" class="tit_inp"><span class="essential">*</span>생년월일</label>
                  <input type="text" name="birth" id="user_birth" title="사용자 출생년도" maxlength="8"
                    autocapitalize="off" placeholder="" class="che" autocomplete="off" style="background-color:#E2E2E2" value="${vo.ubirth }" readonly>
                </div>
                <p class="alert_column warning_txt hidden" id="user_birth_msg" name="cyr_msg">&nbsp;</p>
              </li>
              <!-- 이메일 (N-N)-->
              <li class="email_column item must">
                <div class="select_align_row input item">
                  <label for="email_id" class="tit_inp"><span class="essential">*</span>이메일</label>
                  <input type="text" name="email" id="user_email" style="ime-mode:inactive" placeholder="" autocomplete="off" value="${vo.uemail }" required>

                </div>
                <!-- Start of 자동리스트 영역 : 아직 구현 안 했음  -->
                <ul class="auto_list_area email_list" style="display:none;">
                  <li class="auto_list"><a href="javascript:emailKeyAction;" onclick="return false;" class="email_domain"><strong
                        class="txt_input"></strong>@naver.com</a></li>
                  <li class="auto_list"><a href="javascript:emailKeyAction;" onclick="return false;" class="email_domain"><strong
                        class="txt_input"></strong>@gmail.com</a></li>
                  <li class="auto_list"><a href="javascript:emailKeyAction;" onclick="return false;" class="email_domain"><strong
                        class="txt_input"></strong>@daum.net</a></li>
                  <li class="auto_list"><a href="javascript:emailKeyAction;" onclick="return false;" class="email_domain"><strong
                        class="txt_input"></strong>@nate.com</a></li>
                  <li class="auto_list"><a href="javascript:emailKeyAction;" onclick="return false;" class="email_domain"><strong
                        class="txt_input"></strong>@outlook.com</a></li>
                </ul>
                <!-- End of 자동리스트 영역 -->
                <p class="alert_column warning_txt hidden" id="sms_msg_email1" name="msg_email1">이메일 주소를 다시 확인해주세요.</p>    
              </li>
              
            </ul>
          </div>

          <!-- 비밀번호 힌트 질문 및 답변 -->
          <div class="cont_division">
            <ul class="hint">
              <!-- 비밀번호 힌트 질문 -->
              <li class="item must">
                <label for="user_hint" class="tit_inp"><span class="essential">*</span>비밀번호 힌트 질문</label>
                <select  name="pwd_hint" id="user_pwd_hint" class="custom-select" required>
                  <option value="">질문을 선택하세요.</option>
                  <option value="place">기억에 남는 추억의 장소는?</option>
                  <option value="motto">자신의 인생 좌우명은?</option>
                  <option value="treasure">자신의 보물 제 1호는?</option>
                  <option value="teacher">가장 기억에 남는 선생님의 성향은?</option>
                  <option value="date">추억하고 싶은 날짜가 있다면?</option>
                  <option value="friend">유년시절 가장 생각나는 친구 이름은?</option>
                </select>
                <p class="alert_column warning_txt hidden" name="user_hint_msg" id="user_hint_msg" >필수정보 입니다.</p>
              </li>
              <!-- 비밀번호 힌트 질문 답 -->
              <li class="item must">
                <label for="user_hintAns" class="tit_inp"><span class="essential">*</span>비밀번호 힌트 질문 답</label>
                <input type="text" name="pwd_hintAns" id="user_pwd_hintAns" autocapitalize="off"
                  placeholder="" required>
                <p class="alert_column warning_txt hidden" id="user_hintAns_msg" name="user_hintAns_msg">필수정보 입니다.</p>
              </li>
            </ul>
          </div>

          <!--  회원정보 입력 : 선택항목 -->
          <div class="cont_division">
            <ul class="write_base select_input">
              <!-- 휴대폰번호 (NULL) -->
              <li class="">
                <div class="input_collect item">
                  <label for="sms_cellnum" class="tit_inp fullsize_input except">연락처</label> <!-- 입력시 on class 삭제 -->
                  <input type="text" name="cellnum" id="user_cellnum"  placeholder="'-' 없이 입력" maxlength="11" value=${vo.uphone }>
                </div>
                <p class="alert_column warning_txt hidden" name="msg_phone" id="sms_phone_msg" style="display: block;">휴대폰번호가
                  올바르지 않습니다.</p>
              </li>
              <!-- 집 전화번호 (NULL) -->
              <li class="">
                <div class="input_collect item">
                  <label for="sms_cellnum" class="tit_inp fullsize_input except">집 전화번호</label> <!-- 입력시 on class 삭제 -->
                  <input type="text" name="telnum" id="user_telnum" placeholder="'-' 없이 입력" maxlength="11" value=${vo.utel }>
                </div>
              </li>            
              <!-- 주소(우편번호) (NULL) -->
              <li class="adress_column item">
                  <div class="adress_domestic _searchArea">
                      <label for="address_main" id="address" class="tit_inp">주소</label>
                      <input type="text" name="address_main" id="address_main" class="" readonly="1" placeholder="우편번호/주소"
                      onclick="zipcode()" value="${vo.uaddr1 }">
                      <!-- hidden으로 우편번호 받는다 -->
                      <input type="hidden" name="postcode" id="postcode" value="${vo.upost }">
                  </div>
                  <p class="alert_column warning_txt hidden" id="msg_addr">&nbsp;</p>
              </li>
              <!-- 주소 (상세주소) (NULL) -->
              <li class="item">
                  <label for="address_detail" class="tit_inp">상세 주소</label>
                  <input type="text" name="address_detail" id="address_detail" class="" maxlength="50" placeholder="상세 주소" value="${vo.uaddr2 }">
                  <input type="hidden" name="address_extra"value="" id="address_extra">
              </li>
            </ul>
          </div>
          
        </div>
      </div>
      <!-- END OF INFO INPUT-->
      
      <!-- 회원가입 버튼 -->
      <div class="row justify-content-center">
        <div class="col-md-6 pt-4">
          <div class="signup-btn-wrap">
        	<input type="submit" value="정보수정" class="btn btn-danger" id="sendBtn">
          </div>
        </div>
      </div>
      
      </form>
      <!-- ============================== End of signup_frm ============================== -->
      
      <div class="row justify-content-center mt-2">
        <div class="signup-bottom col-md-6">
          <p class="message">
            <span class="essential">*</span>은 필수 입력 항목입니다. 
          </p>
        </div>
      </div>
    </div>
    </div>
    </section>
    <!--//END SINGUP  -->

  <!-- jQuery, Bootstrap JS. -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>

  <!-- jQuery Datepicker UI for birthdate -->
  <script src="../js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="../js/jquery-ui-1.12.1/datepicker-ko.js"></script>
  <script>
    $( function() {
      $( "#user_birth" ).datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0"
      });
    } );
  </script>

  <!-- Kakao zipcode -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function zipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address_extra").value = extraAddr;
                
                } else {
                    document.getElementById("address_extra").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address_main").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address_detail").focus();
            }
        }).open();
    }
</script>

</body>

</html>