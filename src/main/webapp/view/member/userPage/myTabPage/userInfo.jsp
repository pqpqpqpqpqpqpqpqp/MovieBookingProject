<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  
  <link rel="stylesheet"
		href="${pageContext.request.contextPath}/asset/css/mypage.css" />
<div class="member_info_change_container">
  <div ><strong class="member_info_title_txt">회원정보 수정</strong ></div>
  <p class="description">회원님의 소중한 정보를 안전하게 관리하세요.</p>
  	<div class ="member_spec_menu">
    	<div class="h2_tit">기본정보</div>
    	<div class="member_spec_menu_btn">
    		<button> 전체 정보 확인 및 수정</button>
    		<button> 회원탈퇴</button>
    	</div>
    </div>
  <div class="member_spec_info_box">
	    <div class="member_change_info_menu">
		    <label>이름</label>
		    <div class="spec_info_in_box">
		    	<div class="edit_box">
			    <input type="text" value="홍*동" disabled>
			    <button>변경하기</button>
			    </div>
			    <span>이름은 "개명"한 경우에만 변경 가능합니다.</span>
		    </div>
	    </div>
	    <div class="member_change_info_menu">
		    <label>아이디</label>
		    <input type="text" value="ho*******" disabled>
	    </div>
	    <div class="member_change_info_menu">
		    <label>생년월일</label>
		    <div class="spec_info_in_box">
		    	<div class="edit_box">
			    	<input type="text" value="**** - ** - **">
			    	<button>회원구분 확인하기</button>
			    </div>
		    </div>
		    
	    </div>
	    <div class="member_change_info_menu">
		    <label>휴대폰번호</label>
			    <div class="spec_info_in_box">
			    	<div class="edit_box">
					    <input type="text" value="010 - **** - 1234">
					    <button>변경하기</button>
					</div>
			    </div>
		    </div>	    
	    <div class="member_change_info_menu">
		    <label>비밀번호</label>
		    <button class="btn_edit">변경하기</button>
		</div>
	</div>

	<div class="edit_func_box">
		<button type="button" class="btn cancel" id="btn_cancel">취소</button>
		<button type="button" class="btn edit" id="btn_edit">수정</button>
	</div>
</div>
