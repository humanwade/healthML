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
</head>

<body>
	<div style="" class="pages-wrapper">
	    <section class="section authentication">
	        <div class="container">
	            <div class="authentication-content">
	                <div class="log-in">
	                    <div class="sign-in-form-wrap w-form">
	                        <form id="wf-form-Register-Email-Form" name="wf-form-Register-Email-Form" data-name="Register Email Form" method="post" action="/regist/newpassword" class="sign-in-form" data-wf-page-id="6634a93befaafa41dc30c188" data-wf-element-id="d7edf9eb-6d83-af9a-64b5-f9fc971d2db7">
	                            <div class="sign-in-form-content-wrap">
	                                <h3 class="sign-in-title3">Enter new Password</h3>
	                            </div>
	                            <div class="sign-in-field-label">
	                                <div class="sign-in-single-field-wrap">
	                                    <label for="your-email" class="sign-in-field-label">Password</label>
	                                    <input class="sign-in-field w-input" maxlength="256" style="margin-bottom: 40px;" name="newpassword" data-name="Your Email" type="password" pattern="[A-Za-z1-9]{4,15}" id="newpassword" required="" placeholder="Enter new Password">
									</div>
                            	</div>
	                            <div class="sign-in-single-field-wrap">
	                                <label for="your-email" class="sign-in-field-label"></label>
	                                <input class="sign-in-field w-input" maxlength="256" data-name="Your Email" type="password" id="passcheck" required="" placeholder="Confirm Password">
								</div>
	                    		<div>
			                    	<input type="button" data-wait="Please wait..." class="newpass-btn sign-in-submit-button3 w-button" value="Next">
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
	$('.newpass-btn').click(function(evt){
		evt.preventDefault();
		let password = $('#newpassword').val();
		const passwordPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9])(?!.*\s).{8,15}$/;
         if (!passwordPattern.test(password)) {
             alert('Invalid password format');
			 
         }
		 else if(password != $('#passcheck').val())
		 	alert('Passwords do not match');
		else {
			$.ajax({
				type : 'post',
				url : '/regist/newpassword',
				data : {'password':password},
				success : function(result){
					if(result=="변경성공")
						alert('Successfully Changed');
					else if (result=="세션만료")
						alert('세션이 만료되었습니다. 다시 이용해주세요.')
						location = '/regist/login';
				},
				error : function(stat, err, c){
					alert('실패');
					console.log(stat, err, c);
				}
			});
		}
	});
  </script>
</body>

</html>