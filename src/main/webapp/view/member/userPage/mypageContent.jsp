<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.mypage_body_container{
		width: 980px;
		height: auto;
		margin: 0 auto;
	}
	.mypage_body_container .mypage_index{
		width: 160px;
		float: left;
	}
	
	.mypage_body_container .mypage_index a{
		 width: 155px;
	    height: 34px;
	    line-height: 34px;
	    
        color: inherit;
   		text-decoration: none; 
	}
	ul, li {
		 list-style: none;
		 padding-left: 0;
	}
	
	.mypage_index > ul > li > a{ 
		display: block;
	    width: 155px !important; 
	    padding-left: 10px;
	    color: #222;
	    font-weight: 500;
	    font-size: 14px;
	    line-height: 34px;
	    margin: 10px 0;
	}
	.mypage_index ul li ul li > a {
		display: flex;
		align-items: center;
		width: 125px ;
	    height: 20px !important;
	    padding-left: 35px;
	    font-size: 12px;
	    line-height: 14px ;
	    white-space: nowrap;
	    letter-spacing: -0.02em;
	    font-weight: 400 ;
	    box-sizing: border-box;
	    color: #333 ;
  
	}
	 .mypage_index ul li ul li:hover > a{
	 	display: flex;
	 	align-items: center;
	 	height: 100%;
        background: url('/MovieBookingProject/asset/icon/menuHand.png') no-repeat 0 0;
    	background-position: 0px 5px;
    	color: #fb4357;
	}
	dl:after, ul:after, ol:after {
	    content: '';
	    clear: both;
	    display: block;
	}
	 .mypage_index > ul > li:hover > a{
    background-color: #fb4357;
    color: #fdfcf0;
}
</style>
</head>
<body>
	<div class="mypage_body_container">
		<div class="mypage_index">
			<ul>
				<li>
					<a>MY CGV HOME</a>		
					<i></i>		
				</li>
				<li>
					<a>나의 예매내역</a>	
					<ul>
						<li>
							<a href="#">신용카드 영수증 출력</a>
						</li>
						<li>
							<a href="#">CGV 영화관람권</a>
						</li>
					</ul>
				</li>
				<li>
					<a>회원정보</a>	
						<ul>
							<li>
								<a href="#">개인정보 설정</a>
							</li>
							<li>
								<a href="#">선택정보 설정</a>
							</li>
							<li>
								<a href="#">회원탈퇴</a>
							</li>
						</ul>			
				</li>
			</ul>				
		</div>
	</div>
</body>
</html>