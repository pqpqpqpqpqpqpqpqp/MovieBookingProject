<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="No-Cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="viewport" content="width=1024" />
    <meta name="keywords" content="CGV, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cgv, cgv, 예매, 상영작" />
    <meta name="description" content="영화 그 이상의 다양한 몰입의 경험을 만듭니다. DEEP DIVE SPACE, CGV" />
    <meta property="og:site_name" content="깊이 빠져 보다, CGV"/>
    <meta id="ctl00_og_title" property="og:title" content="무비차트 &lt; 무비차트 | 깊이 빠져 보다, CGV"></meta>


    <!-- 각페이지 Header Start--> 
    
    <!--/각페이지 Header End--> 
    <script type="text/javascript">
        //<![CDATA[
        _TRK_CP = "/영화/무비차트/무비차트";

        app.config('staticDomain', 'https://img.cgv.co.kr/R2014/')
            .config('imageDomain', 'https://img.cgv.co.kr/')
            .config('isLogin', 'False');

        
        // AD FLOAT
        // 암호화 할 문자열과 키값(상수값)을 매개변수로 받는다.
        function EncryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // key 값을 원하는 대로 연산을 한다
                output += String.fromCharCode(str.charCodeAt(i) + parseInt(key) + 123 + i);
            }
            return output;
        }
        // 복호화
        // 암호화 된 문자열과 키값(상수값)을 매개변수로 받는다.
        function DecryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // 암호화시 사용한 연산과 같아야 한다.
                output += String.fromCharCode(str.charCodeAt(i) - (parseInt(key) + 123 + i));
            }

            return output;
        }

        function getCookieVal(offset) {
            var endstr = document.cookie.indexOf(";", offset);
            if (endstr == -1) endstr = document.cookie.length;
            return unescape(document.cookie.substring(offset, endstr));
        }
        function GetCookieAd(name) {
            var arg = name + "=";
            var alen = arg.length;
            var clen = document.cookie.length;
            var i = 0;
            while (i < clen) { //while open
                var j = i + alen;
                if (document.cookie.substring(i, j) == arg)
                    return getCookieVal(j);
                i = document.cookie.indexOf(" ", i) + 1;
                if (i == 0) break;
            } //while close
            return null;
        }
        function setCookieAD(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setTime(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000));
            document.cookie = name + "=" + escape(value) + "; expires=" + todayDate.toGMTString() + "; path=/; domain=cgv.co.kr";
        }
        function CloseAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("../index.html");

            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);
            var CookieUrl = ArrAdUrl[3];

            CookieUrl = EncryptAD(CookieUrl, "15442280");
            setCookieAD(CurCookieName, CookieUrl, '1');
            $(document).find('#ad_float1').hide();
        }
        function OpenAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("../index.html");
            var CookieUrl = ArrAdUrl[3];
            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);

            if (CurCookieUrl == null) {
                CurCookieUrl = "";
            }
            else {
                CurCookieUrl = DecryptAD(CurCookieUrl, "15442280");
            }

            if (CurCookieUrl.indexOf(CookieUrl) != -1) {
                $(document).find('#ad_float1').hide();
            }

            //section.cgv.co.kr 매거진 체크
            var magazineckurl = GetCookieAd("CgvPopAd-magazine");
            if (magazineckurl != null) {
                var magazineck = DecryptAD(magazineckurl, "15442280");
                if (magazineck != null && magazineck == "magazine") {
                    //값이있는경우 표시하지않음
                    $(document).find('#ad_float1').hide();
                }
            }
        }

        

        //]]>
    </script>
    

    
</head>

<body class="">

