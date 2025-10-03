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
	<link href="../css/login.css" rel="stylesheet" type="text/css">
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
    <link href="images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="images/webclip.png" rel="apple-touch-icon">
	<style>
	    #load {
	        width: 100%;
	        height: 100%;
	        top: 0;
	        left: 0;
	        position: absolute;
	        display: none;
	        opacity: 0.95;
	        background: white;
	        z-index: 99;
	        text-align: center;
	    }

	    #load img {
	        width: 50%;
			margin-top : -300px;
	    }
		
		@media (max-width: 430px){
			#load img {
				width: 150%;
		        margin-top: 100px;
			}
		}
	</style>
</head>

<body>
	<!-- 로딩화면-->
	<div id="load">
	  <img src="/images/test2.gif" alt="loading">
	</div>

	<div style="" class="pages-wrapper">
	    <section class="section authentication">
	        <div class="container">
	            <div class="authentication-content">
	                <div class="log-in">
	                    <div class="sign-in-form-wrap w-form">
	                        <form id="wf-form-Register-Email-Form" name="wf-form-Register-Email-Form" data-name="Register Email Form" method="post" action="../user-pages/login.do" class="sign-in-form" data-wf-page-id="6634a93befaafa41dc30c188" data-wf-element-id="d7edf9eb-6d83-af9a-64b5-f9fc971d2db7">
	                            <div class="sign-in-form-content-wrap">
	                                <h3 class="sign-in-title2">비밀번호 리셋코드를 전송합니다</h3>
	                            </div>
	                            <div class="sign-in-form-content-wrap">
	                                <h5 class="sign-in-title1">회원가입시 입력한 이메일 주소를 입력해주세요</h5>
	                            </div>
	                            <div class="sign-in-field-label">
	                                <div class="sign-in-single-field-wrap">
	                                    <label for="your-email" class="sign-in-field-label">이메일</label>
	                                    <input class="sign-in-field w-input" maxlength="256" name="userEmail" data-name="Your Email" type="email" id="your-email" required=""></div>
	                                <div>
	                                    <input type="button" data-wait="Please wait..." class="emailcheck-btn sign-in-submit-button3 w-button" value="다음">
	                                </div>
	                        </form>
	                        <div class="w-form-done">
	                            <div>Thank you! Your submission has been received!</div>
	                        </div>
	                        <div class="w-form-fail">
	                            <div>Oops! Something went wrong while submitting the form.</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6634a93aefaafa41dc30c070" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow2.js" type="text/javascript"></script>
 	<script>
		$('.emailcheck-btn').click(function(){
			$('#load').css('display','block');
			let email = $('#your-email').val();
			$.ajax({
				type : 'get',
				url : '/regist/emailcheck?email='+email,
				success : function(result){
					if(result=='확인') {
						$('#load').css('display','none');
						location = 'resetchk';
					}
					else {
						$('#load').css('display','none');
						alert('이메일을 확인하세요');
					}
				},
				error : function(stat, err, c){
					alert('실패');
					console.log(stat, err, c);
				}
			});
		});
	</script>
</body>

</html>