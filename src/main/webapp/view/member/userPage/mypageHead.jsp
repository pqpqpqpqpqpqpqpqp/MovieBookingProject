<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}
	.user_mypage_head_info{
		display: flex;
		width: 980px;
	    height: 273px;
		margin: 0 auto;
		padding: 60px 40px 0 58px;
		background-color: #efefef;
	}
	.user_mypage_head_info .user_profile_img{
        display: flex; /* 중앙 정렬용 */
	    justify-content: center; /* 가로 중앙 */
	    align-items: center;
    	position: relative;
	    left: 0;
	    top: 0;
	    width: 135px;
   		height: 135px;
 		background: url(../images/common/bg/bg_photocircle03.png) 0 0 no-repeat;
 		border-radius: 50%;  		
		overflow: hidden;
		margin-right: 30px;
	}
	.user_mypage_head_info .user_profile_img img{		
		transform: scale(0.9);
	}
	
	.user_mypage_head_info .user_profile_info{
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		border-right: 1.5px solid #ddd;
		height: auto;
	}
	.user_mypage_head_info .user_profile_info .user_name_container{
	    width: 482px;
		border-bottom: 1.5px solid #ddd;
		padding-bottom: 20px;
		
	}
		.user_mypage_head_info .user_profile_info .user_name_container.member{
		margin-top: 20px;
		border-style: none;
		}
		
	.user_mypage_head_info .user_profile_info .user_name_container strong{
		font-size: 29px;
	    line-height: 32px;
		font-weight: 500;
	}
	.user_mypage_head_info .user_profile_info .user_name_container strong.user_name{
		
		margin-right: 10px;
	}
	strong.txt_purple{
		color: #943588 !important;
		text-decoration: underline;
	}
	.user_mypage_head_info .user_profile_info .user_name_container span.user_nickname{
		font-size: 14px;
		color: #342929;
   		font-weight: 600;
   		
	}
	.user_mypage_head_info .user_profile_info .user_name_container em{
		display: inline-block;
	    margin-right: 8px;
	    color: #342929;
	    font-weight: 500;
	}
		.user_mypage_head_info .user_profile_info .user_name_container button {
		    width: 17px;
		    height: 20px;
		    margin: 5px 0 0 0;
		    background: url('/MovieBookingProject/asset/icon/spriteBtn.png') no-repeat 0 -218px;
		    font: 0 / 0 a;
		    vertical-align: top;
		    zoom: 1;
	        margin-top: 10px;
	        border-style: none;
		}
		
		
</style>
</head>
<body>
	<div class="user_mypage_head_info">
		<div class="user_profile_img">
			<img  src="<%= request.getContextPath() %>/asset/img/member/userDefault.gif">
		</div>
		<div class="user_profile_info">
			<div class="user_name_container">
				<strong  class="user_name"><strong id="userName">홍길동</strong>님</strong>
				<em id="userId" class="user_id">hong123</em>
				<span  class="user_nickname">닉네임 : <span id="userNickname"></span>닉네임을 설정해주세요.</span>
				<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
			</div>
			<div class="user_name_container member">
				<strong>고객님은 <strong class="txt_purple">일반</strong>입니다.</strong>
			</div>
		</div>
	
	
	
	</div>

</body>
</html>