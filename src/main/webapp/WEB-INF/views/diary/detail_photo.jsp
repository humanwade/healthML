<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="668501d6493a753e79314790" data-wf-site="668501d6493a753e79314722">

<head>
    <meta charset="utf-8">
    <title>Workout Vidoe</title>
    <meta content="Blog" property="og:title">
    <meta content="Blog" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
    <link href="../css/webflow.css" rel="stylesheet" type="text/css">
    <link href="../css/jades-ultra-awesome-site-d9185c.webflow.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script type="text/javascript">
        WebFont.load({
            google: {
                families: ["Oswald:200,300,400,500,600,700", "Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic", "Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic", "Syne:regular,500,600,700,800", "Syne:regular,500,600,700,800"]
            }
        });
    </script>
    <script type="text/javascript">
        ! function(o, c) {
            var n = c.documentElement,
                t = " w-mod-";
            n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
        }(window, document);
    </script>
    <link href="../images/wj-logo.png" rel="shortcut icon" type="../image/x-icon">
    <link href="../images/webclip.png" rel="apple-touch-icon">

    <!-- Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body class="body">
	
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-wrapper w-nav">
        <div class="main-container w-container">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo w-nav-brand"><img src="../images/CClogo.png" loading="lazy" width="146" sizes="(max-width: 479px) 100vw, 146px" alt="" srcset="../images/CClogo.png 500w, ../images/CClogo.png 740w" class="logo"></a>
                <nav role="navigation" class="main-nav w-nav-menu">
                    <a href="../index" class="menu-item w-nav-link">Home</a>
                    <a href="../recipe" class="menu-item w-nav-link">recipe</a>
                    <a href="../news" class="menu-item w-nav-link">news</a>
                    <a href="../diary" class="menu-item w-nav-link">diary</a>
                    <a href="../exercise" aria-current="page" class="menu-item w-nav-link w--current">exercise</a>
					<a href='../mypage'><img src="userphotos/${sessionScope.user.UPLOADNAME}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%;  class="profile-img w-nav-link" ></a>
					        	  <div class="dropdown2">
									<span class="dropdown-real-mypage"><a href="mypage">Mypage</a></span>
									<span class="dropdown-item"><a href="../diary/report">report</a></span>
									<span class="dropdown-mypage"><a href="/regist/logout">Logout</a></span>
								  </div>
                </nav>
                <div class="menu-button w-nav-button">
                    <div class="icon w-icon-nav-menu"></div>
                </div>
            </div>
        </div>
    </div>
	<section>
	    <div class="inner-pages-wrap">
	        <div class="w-layout-blockcontainer main-container w-container">
	            <div class="site-map">
	                <div class="sitemap-page">
	                    <img src="../images/sitemap_blog_4sitemap_blog_03.png" loading="lazy" alt="" class="sitemap-image">
	                    <h4 class="sitemap-title">PHOTO_CHECK</h4>
	                </div>
	                <div class="sitemap-info">
	                    <img src="../images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="sitemap-dot">
	                    <div class="sitemap-text">buzz bursts</div>
	                </div>
	            </div>
	            <div class="blog-wrapper">
	                <div class="blog-list-wrapper w-dyn-list">
	                    <div role="list" class="blog-list w-dyn-items w-row">
	                        <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item1 w-dyn-item w-col w-col-6">
	                            <div class="blog-item-div">
	                                <div class="photos-detail">
	                                    <div class="photo-box-detail">
	                                        <img src="../images/ani.jpg" alt="음식사진 1">
	                                        <div class="photo-name">
	                                            이 음식은 <span id="food-name">불고기</span> 입니다.
	                                            <div class="photo-cal">
	                                                <span id="photo-cal-no">1111</span> kcal
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="photo-name-update">
	                                        <span id="selected-value">불고기</span> 사진의 정보가 틀리다면 <span id="edit-text">수정</span> 해주세요
	                                    </div>
	                                    <div id="dropdown-container" style="display:none;">
	                                        <label for="options" id="dropdown-label">옵션을 선택하세요:</label>
	                                        <select id="options">
	                                            <option value="불고기">불고기</option>
	                                            <option value="비빔밥">치킨</option>
	                                            <option value="도넛">도넛</option>
	                                            <option value="생선튀김">생선튀김</option>
	                                            <option value="김밥">김밥</option>
	                                            <option value="라면">라면</option>
	                                            <option value="만두">만두</option>
	                                            <option value="피자">피자</option>
	                                            <option value="쌀밥">쌀밥</option>
	                                            <option value="스테이크">스테이크</option>
	                                            <option value="스키야키">스키야키</option>
	                                            <option value="떡볶이">떡볶이</option>
	                                        </select>
	                                    </div>
	                                </div>
	                                <div class="detail_photo_btn">
	                                    <button onclick="redirectToPage()">확인</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
    <div class="footer">
        <div class="copyright-text">Calories Cut  -  Innovatively Yours: © 2025  🌟  Powered by <a href="#" class="copyright-text">Wade Jung</a>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=668501d6493a753e79314722" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../js/webflow.js" type="text/javascript"></script>
	<script>
	    document.getElementById('edit-text').addEventListener('click', function() {
	        var dropdownContainer = document.getElementById('dropdown-container');
	        dropdownContainer.style.display = 'block';
	        dropdownContainer.scrollIntoView({
	            behavior: 'smooth'
	        });

	        // 여기서 label 문구를 동적으로 변경할 수 있습니다.
	        var dropdownLabel = document.getElementById('dropdown-label');
	        dropdownLabel.textContent = '새로운 옵션을 선택하세요:';
	    });

	    document.getElementById('options').addEventListener('change', function() {
	        var selectedValue = document.getElementById('options').value;

	        // selected-value와 food-name 요소의 텍스트를 변경합니다.
	        document.getElementById('selected-value').textContent = selectedValue;
	        document.getElementById('food-name').textContent = selectedValue;

	        var dropdownContainer = document.getElementById('dropdown-container');
	        dropdownContainer.style.display = 'none';
	    });


	    function redirectToPage() {
	        window.location.href = "/diary";
	    }
	    // JavaScript로 호버 이벤트 처리
	    const profileImg = document.querySelector('.profile-img');
	    const dropdown = document.querySelector('.dropdown2');

	    // 이미지에 마우스가 올라갔을 때 드롭다운 표시
	    profileImg.addEventListener('mouseover', () => {
	        dropdown.style.display = 'block';
	    });

	    // 이미지에서 마우스가 벗어났을 때 드롭다운 숨기기
	    //profileImg.addEventListener('mouseout', () => {
	    //dropdown.style.display = 'none';
	    //});

	    // 드롭다운 메뉴에 마우스가 올라갔을 때 드롭다운 유지
	    dropdown.addEventListener('mouseover', () => {
	        dropdown.style.display = 'block';
	    });

	    // 드롭다운 메뉴에서 마우스가 벗어났을 때 드롭다운 숨기기
	    dropdown.addEventListener('mouseout', () => {
	        dropdown.style.display = 'none';
	    });
	</script>
    
</body>

</html>