<script type="text/javascript">
    $(document).ready(function () {
        $('.nav_menu > li > h2 > a').on({
            mouseenter: function (e) {
                var target = e.target;
                $(target).parents('.nav_menu').find('.nav_overMenu').slideDown(function () {
                    $('.nav').addClass('active');
                });
            },
            click: function (e) {
                var target = e.target;
                if (!$('.nav').hasClass('active')) {
                    $(this).trigger('mouseenter');
                } else {
                    $('.nav').trigger('mouseleave');
                }
            }
        });

        $('.nav').on({
            mouseleave: function (e) {
                $(this).find('.nav_overMenu').slideUp(200, function () {
                    $('.nav').removeClass('active');
                });
            }
        });

        $('.totalSearch_wrap input[type=text]').on({
            focusin: function () {
                $('.totalSearch_wrap').addClass("active");
            }
        });

        $('#totalSearch').on({
            'focusout': function (e) {
                let relatedTargetTagName = $(e.relatedTarget).get(0).tagName || null;

                if (relatedTargetTagName !== "BUTTON") {
                    $('.totalSearch_wrap').removeClass("active");
                    //$(this).focus();
                }
            },
        });

        $('.btn_totalSearchAutocomplete_close').on({
            click: function (e) {
                $('.totalSearch_wrap').removeClass("active");
            },
            focusout: function (e) {
                let isFocus = $(e.relatedTarget).parents().hasClass('totalSearchAutocomplete_wrap');

                if (!isFocus) {
                    $('.totalSearch_wrap').removeClass("active");
                    //$(this).focus();
                }
            }
        });


        //------------------end----------------------- [@,.o]>

        $('.nav').on({
            mouseleave: function (e) {
                $(this).find('.nav_overMenu').slideUp(200, function () {
                    $('.nav').removeClass('active');
                });
            }
        });

        $('.totalSearch_wrap input[type=text]').on({
            focusin: function () {
                $('.totalSearch_wrap').addClass("active");
            }
        });

        $('#totalSearch').on({
            'focusout': function (e) {
                let relatedTargetTagName = $(e.relatedTarget).get(0).tagName || null;

                if (relatedTargetTagName !== "BUTTON") {
                    $('.totalSearch_wrap').removeClass("active");
                    //$(this).focus();
                }
            },
        });

        $('.btn_totalSearchAutocomplete_close').on({
            click: function (e) {
                $('.totalSearch_wrap').removeClass("active");
            },
            focusout: function (e) {
                let isFocus = $(e.relatedTarget).parents().hasClass('totalSearchAutocomplete_wrap');

                if (!isFocus) {
                    $('.totalSearch_wrap').removeClass("active");
                    //$(this).focus();
                }
            }
        });

        $(this).on({
            scroll: function (e) {
                /* S GNB fixed */
                var headerOffsetT = $('.header').offset().top;
                var headerOuterH = $('.header').outerHeight(true);
                var fixedHeaderPosY = headerOffsetT + headerOuterH;
                var scrollT = $(this).scrollTop();
                var scrollL = $(this).scrollLeft();

                if (scrollT >= fixedHeaderPosY) {
                    $('.nav').addClass('fixed');
                    $('.fixedBtn_wrap').addClass('topBtn');
                } else {
                    $('.nav').removeClass('fixed');
                    $('.fixedBtn_wrap').removeClass('topBtn');
                }

                /* S > GNB fixed 좌우 스크롤
                Description
                - GNB가 fixed 되었을때 좌우 스크롤 되게 처리
                */
                if ($('.nav').hasClass('fixed')) {
                    $('.nav').css({ 'left': -1 * scrollL })
                } else {
                    $('.nav').css({ 'left': 0 })
                }
                /* E > GNB fixed 좌우 스크롤 */
                /* S GNB fixed */
            }
        });

        $('.btn_gotoTop').on({
            click: function () {
                $('html, body').stop().animate({
                    scrollTop: '0'
                }, 400);
            }
        });

        //통합검색 상단 검색 버튼
        $('#btn_header_search').on('click', function () {
           
            if ($('#header_ad_keyword').val() != "")
                goSearch($('#header_ad_keyword'));      //광고
            else
                goSearch($('#header_keyword'));

            
            return false;
        });

        //통합검색 검색어 입력창
        $('#header_keyword').keyup(function (e) {
            if (e.keyCode == 13) goSearch($('#header_keyword'));
        });

         //검색 입력창 클릭 시 광고값 reset
        $('#header_keyword').on('click', function () {
            // 24.03 홈페이지 內 검색 영역 광고 텍스트 미노출의 件
            $(this).val('');
           // $(this).attr('placeholder', '');
            $('#header_ad_keyword').val('');
        });

    });

    function setListFocus(swiper, selector) {
            let snapIdx = swiper.snapIndex;
            let snapGridTotalIdx = swiper.snapGrid.length - 1;
            let slideGridTotalLen = swiper.slidesGrid.length;
            let slidesPerView = swiper.passedParams.slidesPerView;


            swiper.slides.each(function (idx) {
                if (selector === 'a') {
                    if (snapIdx === snapGridTotalIdx) {
                        let lastCount = slideGridTotalLen - (slidesPerView - (slideGridTotalLen % slidesPerView)) - 1;

                        if (idx >= lastCount) {
                            //console.log(idx);
                            $(this).find(selector).attr('tabindex', 0);
                        } else {
                            $(this).find(selector).attr('tabindex', -1);
                        }
                    } else {
                        if (idx >= snapIdx * slidesPerView && idx < snapIdx * slidesPerView + slidesPerView) {
                            $(this).find(selector).attr('tabindex', 0);
                        } else {
                            $(this).find(selector).attr('tabindex', -1);
                        }
                    }
                } else {
                    if (idx >= snapIdx * slidesPerView && idx < snapIdx * slidesPerView + slidesPerView) {
                        $(this).find(selector).attr('tabindex', 0);
                    } else {
                        $(this).find(selector).removeAttr('tabindex');
                    }

                    if (snapIdx === 0) {
                        if (idx === 0) {
                            // console.log($(this).children(selector).get(0))
                        }
                    } else if (snapIdx === snapGridTotalIdx) {
                        $(".event_list .swiper-slide:last-child").children(selector).focus();
                    }
                }
            });
        }

    //통합검색
    function goSearch($objKeyword) {
        alert
        if ($objKeyword.val() == "") {
            alert("검색어를 입력해 주세요");
            $objKeyword.focus();
            return false;
        }

        //GA 검색로그
        gaEventLog('PC_GNB', '검색', $objKeyword.val());
        location = "/search/?query=" + escape($objKeyword.val());
    }



