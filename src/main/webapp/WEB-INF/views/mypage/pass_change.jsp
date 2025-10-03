<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="668501d6493a753e79314790" data-wf-site="668501d6493a753e79314722">

<head>
    <meta charset="utf-8">
    <title>Blog</title>
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
    <link href="../images/favicon.png" rel="shortcut icon" type="../image/x-icon">
    <link href="../images/webclip.png" rel="apple-touch-icon">
    <style>
        .invalid { color: gray; }
        .valid { color: green; }
    </style>
</head>

<body class="body">
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-wrapper w-nav">
        <div class="main-container w-container">
            <div class="nav-wrapper">
                <a href="../index" class="brand-logo w-nav-brand"><img src="../images/CClogo.png" loading="lazy" width="146" sizes="(max-width: 479px) 100vw, 146px" alt="" srcset="../images/CClogo.png 500w, ../images/CClogo.png 740w" class="logo"></a>
                <nav role="navigation" class="main-nav w-nav-menu">
                    <a href="../index" class="menu-item w-nav-link">Home</a>
                    <a href="../recipe" class="menu-item w-nav-link">recipe</a>
                    <a href="../news" class="menu-item w-nav-link">news</a>
					<a href="../exercise" aria-current="page" class="menu-item w-nav-link w--current">exercise</a>
                    <a href="../diary" class="menu-item w-nav-link">diary</a>
					<a href='../mypage'><img src="/userphotos/${sessionScope.profile}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%;  class="profile-img w-nav-link" ></a>
		        	  <div class="dropdown2">
						<span class="dropdown-real-mypage"><a href="/mypage">Mypage</a></span>
						<span class="dropdown-item"><a href="../diary/report">report</a></span>
						<span class="dropdown-mypage"><a href="../regist/start">Logout</a></span>
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
                    <div class="sitemap-page"><img src="../images/sitemap_blog_4sitemap_blog_03.png" loading="lazy" alt="" class="sitemap-image">
                        <h4 class="sitemap-title">Change_Password</h4>
                    </div>
                    <div class="sitemap-info"><img src="../images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="sitemap-dot">
                        <div class="sitemap-text">비밀번호 변경</div>
                    </div>
                </div>
                <div class="blog-wrapper">
                    <div class="blog-list-wrapper w-dyn-list">
                        <div role="list" class="blog-list w-dyn-items w-row">
                            <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item1 w-dyn-item w-col w-col-6">
                                <div class="blog-item-div">
                                    <form id="passwordForm">
                                        <div class="sign-in-form-content-wrap">
                                            <h3 class="sign-in-title2">현재 비밀번호를 입력해주세요</h3>
                                        </div>
                                        <div class="sign-in-field-label">
                                            <div class="sign-in-single-field-wrap">
                                                <label for="password" class="sign-in-field-label">비밀번호</label>
                                                <input class="sign-in-field w-input" maxlength="256" name="password" data-name="Password" type="password" id="password"  placeholder="비밀번호를 입력해주세요">
                                                <div id="requirements">
                                                    <div id="length" class="invalid">• 8 characters</div>
                                                    <div id="letter" class="invalid">• Letter</div>
                                                    <div id="number" class="invalid">• Number</div>
                                                    <div id="symbol" class="invalid">• Symbol</div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" class="sign-in-submit-button4 w-button" value="다음">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="footer">
        <div class="copyright-text">Calories Cut  -  Innovatively Yours: © 2024  🌟  Powered by <a href="#" class="copyright-text">2조</a>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=668501d6493a753e79314722" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../js/webflow.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#password').on('input', function() {
                var password = $(this).val();
                var length = $('#length');
                var letter = $('#letter');
                var number = $('#number');
                var symbol = $('#symbol');

                length.toggleClass('valid', password.length >= 8);
                length.toggleClass('invalid', password.length < 8);

                letter.toggleClass('valid', /[a-zA-Z]/.test(password));
                letter.toggleClass('invalid', !/[a-zA-Z]/.test(password));

                number.toggleClass('valid', /[0-9]/.test(password));
                number.toggleClass('invalid', !/[0-9]/.test(password));

                symbol.toggleClass('valid', /[!@#$%^&*(),.?":{}|<>]/.test(password));
                symbol.toggleClass('invalid', !/[!@#$%^&*(),.?":{}|<>]/.test(password));
            });

            $('#passwordForm').on('submit', function(event) {
                event.preventDefault();
                var password = $('#password').val();
                if (
                    password.length >= 8 &&
                    /[a-zA-Z]/.test(password) &&
                    /[0-9]/.test(password) &&
                    /[!@#$%^&*(),.?":{}|<>]/.test(password)
                ) {
					
                    $.ajax({
						type : 'post',
						url : '/regist/passwordcheck',
						data : {"password" : password},
						success : function(result){
							if(result=='확인완료')
								location = "change2";
							else if(result=='세션만료')
								location = 'regist/login';
							else alert('비밀번호가 일치하지 않습니다');
						},
						error : function(stat, err, c){
							alert('실패');
							console.log(stat, err, c);
						}
						
					});
                } else {
                    alert("비밀번호 형식이 일치하지 않습니다.");
                }
            });
        });
		const profileImg = document.querySelector('.profile-img');
  		const dropdown = document.querySelector('.dropdown2');

  		// 이미지에 마우스가 올라갔을 때 드롭다운 표시
  		profileImg.addEventListener('mouseover', () => {
  		dropdown.style.display = 'block';
  		});

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