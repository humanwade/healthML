<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://webflow.com  -->
<!--  Last Published: Wed Jul 03 2024 07:46:48 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="668501d6493a753e7931478a" data-wf-site="668501d6493a753e79314722">

<head>
    <meta charset="utf-8">
    <title>Calories Cut</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="css/normalize.css" rel="stylesheet" type="text/css">
    <link href="css/webflow.css" rel="stylesheet" type="text/css">
    <link href="css/jades-ultra-awesome-site-d9185c.webflow.css" rel="stylesheet" type="text/css">
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
	<link href="css/index.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body class="body">
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-wrapper w-nav">
        <div class="main-container w-container">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo w-nav-brand"><img src="images/CClogo.png" loading="lazy" width="146" sizes="(max-width: 479px) 100vw, 146px" alt="" srcset="images/CClogo.png 500w, images/CClogo.png 740w" class="logo"></a>
                <nav role="navigation" class="main-nav w-nav-menu">
                    <a href="index" aria-current="page" class="menu-item w-nav-link w--current">Home</a>
                    <a href="recipe" class="menu-item w-nav-link">recipe</a>
                    <a href="news" class="menu-item w-nav-link">news</a>
					<a href="exercise" class="menu-item w-nav-link">exercise</a>
                    <a href="diary" class="menu-item w-nav-link">diary</a>
                    <a href='mypage'><img src="/userphotos/${sessionScope.profile}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%; class="profile-img w-nav-link"></a>
                    <div class="dropdown2">
						<span class="dropdown-real-mypage"><a href="mypage">Mypage</a></span>
                        <span class="dropdown-item"><a href="diary/report">report</a></span>
                        <span class="dropdown-mypage"><a href="regist/start">Logout</a></span>
                    </div>
                </nav>
                <div class="menu-button w-nav-button">
                    <div class="icon w-icon-nav-menu"></div>
                </div>
            </div>
        </div>
    </div>
    <section>
        <div class="home-wrapper">
            <div class="w-layout-blockcontainer main-container w-container">
                <div id="w-node-_9f90a540-f866-6cd5-898a-462c713a5490-7931478a" class="w-layout-layout home-stack wf-layout-layout">
                    <div id="w-node-d6d3953d-a5d0-8a89-62c1-6c31b64c5a30-7931478a" class="w-layout-cell about-row">
                        <a data-w-id="700b8ace-6395-ae52-faf8-a5babb050432" class="about-block w-inline-block">
                            <div class="about-infos">
                                <h2 class="about-title">${user.username} <span class="main-welcome">님 환영합니다</span> </h2>
                                <div class="exercise-options">
                                    <label for="exercise-type">Type:</label>
                                    <select id="exercise-type" class="exercise-select">
                                        <option value="" disabled selected>Choose the type of exercise</option>
                                        <c:forEach items="${workcates}" var="workcate">
											<option value="${workcate.workcatename}">${workcate.workcatename}</option>
										</c:forEach>
										<!--<option value="cardio">유산소 운동</option>
                                        <option value="strength">근력 운동</option>
                                        <option value="flexibility">유연성 운동</option>
                                        <option value="balance">균형 운동</option>-->
                                    </select>
                                </div>

                                <div class='exercise-input'>
                                    <input type="number" id="exercise-min" placeholder="minute">
                                    <button class="scale-button" onclick="updateScale()">입력</button>
                                </div>


                                <div class="summary">
                                    <h3>Summary</h3>
                                    <p id="totalDuration">총 운동 시간: ${workcal.worktime} &nbsp;분</p>
									<p id="totalDistance">총 소모칼로리: ${workcal.workcal} &nbsp;kcal</p>
                                </div>
                            </div>
                            <div class="about-bg-image"></div>
                        </a>
                    </div>
                    <div id="w-node-_0fc2bf67-cea5-3920-ed20-e98dc64d8481-7931478a" class="w-layout-cell top-row">
                        <div id="w-node-e420a70b-3335-8a3c-6fd6-1dd47edee2da-7931478a" class="w-layout-layout top-row-stack wf-layout-layout">
                            <div id="w-node-_36d74deb-6b8a-0da6-6039-9b94f28851c1-7931478a" class="w-layout-cell blog-cell">
                                <a data-w-id="e4e16621-820e-469b-a4af-8e8d1666fda4" href="recipe" class="blog-block w-inline-block">
                                    <div class="text-with-dot"><img src="images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="blue-dot">
                                        <div class="dot-text">RECIPE</div>
                                    </div>
                                    <div class='recipeChange'>
                                        <img src="${recipes[0].imgurl}" style="cache-control: max-age=31536000" loading="lazy" sizes="(max-width: 479px) 100vw, (max-width: 767px) 94vw, (max-width: 984px) 95vw, 935px" srcset="${recipes[0].imgurl} 500w, ${recipes[0].imgurl} 800w, ${recipes[0].imgurl} 935w" alt="" class="blog-img">
                                        <h3 class="main-title">${recipes[0].menuname}</h3>
                                    </div>
                                </a>
                            </div>
                            <div id="w-node-_9aed2215-b44e-81c1-9e6e-a5a496988f8e-7931478a" class="w-layout-cell service-cell">
                                <a data-w-id="d8a7e28c-2b92-cd67-add9-9f030af83191" class="service-block w-inline-block">
                                    <div class="text-with-dot"><img src="images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="blue-dot">
                                        <div class="dot-text">NEWS</div>
                                    </div>
                                    <div class="service-circles">
                                        <div class="mnews">
                                            <img src="${news.get(0).nimgurl}" />
                                            <span nurl='${news.get(0).newsurl}'>${news.get(0).title}</span>
                                        </div>
                                        <ul>
                                            <c:forEach items="${news}" var="items" end="5">
                                                <li class="mainnews" newsimg="${items.nimgurl}" nurl="${items.newsurl}">${items.title}</li>
                                            </c:forEach>
                                        </ul>
                                    </div> 
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="w-node-d139f96c-d394-01f6-92f4-d1bfb9aa3473-7931478a" class="w-layout-cell bottom-row">
                        <div id="w-node-_0dbb6643-982f-e318-23db-636b44288cf7-7931478a" class="w-layout-layout bottom-row-stack wf-layout-layout">
                            <div id="w-node-_0dbb6643-982f-e318-23db-636b44288cf8-7931478a" class="w-layout-cell work-cell">
                                <a data-w-id="b569344e-3ec5-14ba-63fe-3cb5296ed5ce" href="exercise" class="work-block w-inline-block">
                                    <div class="text-with-dot"><img src="images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="blue-dot">
                                        <div class="dot-text">EXERCISE</div>
                                    </div>
                                    <div class="circle-ball">
						        		<div id="playerLayer"></div>
                                    </div>
                                </a>
                            </div>
                            <div id="w-node-_0dbb6643-982f-e318-23db-636b44288cf9-7931478a" class="w-layout-cell contact-cell">
                                <a data-w-id="e377f905-8e18-481e-ec90-7ba9c83f1b54" hre=f="diary" class="contact-block w-inline-block">
                                    <div class="text-with-dot"><img src="images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="blue-dot">
                                        <div class="dot-text">CHART</div>
                                    </div>
                                    <div class="content-container">
                                        <div class="chart-container12">
                                            <canvas id="chart2"></canvas>
											<div class="tooltip" id="tooltip">건강식재료 현황</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="socials">
                <a href="#" class="social-item w-inline-block"><img src="images/fcb_1fcb.png" loading="lazy" alt="" class="facebook-icon"></a>
                <a href="#" class="social-item w-inline-block"><img src="images/twitter_1twitter.png" loading="lazy" alt="" class="twitter-icon"></a>
                <a href="#" class="social-item w-inline-block"><img src="images/instagram_1instagram.png" loading="lazy" alt="" class="insta-icon"></a>
            </div>
        </div>
    </section>
    <div class="footer">
		<div class="copyright-text">개인정보  이용약관 
			<span id="openModal">이용가이드</span>
			<div id="myModal" class="modal">
			    <div class="modal-content">
			        <span class="close">&times;</span>
			        <h3></h3>
			        <img id="modalImage" src="images/logo.png">
					
					<div class="help-joystick">
					    <button class="prev"> &lt; </button>				   
					    <button class="next"> &gt; </button>
					</div>
									   
					<label class="checkbox-container">
						    <input type="checkbox">
					    <span class="checkmark"></span>
					    7일간 보이지 않게 합니다.	
					</label>
					
					<button class="help-shutdown">닫기</button>
			    </div>
			</div>
		</div>
		<div class="copyright-text">Calories Cut  -  Innovatively Yours: © 2024  🌟  Powered by <a href="#" class="copyright-text">2조</a>
			<c:if test="${admin=='true'}">
				<span class="admin-btn">관리자페이지</span>
			</c:if>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=668501d6493a753e79314722" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/webflow.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	    window.embeddedChatbotConfig = {
	        chatbotId: "cGT-V-lb4cRGh4Fg9x5sd",
	        domain: "www.chatbase.co"
	    }
	</script>
	<script src="https://www.chatbase.co/embed.min.js" chatbotId="cGT-V-lb4cRGh4Fg9x5sd" domain="www.chatbase.co" defer>
	</script>
	<script>
		
		//뉴스 호버시 뉴스 변경, 뉴스 클릭시 해당 사이트 이동
        $(function() {
            $('.mainnews').hover(function() {
                $('.mnews img').attr('src', $(this).attr('newsimg'));
                $('.mnews span').text($(this).text());
				$('.mnews span').attr('nurl',$(this).attr('nurl'));
            });
            $('.mainnews').click(function() {
                window.open($(this).attr('nurl'));
            });
			$('.mnews span').click(function(){
				window.open($(this).attr('nurl'));
			});
        });
		
		
		
		// 건강식재료 차트
        var ctx2 = document.getElementById('chart2').getContext('2d');
        // 파스텔톤 색상
        const pastelRed = 'rgba(255, 153, 153, 0.8)';
        const pastelBlue = 'rgba(153, 204, 255, 0.8)';
        const pastelYellow = 'rgba(255, 255, 153, 0.8)';
        const pastelGreen = 'rgba(153, 255, 204, 0.8)';
        const pastelPurple = 'rgba(204, 153, 255, 0.8)';
        const a = 'rgba(255, 204, 182, 0.8)';
        const b = 'rgba(254,225,232, 0.8)';
        const c = 'rgba(85,203,205,0.8)';
        const d = 'rgba(147,112,219,0.8)';
        const e = 'rgba(175,238,238,0.8)';

        const recipecharts = JSON.parse('${recipechart}');

        const ingre = [];
        const cnt = [];
        for (recipechart of recipecharts) {
            ingre.push(recipechart.ingredient);
            cnt.push(recipechart.count);
        }
        var myChart2 = new Chart(ctx2, {
            type: 'pie', // 파이 차트
            data: {
                labels: ingre, //['Red', 'Blue', 'Yellow', 'Green', 'Purple'],
                datasets: [{
                    label: 'Votes',
                    data: cnt, //[12, 19, 3, 5, 2, 10, 12, 4, 7, 11],
                    backgroundColor: [
                        pastelRed,
                        pastelBlue,
                        pastelYellow,
                        pastelGreen,
                        pastelPurple,
                        a, b, c, d, e
                    ],
                    borderColor: [
                        'rgba(255, 255, 255, 1)', // 흰색 테두리
                        'rgba(255, 255, 255, 1)',
                        'rgba(255, 255, 255, 1)',
                        'rgba(255, 255, 255, 1)',
                        'rgba(255, 255, 255, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        }
                    },
                    title: {
                        display: true,
                        text: '식재료 현황',
                        font: {
                            size: 18,
                            weight: 'bold'
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(0, 0, 0, 0.7)', // 툴팁 배경 색상
                        titleColor: 'white', // 툴팁 제목 색상
                        bodyColor: 'white' // 툴팁 본문 색상
                    }
                }
            }
        });
    </script>
    <script>
        // JavaScript로 호버 이벤트 처리
        const profileImg = document.querySelector('.profile-img');
        const dropdown = document.querySelector('.dropdown2');

        // 이미지에 마우스가 올라갔을 때 드롭다운 표시
        profileImg.addEventListener('mouseover', () => {
            dropdown.style.display = 'block';
        });

        // 드롭다운 메뉴에서 마우스가 벗어났을 때 드롭다운 숨기기
        dropdown.addEventListener('mouseout', () => {
            dropdown.style.display = 'none';
        });
		
		// 레시피 자동 새로고침
		const recipeChange = () => {
			$.ajax({
				type : "get",
				url : 'recipeChange',
				success : function(result){
					$('.recipeChange').empty();
					var a = '<a href="recipe/detail?recipeno=' + result.recipeno + '" class="blog-block">'
                                 + '<img src="'+result.imgurl+'" class="blog-img">'
                                 + '<h3 class="main-title">'+result.menuname+'</h3>'
                                 + '</a>';
					$('.recipeChange').append(a);
				},
				error : function(stat, err, c){
					console.log(stat, err, c);
				}
			});
			
		}
		setInterval(recipeChange,3000);
		
	</script>
	<script src="https://www.youtube.com/iframe_api"></script>
	<script type="text/javascript">    
		
		// 운동영상
		var player;    // 유튜브 플레이어를 생성한다.   
		var videoid = '${work}';
		 function onYouTubePlayerAPIReady() {        
			try {  
				player = new YT.Player('playerLayer', {
		             	height: '300',                
						width: '100%',  
						videoId: videoid,               
						playerVars: {                    
							'autoplay': 1,  	// 자동실행여부 
			                 'controls': 1,     // 재생컨트롤 노출여부
			                 'autohide': 0,  	// 재생컨트롤이 자동으로 사라질지의 여부 
			                 'rel': 0,          // 동영상 재생완료 후 유사동영상 노출여부
			                 'wmode': 'transparent'                
						}, events: {  
							'onReady': onPlayerReady,
							'onStateChange': onPlayerStateChange,
							'onError': onPlayerError
		               }           
				});       
		 	} catch (e) {        
				}    
		}    // 유튜브 플레이어가 다 만들어지면 호출됨    
		function onPlayerReady(event) {        
			event.target.playVideo();     
		}    
		
		function onPlayerError(event) {
			console.log('Error occurred: ', event.data);
			if (event.data == 100 || event.data == 101  
					|| event.data == 150 || event.data == 2) {
						console.log("영상에러코드", event.data);
				// 100: 동영상이 존재하지 않음
				// 101: 동영상이 재생이 불가능한 상태
				// 150: 동영상이 재생이 불가능한 상태
				//alert('동영상을 로드할 수 없습니다. 대체 동영상을 로드합니다.');
				$.ajax({
					url : 'getNewVideoId',
					data : {"videoid" : videoid, "errcode" : event.data},
					success : function(result){
						//console.log('123',result);
						player.loadVideoById(result);
					},
					error : function(stat, err, c){
						alert('실패');
					}
				});
			}
		}
		
		// 동영상의 재생이 완료되었을 때 호출됨    
		function onPlayerStateChange(event) {       
			if (event.data === YT.PlayerState.ENDED) {
				$.ajax({
					type : 'get',
					url : 'getVideoId',
					success : function(result){
						videoid = result;
						player.loadVideoById(result);
					},
					error : function(stat, err, c){
						console.log(stat, err, c);
					}
				});
           }
		}
		//videoid = '${work}';
		onYouTubePlayerAPIReady();
		console.log('${work}');
		
		
		
		// 운동입력
		const updateScale = function(){
			if($('#exercise-type').val()!=null&&$('#exercise-min').val()!=""){
				let workcatename = $('#exercise-type').val();
				let worktime = $('#exercise-min').val();
				$.ajax({
					url : "workinput",
					data : {"workcatename": workcatename, "worktime": worktime},
					success : function(result){
						if(result.message=='세션만료')location="regist/login"
						$('.summary').empty();
						let a = '<div class="summary">'
		                       + '<h3>Summary</h3>'
		                       + '<p id="totalDuration">총 운동 시간: '+ result.worktime + '&nbsp;분</p>'
		                       + '<p id="totalDistance">총 소모칼로리: '+ result.workcal.toFixed(1) + '&nbsp;kcal</p> </div>';
						$('.summary').append(a);
						$('#exercise-min').val("");
						$('#exercise-type').val("");
					},
					error : function(stat, err, c){
						console.log(stat, err, c);
						alert('실패');
					}
				});
			}
		};
		// 운동시간 엔터로 입력
		$('#exercise-min').keyup(function(evt){
			if(evt.keyCode==13)
				$('.scale-button').trigger('click');
		});
		
		
		
		// 가이드 모달
		var modal = document.getElementById("myModal");
		var btn = document.getElementById("openModal");
		var span = document.getElementsByClassName("close")[0];

		// 버튼 클릭 시 모달 열기
		btn.onclick = function() {
		    modal.style.display = "block";
		}
 
		// 닫기 버튼 클릭 시 모달 닫기
		span.onclick = function() {
		    modal.style.display = "none";
		}

		// 모달 외부 클릭 시 모달 닫기
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		
		// 모달 이미지 페이징
		const images = [
		    'modalimage/main.png',
		    'modalimage/diary.png',
		    'modalimage/diary2.png',
			'modalimage/report.png'
		    // 추가 이미지 경로
		];

		let currentIndex = 0; // 현재 이미지 인덱스 초기화

		// 이미지 업데이트 함수
		function updateImage() {
		    const modalImage = document.getElementById('modalImage');
		    modalImage.src = images[currentIndex];
		    updateButtonState(); // 버튼 상태 업데이트 호출
		}

		// 버튼 상태 업데이트 함수
		function updateButtonState() {
		    const prevButton = document.querySelector('.prev');
		    const nextButton = document.querySelector('.next');

		    // 이전 버튼 비활성화
		    if (currentIndex === 0) {
		        prevButton.disabled = true;
		    } else {
		        prevButton.disabled = false;
		    }

		    // 다음 버튼 비활성화
		    if (currentIndex === images.length - 1) {
		        nextButton.disabled = true;
		    } else {
		        nextButton.disabled = false;
		    }
		}

		// 초기 이미지와 버튼 상태 업데이트
		updateImage();

		// 이전 버튼 클릭 이벤트
		document.querySelector('.prev').addEventListener('click', function(e) {
		    e.preventDefault(); // 기본 링크 클릭 방지
		    currentIndex = (currentIndex > 0) ? currentIndex - 1 : images.length - 1; // 이전 이미지로 이동
		    updateImage();
		});

		// 다음 버튼 클릭 이벤트
		document.querySelector('.next').addEventListener('click', function(e) {
		    e.preventDefault(); // 기본 링크 클릭 방지
		    currentIndex = (currentIndex < images.length - 1) ? currentIndex + 1 : 0; // 다음 이미지로 이동
		    updateImage();
		});	
		
		$('.help-shutdown').click(function(){
			$('#myModal').css('display', 'none');
			if($('.checkbox-container input:checked').length == 1){
				$.cookie('${sessionScope.user}', 'pass', { expires: 7 });
			};
		});
		
		// 툴팁박스
		const chartContainer = document.querySelector('.chart-container12');
		const tooltip = document.getElementById('tooltip');

		chartContainer.addEventListener('mouseenter', (event) => {
		    tooltip.style.display = 'block'; // 툴팁 표시
		});

		chartContainer.addEventListener('mousemove', (event) => {
		    tooltip.style.left = `${event.pageX + 10}px`; // 마우스 위치에 따라 툴팁 위치 조정
		    tooltip.style.top = `${event.pageY + 10}px`;
		});

		chartContainer.addEventListener('mouseleave', () => {
		    tooltip.style.display = 'none'; // 툴팁 숨김
		});
		$('.admin-btn').click(function(){
			sessionStorage.setItem('user', '${sessionScope.user}');
			location.href = 'http://localhost:3000';
		});
		
		setTimeout(function(){
			if($.cookie('${sessionScope.user}') != "pass")
				$('#myModal').css('display','block');
		},1000)
	</script>
</body>

</html>