</script>
           <!-- Contents Start -->
         

<!--  무비차트 부분 -->
<!-- 실컨텐츠 시작 -->
    <div class="wrap-movie-chart">
        <!-- Heading Map Multi -->
        <div class="tit-heading-wrap">
            <h3>무비차트</h3>
           
            <div class="submenu">
                <ul>
                    <li class="on"><a href="index.html" title="선택">무비차트</a></li>
                    <li><a href="pre-movies.html">상영예정작</a></li>
                    <!--<li><a href="/movies/?lt=3">CGV아트하우스</a></li>//-->
                </ul>
            </div>
        </div>
        <!-- //Heading Map Multi -->
        <!-- Sorting -->

        <div class="sect-sorting">
             <div class="nowshow">
                        <input type="checkbox" id="chk_nowshow"  title="현재 선택됨" checked/>
            
                <label for="chk_nowshow">현재 상영작만 보기</label>                
            </div>
            <label for="order_type" class="hidden">정렬</label>
            <select id="order_type" name="order-type">
            <option title="현재 선택됨" selected value="1">예매율순</option>
                <option value="2">평점순</option>
                <option value="3">관람객순</option>
            </select>
            <button type="button" class="round gray"><span>GO</span></button>
        </div>
        <!-- //Sorting -->
        
        <div class="sect-movie-chart">
            <h4 class="hidden">
                무비차트 - 예매율순
            </h4>
            <ol>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.1</strong>   
                        <a href="detail-view/indexf512.html?midx=89568">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89568/89568_320.jpg" alt="파과 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!-- <span class="ico-grade 15">15</span> -->
                            </span>
                            
                        </a>
                        <span class="screentype">
                            
                        </span>
                    </div>
                    
                    <div class="box-contents">
                        <a href="detail-view/indexf512.html?midx=89568">
                            <strong class="title">파과</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>4.0%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>93%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.04.30 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index8334.html?MOVIE_CD=20040877&amp;MOVIE_CD_GROUP=20040877">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.2</strong>   
                        <a href="detail-view/index739e.html?midx=89454">
                            <span class="thumb-image">
                                <img src='https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20130122_180%2F1358819064231daPKK_JPEG%2Fmovie_image.jpg' alt="야당 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age18">18</i>
                                <!-- <span class="ico-grade 18">18</span> -->
                            </span>
                            
                        </a>
                        <span class="screentype">
                            
                                <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
                            
                        </span>
                    </div>
                    
                    <div class="box-contents">
                        <a href="detail-view/index739e.html?midx=89454">
                            <strong class="title">야당</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>3.4%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>97%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.04.16 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index0a95.html?MOVIE_CD=20040389&amp;MOVIE_CD_GROUP=20040389">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.3</strong>   
                        <a href="detail-view/indexb3a2.html?midx=80500">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80500/80500_320.jpg" alt="플로리다 프로젝트 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!-- <span class="ico-grade 15">15</span> -->
                            </span>
                            
                        </a>
                        <span class="screentype">
                            
                                <a class="arthouse" href="#" title="아트하우스 상세정보 바로가기" data-regioncode="MovieCollage">아트하우스</a>
                            
                        </span>
                    </div>
                    
                    <div class="box-contents">
                        <a href="detail-view/indexb3a2.html?midx=80500">
                            <strong class="title">플로리다 프로젝트</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>2.8%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>92%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>재개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index28a8.html?MOVIE_CD=20015288&amp;MOVIE_CD_GROUP=20015288">예매</a>
                        </span>
                    </div>    
                </li>
            
            </ol>

            <ol>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.4</strong>   
                        <a href="detail-view/indexfe1a.html?midx=89583">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89583/89583_320.jpg" alt="바이러스 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age12">12</i>
                                <!-- <span class="ico-grade 12">12</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexfe1a.html?midx=89583">
                            <strong class="title">바이러스</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>2.6%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg good'></span>
                                            <span class='percent'>84%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/indexb841.html?MOVIE_CD=20040943&amp;MOVIE_CD_GROUP=20040943">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.5</strong>   
                        <a href="detail-view/indexb6ff.html?midx=84279">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84279/84279_320.jpg" alt="극장판 귀멸의 칼날-무한열차편 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!-- <span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="forDX" href="#" data-regioncode="4D14">4DX</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexb6ff.html?midx=84279">
                            <strong class="title">극장판 귀멸의 칼날-무한열차편</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>2.4%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>94%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.10 
                                <span>재개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index56bf.html?MOVIE_CD=20041234&amp;MOVIE_CD_GROUP=20025822">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.6</strong>   
                        <a href="detail-view/indexc6e6.html?midx=89578">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89578/89578_320.jpg" alt="썬더볼츠 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age12">12</i>
                                <!-- <span class="ico-grade 12">12</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="imax" href="#" data-regioncode="07">IMAX</a>
                            
                                <a class="forDX" href="#" data-regioncode="4D14">4DX</a>
                            
                                <a class="screenx" href="#" data-regioncode="SCX">SCREENX</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexc6e6.html?midx=89578">
                            <strong class="title">썬더볼츠</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>2.1%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>91%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.04.30 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index527a.html?MOVIE_CD=20041159&amp;MOVIE_CD_GROUP=20040918">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.7</strong>   
                        <a href="detail-view/index4387.html?midx=89520">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89520/89520_320.jpg" alt="해피엔드 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!-- <span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="arthouse" href="#" data-regioncode="MovieCollage">아트하우스</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/index4387.html?midx=89520">
                            <strong class="title">해피엔드</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>1.7%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>95%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.04.30 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index824f.html?MOVIE_CD=20040627&amp;MOVIE_CD_GROUP=20040627">예매</a>
                        </span>
                    </div>    
                </li>
            
            </ol>

            <div class="chart-ad-bottom" id="chart-ad-bottom">
                <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980" width="980" height="90" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_980" id="SponsorBar_980"></iframe>
            </div>
            
            <ol class="list-more"">           
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.8</strong>   
                        <a href="detail-view/index6023.html?midx=89528">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89528/89528_320.jpg" alt="A MINECRAFT MOVIE 마인크래프트 무비 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age12">12</i>
                                <!--<span class="ico-grade 12">12</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="forDX" href="#" data-regioncode="4D14">4DX</a>
                            
                                <a class="screenx" href="#" data-regioncode="SCX">SCREENX</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/index6023.html?midx=89528">
                            <strong class="title">A MINECRAFT MOVIE 마인크래프트 무비</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.7%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>89%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.04.26 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/indexb5b2.html?MOVIE_CD=20041049&amp;MOVIE_CD_GROUP=20040657">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.9</strong>   
                        <a href="detail-view/indexd807.html?midx=89657">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89657/89657_320.jpg" alt="슈가 글라스 보틀 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!--<span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="arthouse" href="#" data-regioncode="MovieCollage">아트하우스</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexd807.html?midx=89657">
                            <strong class="title">슈가 글라스 보틀</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.6%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>96%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index2e4c.html?MOVIE_CD=20041310&amp;MOVIE_CD_GROUP=20041308">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.10</strong>   
                        <a href="detail-view/indexc740.html?midx=89548">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89548/89548_320.jpg" alt="거룩한 밤: 데몬 헌터스 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!--<span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexc740.html?midx=89548">
                            <strong class="title">거룩한 밤: 데몬 헌터스</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.4%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg good'></span>
                                            <span class='percent'>71%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.04.30 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index0e6e.html?MOVIE_CD=20040768&amp;MOVIE_CD_GROUP=20040768">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.11</strong>   
                        <a href="detail-view/indexc8e3.html?midx=89632">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89632/89632_320.jpg" alt="에이티즈 월드 투어 [투워즈 더 라이트 : 윌 투 파워] 인 시네마 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc ageAll">All</i>
                                <!--<span class="ico-grade All">All</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="forDX" href="#" data-regioncode="4D14">4DX</a>
                            
                                <a class="screenx" href="#" data-regioncode="SCX">SCREENX</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexc8e3.html?midx=89632">
                            <strong class="title">에이티즈 월드 투어 [투워즈 더 라이트 : 윌 투 파워] 인 시네마</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.4%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>98%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index2c3c.html?MOVIE_CD=20041212&amp;MOVIE_CD_GROUP=20041212">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.12</strong>   
                        <a href="detail-view/index805b.html?midx=85512">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85512/85512_320.jpg" alt="아멜리에 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!--<span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="arthouse" href="#" data-regioncode="MovieCollage">아트하우스</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/index805b.html?midx=85512">
                            <strong class="title">아멜리에</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.3%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>95%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>재개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/indexa840.html?MOVIE_CD=20041311&amp;MOVIE_CD_GROUP=20028595">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.13</strong>   
                        <a href="detail-view/index5446.html?midx=89621">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89621/89621_320.jpg" alt="나미비아의 사막 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!--<span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="arthouse" href="#" data-regioncode="MovieCollage">아트하우스</a>
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/index5446.html?midx=89621">
                            <strong class="title">나미비아의 사막</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.2%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg good'></span>
                                            <span class='percent'>80%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/indexebed.html?MOVIE_CD=20041154&amp;MOVIE_CD_GROUP=20041143">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.14</strong>   
                        <a href="detail-view/indexdef1.html?midx=89571">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89571/89571_320.jpg" alt="괴수 8호: 미션 리컨 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age15">15</i>
                                <!--<span class="ico-grade 15">15</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                        </span>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view/indexdef1.html?midx=89571">
                            <strong class="title">괴수 8호: 미션 리컨</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>0.2%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위4~ 7위)-->
                            <div class='egg-gage small'>
                                            <span class='egg great'></span>
                                            <span class='percent'>93%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2025.05.07 
                                <span>개봉</span>
                                
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="../ticket/index044d.html?MOVIE_CD=20040896&amp;MOVIE_CD_GROUP=20040896">예매</a>
                        </span>
                    </div>    
                </li>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.15</strong>   
                        <a href="detail-view/index64d0.html?midx=89425">
                            <span class="thumb-image">
                                <img src="../../img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89425/89425_320.jpg" alt="콘클라베 포스터" onerror="errorImage(this)"/>
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age12">12</i>
                                <!--<span class="ico-grade 12">12</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                            
                                <a class="arthouse" href="#" data-regioncode="MovieCollage">아트하우스</a>
                       