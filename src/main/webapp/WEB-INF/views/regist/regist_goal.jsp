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
	<style rel="stylesheet" type="text/css">
		.active.goals-button{
			background-color : orange;
		}
		
	</style>
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
	                        <form id="profile-goal-form" name="profile-goal-form" data-name="Profile Goal Form" method="post" action="activity" class="profile-goal-form" data-wf-page-id="6634a93befaafa41dc30c188" data-wf-element-id="d7edf9eb-6d83-af9a-64b5-f9fc971d2db7">
	                            <!-- Progress Bar and Title -->
	                            <div class="progress-bar">
	                                <progress class="progress-bar" value="10" max="50">
	                                </progress>
	                            </div>

	                            <!-- Form Elements -->
	                            <div class="centered">
	                                <!-- <label for="goal-selection">What is your goal?</label>
									<input type="button" class="goals-button" value="Weight loss">
									<input type="button" class="goals-button" value="Muscle gain">
					                <input type="button" class="goals-button" value="Maintain weight">-->
	                            </div>

	                            <!-- Navigation Buttons -->
	                            <div class="nav-buttons">
	                                <button type="button" class="nav-btn prev">&lt; prev</button>
	                                <button type="button" class="nav-btn next">next &gt;</button>
	                            </div>
	                            <div class="progress">
	                                <p>Your goal affects your ideal protein, fat, and carb intake</p>
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
	$(function(){
		data = {};
		$('.centered').on('click','.goals-button', function(){
			$('.goals-button.active').removeClass('active');
			$(this	).addClass('active');
		});
		list = []
		p = 0
		v = 10
		list[0] = $(`<label for="goal-selection">What is your goal?</label>
				<input type="button" class="goals-button" value="Weight loss">
				<input type="button" class="goals-button" value="Muscle gain">
                <input type="button" class="goals-button" value="Maintain weight">`);
		list[1] = $(`<label for="goal-selection">What is your typical activity level?</label>
				<input type="button" idx="4" class="goals-button" value="Very active (intense exercise 6–7 times per week)">
				<input type="button" idx="3" class="goals-button" value="Moderately active (exercise 3–5 times per week)">
				<input type="button" idx="2" class="goals-button" value="Lightly active (light exercise 1–3 times per week)">
				<input type="button" idx="1" class="goals-button" value="Sedentary (little to no exercise)">`);
		list[2] = $(`<label for="goal-selection">What is your gender?</label>
					<input type="button"  class="goals-button" value="Male">
					<input type="button"  class="goals-button" value="Female">`);
		list[3] = $(`<div class="input-group">	
		                <label for="goal-selection">Enter your Height&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" class="height-text" placeholder="200.5"/><span>cm</span>
							</div>		
							<div class="input-group">					
						<label for="goal-selection">Enter your Weight</label>
						<input type="text" class="weight-text" placeholder="120"/><span>kg</span>		 
					</div>
					<div class="input-group">					
						<label for="goal-selection">Enter your Age</label>
						<input type="text" class="age-text" placeholder="19"/><span></span>
						</div>`);
					
		$('div.progress-bar').empty();
		$('div.progress-bar').append($("<progress  class='progress-bar' value='"+v+"' max='50'/>"));
		$('.centered').empty();
		$('.centered').append(list[p]);
		
		$('.nav-btn.next').click(function(){
			if( p>2 || $('.active').length!=0){		
				switch(p){
					case 0: data.goal=$('.active').val(); break;
					case 1: data.activity=$('.active').val()
								.slice(0,($('.active').val().indexOf('적')+1));break;
					case 2: data.gender=$('.active').val(); break;
					case 3: if($('.height-text').val()=='' || $('.weight-text').val() == '' 
									|| $('.age-text').val() == '' ) return;
							data.height = $('.height-text').val(); 
							data.weight = $('.weight-text').val(); 
							data.age = $('.age-text').val(); 
							sessionStorage.setItem('formData', JSON.stringify(data));
							location = 'end'; p=2; break;
				}
				//페이지번호 증가
				p = p+1
				//진행도 퍼센트 증가
				v = v+10
				$('div.progress-bar').empty();
				$('div.progress-bar').append(
					$("<progress class='progress-bar' value='"+v+"' max='50'/>") 
				);
				$('.centered').empty();
				$('.centered').append(list[p]);	
			}
		});
		$('.nav-btn.prev').click(function(){
			if(p!=0){
				p = p-1
				v = v-10
				$('div.progress-bar').empty();
				$('div.progress-bar').append($("<progress  class='progress-bar' value='"+v+"' max='50'/>"));
				$('.centered').empty();
				$('.centered').append(list[p]);
			}else location = 'start';
		});
	});
	
	$(document).ready(function(){
	           $('.height-text').focus(function(){
	               $(this).attr('placeholder', '');
	           }).blur(function(){
	               if ($(this).val() === '') {
	                   $(this).attr('placeholder', $(this).data('placeholder'));
	               }
	           }).each(function(){
	               $(this).data('placeholder', $(this).attr('placeholder'));
	           });
	       });

	</script>
</body>

</html>