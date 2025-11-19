<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html data-wf-page="668501d6493a753e79314797" data-wf-site="668501d6493a753e79314722">

<head>
    <meta charset="utf-8">
    <title>Diary</title>
    <meta content="Services" property="og:title">
    <meta content="Services" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="css/normalize.css" rel="stylesheet" type="text/css">
    <link href="css/webflow.css" rel="stylesheet" type="text/css">
    <link href="css/jades-ultra-awesome-site-d9185c.webflow.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css" />
	<style>
	    .diary-date {
	        display: flex;
	        /* 플렉스 박스를 사용하여 버튼과 숫자 정렬 */

	        justify-content: center;
	        /* 수평 중앙 정렬 */
	        font-size: 100px;
	        z-index: 1000;
	        position: relative;
	    }

	    .date {
	        position: relative;
	        height: 30px;
	        /* 숫자의 높이에 맞게 조정 */

	        text-align: center;
	        /* 텍스트 중앙 정렬 */
	    }

	    .digit {
	        display: inline-block;
	        transition: opacity 0.3s ease;
	        /* 불투명도 애니메이션 추가 */
	    }

	    .hidden {
	        opacity: 0;
	        /* 불투명도 0으로 설정 */
	    }

	    .diary-date-left {
	        cursor: pointer;
	        /* 클릭 가능함을 나타내는 커서 */

	        font-size: 100px;
	        /* 버튼 크기 조정 */
	    }

	    .daily-intake P {
	        width: 50%;
	    }

	    .daily-intake h2 {
	        width: 50%;
	    }

	    .daily-intake3 P {
	        width: 30%;
	    }

	    .daily-intake3 h2 {
	        width: 40%;
	    }

	    .daily-intake3 {
	        position: relative;
	        /* 또는 absolute */
	        left: 73%;
	        top: -193px;
	    }

	    @media (max-width: 502px) {
	        .daily-intake3 P {
	            width: 40%;
	        }

	        .daily-intake3 h2 {
	            width: 50%;
	        }
	    }

	    @media (max-width: 420px) {
	        .daily-intake3 P {
	            width: 47%;
	            margin-left: -12%;
	        }

	        .daily-intake3 h2 {
	            width: 50%;
	            margin-left: -12%;
	        }
	    }

	    @media (max-width: 375px) {
	        .daily-intake3 P {
	            width: 47%;
	            margin-left: -15%;
	        }

	        .daily-intake3 h2 {
	            width: 50%;
	            margin-left: -15%;
	        }
	    }

	    @media (max-width: 360px) {
	        .daily-intake P {
	            font-size: 15px !important;
	        }

	        .daily-intake3 P {
	            font-size: 15px !important;
	        }
	    }
		
		.close2{
			font-size:40px;
			display: flex;
		    justify-content: flex-end;
		}
		.close3{
			font-size:40px;
			display: flex;
	    	justify-content: flex-end;
		}
		.close4{
			font-size:40px;
			display: flex;
		    justify-content: flex-end;
		}
	</style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
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
    <link href="images/wj-logo.png" rel="shortcut icon" type="image/x-icon">
    <link href="images/webclip.png" rel="apple-touch-icon">
<c:set var="flaskBaseUrl" value="https://health-api.wadeverse.net/" />
</head>

<body class="body">
<script>
  console.log("carbsum:", ${carbsum});
  console.log("proteinsum:", ${proteinsum});
  console.log("fatsum:", ${fatsum});
</script>
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-wrapper w-nav">
        <div class="main-container w-container">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo w-nav-brand"><img src="images/CClogo.png" loading="lazy" width="146" sizes="(max-width: 479px) 100vw, 146px" alt="" srcset="images/CClogo.png 500w, images/CClogo.png 740w" class="logo"></a>
                <nav role="navigation" class="main-nav w-nav-menu">
                    <a href="index" class="menu-item w-nav-link">Home</a>
                    <a href="recipe" class="menu-item w-nav-link">recipe</a>
                    <a href="news" class="menu-item w-nav-link">news</a>
					<a href="exercise" class="menu-item w-nav-link">exercise</a>
                    <a href="diary" aria-current="page" class="menu-item w-nav-link">diary</a>
                    <a href='../mypage'><img src="userphotos/${sessionScope.profile}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%; class="profile-img w-nav-link"></a>
			        	  <div class="dropdown2">
							<span class="dropdown-real-mypage"><a href="mypage">Mypage</a></span>
							<span class="dropdown-item"><a href="diary/report">report</a></span>
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
	                <div class="sitemap-page"><img src="images/sitemap_img2_1sitemap_img2.png" loading="lazy" alt="" class="sitemap-image">
	                    <h4 class="sitemap-title">DIARY</h4>
	                </div>
	                <div class="sitemap-info"><img src="images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="sitemap-dot">
	                    <div class="sitemap-text">Calories Calculate on AI</div>
	                </div>
	            </div>

	            <div class="diary-date">
	                <span class="diary-date-left left">&lt;</span>
	                <span class="date" id="date">
	                    <span class="digit" id="year">0</span>.
	                    <span class="digit" id="month">0</span>.
	                    <span class="digit" id="day">0</span>
	                </span>
	                <span class="diary-date-left right">&gt;</span>
	            </div>

	            <div class="blog-wrapper">
	                <div class="blog-list-wrapper w-dyn-list">
	                    <div role="list" class="blog-list w-dyn-items w-row">
	                        <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item w-dyn-item w-col w-col-6">
	                            <div class="blog-item-div">
	                            <c:if test="${not empty chartdatas}">
                                  <c:set var="carbsum" value="${chartdatas[0].carbsum}" />
                                  <c:set var="proteinsum" value="${chartdatas[0].proteinsum}" />
                                  <c:set var="fatsum" value="${chartdatas[0].fatsum}" />
                                  <c:set var="calsum1" value="${chartdatas[0].calsum}" />
                                </c:if>
	                                <div class="daily-intake">
	                                    <p>Daily Value</p>
	                                    <h2 class="recomandcal">3,000kcal</h2>
	                                    <p>Intake</p>
	                                    <h2 class="calsum">0kcal</h2>
	                                </div>
	                                <div class="daily-intake3">
	                                    <p>Calories burned</p>
	                                    <h2 class="caloriesBurned">0kcal</h2>
	                                </div>
	                                <!-- 차트 추가 -->
	                                <div class="chart-container">
	                                    <canvas id="calorieChart"></canvas>
	                                </div>
	                                <div class="daily-intake1">
	                                    <h2>Left</h2>
	                                    <h1 class="remainingcal">2,150 kcal</h1>
	                                </div>
	                                <c:forEach items="${result}" var="meals">
	                                    <c:forEach items="${meals}" var="meal">
	                                        <c:set var="carbsum" value="${carbsum + meal.CARBOHYDRATES}" />
                                            <c:set var="proteinsum" value="${proteinsum + meal.PROTEINS}" />
                                            <c:set var="fatsum" value="${fatsum + meal.FATS}" />
	                                    </c:forEach>
	                                </c:forEach>
	                                <div class="nutrients">
	                                    <div class="nutrient">
                                          <p>Carbs</p>
                                          <div class="progress-bar">
                                            <div class="progress progress-carb"></div>
                                          </div>
                                          <p class="nutri1">${Math.floor(carbsum)}/294g</p>
                                        </div>

                                        <div class="nutrient">
                                          <p>Proteins</p>
                                          <div class="progress-bar">
                                            <div class="progress progress-protein"></div>
                                          </div>
                                          <p class="nutri2">${Math.floor(proteinsum)}/106g</p>
                                        </div>

                                        <div class="nutrient">
                                          <p>Fats</p>
                                          <div class="progress-bar">
                                            <div class="progress progress-fat"></div>
                                          </div>
                                          <p class="nutri3">${Math.floor(fatsum)}/59g</p>
											
											<!-- 음식사진 업로드 모달 -->
	                                        <div id="myModal2" class="modal2">
	                                            <div class="modal-content2">
	                                                <span class="close2">&times;</span>
	                                                <div class="photos-detail">
	                                                    <div class="photo-box-detail">
	                                                        <img src="../images/ani.jpg" alt="음식사진 1">
	                                                        <div class="photo-name"> This is <span id="food-name">불고기</span>
	                                                            <div class="photo-cal"><span id="photo-cal-no">1111</span> kcal</div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="photo-name-update">
	                                                        <span id="selected-value">불고기</span> Incorrect food info ? <span id="edit-text">CLICK</span> to modify
	                                                    </div>
	                                                    <div id="dropdown-container" style="display:none;">
	                                                        <label for="options" id="dropdown-label">Choose the option:</label>
	                                                        <select id="options">
	                                                            <c:forEach items="${foodinfo}" var="food">
	                                                                <option value="${food.foodname}" cal=${food.calories}>${food.foodname}</option>
	                                                            </c:forEach>
	                                                        </select>
	                                                    </div>
	                                                </div>
	                                                <div class="detail_photo_btn">
	                                                    <button class="photo_submit_btn">OK</button>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
							
							<!-- 다이어리 입력 모달 -->
	                        <div id="myModal3" class="modal">
	                            <div class="modal-content">
	                                <span class="close3">&times;</span>
	                                <h2>${seldate}</h2>
									<button id="foodselect" class="input-button">Manual Upload</button>
	                                <button id="foodimgupload" class="input-button">Picture Upload</button>
	                            </div>
	                        </div>
							
							<!-- 매뉴얼 선택 모달 -->
							<div id="myModal4" class="modal2">
	                            <div class="modal-content2">
	                                <span class="close4">&times;</span>
	                                <div class="photos-detail">
	                                    <div class="photo-box-detail">
	                                        <img src="../images/CClogo.png" alt="음식사진 1">
	                                        <div class="photo-name"> <span id="search-food-name">Enter Food name</span>
	                                            <div class="photo-cal"><span id="serach-food-cal">0</span> kcal</div>
	                                        </div>
	                                    </div>
	                                    <div class="photo-name-update">
	                                        <!--<span id="selected-value">불고기</span> Incorrect food info? <span id="edit-text">CLICK</span> to modify -->
											<input type="text" class="search-food"/> <button type="button" class="search-food-insert">OK</button>
	                                    </div>
	                                </div>
	                                <div class="detail_photo_btn">
	                                    <button class="text_submit_btn">ENTER</button>
	                                </div>
	                            </div>
	                        </div>
																		
	                        <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item w-dyn-item w-col w-col-6">
	                            <div class="blog-item-div">
	                                <div class="meal-records">
	                                    <h2>HISTORY</h2>
	                                </div>
	                                <div class="meal">
	                                    <p>Breakfast</p>
	                                    <c:set var="calsum1" value="0" />
	                                    <c:forEach items="${result[0]}" var="breakfast">
	                                        <c:set var="calsum1" value="${calsum1+breakfast.calories}" />
	                                    </c:forEach>
	                                    <p class="rmcal1"></p>
	                                    <input type="file" id="profilePicInput1" accept="image/*" style="display: none;">
	                                    <button number='1'>+</button>
	                                </div>
	                                <div class="meal">
	                                    <p>Lunch</p>
	                                    <c:set var="calsum2" value="0" />
	                                    <c:forEach items="${result[1]}" var="lunch">
	                                        <c:set var="calsum2" value="${calsum2+lunch.calories}" />
	                                    </c:forEach>
	                                    <p class='rmcal2'></p>
	                                    <input type="file" id="profilePicInput2" accept="image/*" style="display: none;">
	                                    <button number='2'>+</button>
	                                </div>
	                                <div class="meal">
	                                    <p>Dinner</p>
	                                    <c:set var="calsum3" value="0" />
	                                    <c:forEach items="${result[2]}" var="dinner">
	                                        <c:set var="calsum3" value="${calsum3+dinner.calories}" />
	                                    </c:forEach>
	                                    <p class='rmcal3'></p>
	                                    <input type="file" id="profilePicInput3" accept="image/*" style="display: none;">
	                                    <button number='3'>+</button>
	                                </div>
	                                <div class="meal">
	                                    <p>Snacks</p>
	                                    <c:set var="calsum4" value="0" />
	                                    <c:forEach items="${result[3]}" var="snack">
	                                        <c:set var="calsum4" value="${calsum4+snack.calories}" />
	                                    </c:forEach>
	                                    <p class="rmcal4"></p>
	                                    <input type="file" id="profilePicInput4" accept="image/*" style="display: none;">
	                                    <button number='4'>+</button>
	                                </div>

	                                <br /><br />
	                                <div class="photos">
                                      <div class="photo-box" id="photoBox1">
                                        <c:forEach items="${result[0]}" var="photo" varStatus="stat">
                                          <c:choose>
                                            <c:when test="${photo.photoid != null}">
                                              <a href="${flaskBaseUrl}/uploads/${photo.uploadname}" data-fancybox="gallery1">
                                                <c:if test="${stat.index == 0}">
                                                  <img src="${flaskBaseUrl}/uploads/${photo.uploadname}"
                                                       id="profilePicPreview1" alt="식사기록 사진" class="responsive-img">
                                                </c:if>
                                              </a>
                                            </c:when>
                                            <c:otherwise>
                                              <a href="<c:url value='/images/CClogo.png'/>" data-fancybox="gallery1">
                                                <c:if test="${stat.index == 0}">
                                                  <img src="<c:url value='/images/CClogo.png'/>"
                                                       id="profilePicPreview1" alt="식사기록 사진" class="responsive-img">
                                                </c:if>
                                              </a>
                                            </c:otherwise>
                                          </c:choose>
                                        </c:forEach>
                                      </div>
	                                    <div class="photo-box" id="photoBox2">
                                            <c:forEach items="${result[1]}" var="photo" varStatus="stat">
                                              <c:choose>
                                                <c:when test="${photo.photoid != null}">
                                                  <a href="${flaskBaseUrl}/uploads/${photo.uploadname}" data-fancybox="gallery2">
                                                    <c:if test="${stat.index == 0}">
                                                      <img src="${flaskBaseUrl}/uploads/${photo.uploadname}"
                                                           id="profilePicPreview2" alt="식사기록 사진" class="responsive-img">
                                                    </c:if>
                                                  </a>
                                                </c:when>
                                                <c:otherwise>
                                                  <a href="<c:url value='/images/CClogo.png'/>" data-fancybox="gallery2">
                                                    <c:if test="${stat.index == 0}">
                                                      <img src="<c:url value='/images/CClogo.png'/>"
                                                           id="profilePicPreview2" alt="식사기록 사진" class="responsive-img">
                                                    </c:if>
                                                  </a>
                                                </c:otherwise>
                                              </c:choose>
                                            </c:forEach>
                                          </div>
	                                    <div class="photo-box" id="photoBox3">
                                            <c:forEach items="${result[2]}" var="photo" varStatus="stat">
                                                <c:if test="${photo.photoid!=null}">
                                                    <a href="${flaskBaseUrl}/uploads/${photo.uploadname}" data-fancybox="gallery3">
                                                        <c:if test="${stat.index==0}">
                                                            <img src="${flaskBaseUrl}/uploads/${photo.uploadname}" id="profilePicPreview3" alt="식사기록 사진" class="responsive-img" style="display: block;">
                                                        </c:if>
                                                    </a>
                                                </c:if>
                                                <c:if test="${photo.photoid==null}">
                                                    <a href="/images/CClogo.png" data-fancybox="gallery3">
                                                        <c:if test="${stat.index==0}">
                                                            <img src="/images/CClogo.png" id="profilePicPreview3" alt="식사기록 사진" class="responsive-img" style="display: block;">
                                                        </c:if>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="photo-box" id="photoBox4">
                                            <c:forEach items="${result[3]}" var="photo" varStatus="stat">
                                                <c:if test="${photo.photoid!=null}">
                                                    <a href="${flaskBaseUrl}/uploads/${photo.uploadname}" data-fancybox="gallery4">
                                                        <c:if test="${stat.index==0}">
                                                            <img src="${flaskBaseUrl}/uploads/${photo.uploadname}"
                                                                 id="profilePicPreview4" alt="식사기록 사진" class="responsive-img" style="display: block;">
                                                        </c:if>
                                                    </a>
                                                </c:if>
                                                <c:if test="${photo.photoid==null}">
                                                    <a href="/images/CClogo.png" data-fancybox="gallery4">
                                                        <c:if test="${stat.index==0}">
                                                            <img src="/images/CClogo.png" id="profilePicPreview4" alt="식사기록 사진" class="responsive-img" style="display: block;">
                                                        </c:if>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item w-dyn-item w-col w-col-6">
	                            <div class="blog-item-div">

	                                <button id="myBtn" class="input-button1"><i class="fas fa-weight"></i> Input Weight </button>

	                                <!-- 모달 -->
	                                <div id="myModal" class="modal">
	                                    <div class="modal-content">
	                                        <span class="close">&times;</span>
	                                        <h2>2024년 07월 23일</h2>
	                                        <label for="weightInput">Weight:</label>
	                                        <div class="weightupdown">
	                                            <input type="number" id="weightInput" name="weightInput"><br><br>
	                                        </div>
	                                        <button id="submitWeight" class="input-button">OK</button>
	                                    </div>
	                                </div>

	                                <div class="blog-item-div">
	                                    <div class="content-container">
	                                        <div class="date-text-report">
	                                            <p style="font-size:200%;"></p>
	                                        </div>
	                                        <div class="chart-container">
	                                            <canvas id="chart1"></canvas>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	</section>
	<script>
      console.log("✅ JSP carbsum:", ${carbsum});
      console.log("✅ JSP proteinsum:", ${proteinsum});
      console.log("✅ JSP fatsum:", ${fatsum});
    </script>
    <div class="footer">
       	<div class="copyright-text">Calories Cut  -  Innovatively Yours: © 2025  🌟  Powered by <a href="#" class="copyright-text">Wade Jung</a>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=668501d6493a753e79314722" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script src="js/webflow.js" type="text/javascript"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const seldate = "${seldate}"; // ← 서버에서 받은 seldate

            console.log("seldate:", seldate);

            if (seldate) {
                const parts = seldate.split("-");
                document.getElementById("year").innerText = parts[0];
                document.getElementById("month").innerText = parts[1];
                document.getElementById("day").innerText = parts[2];

            }
        });

		var formData = new FormData();
		let foodinfo = {};
		let history = {1 : '아침', 2:"점심", 3:'저녁', 4:'간식'};
		<c:forEach items="${foodinfo}" var="food">
			foodinfo.${food.foodname} = ${food.calories};
		</c:forEach>
		console.log(foodinfo);
		let modal3 = $('#myModal3');
		let inputnumber = 1;
		//다이어리 입력 모달 열기
		$('.meal button').click(function(){
			inputnumber = $(this).attr('number');
			modal3.css('display', 'block');
		});
		//다이어리 입력 모달 닫기
		$('#myModal3 .close3').click(function(){
			modal3.css('display', 'none');
		});
		//매뉴얼 입력 클릭시
		$('#foodselect').click(function(){
			modal3.css('display', 'none');
			$('.photo-box-detail img').attr('src', 'images/CClogo.png');
			$('#myModal4').css('display','block');
		});
		//사진 업로드 클릭시
		$('#foodimgupload').click(function(){
			let id = 'profilePicInput'+inputnumber;
			document.getElementById(id).click();
		});
		
		//매뉴얼 입력 모달 닫기
		$('#myModal4 .close4').click(function(){
			$('#myModal4').css('display', 'none');	
		});
		
		// 매뉴얼 입력 카테고리검색
		const searchingfood = () => {
			let searchkey = $('.search-food').val();
			let foodcal = foodinfo[searchkey];
			if(foodcal){
				$('#search-food-name').text("This is " + searchkey);
				$('#serach-food-cal').text(foodcal);
			} else {
				$('#search-food-name').text("Try once again");
				$('#serach-food-cal').text(0);
				$('.search-food').val('');
			}
		};
		$('.search-food-insert').click(function(){
			searchingfood();
		});
		$('.search-food').keyup(function(evt){
			if(evt.keyCode==13)
				searchingfood();
		});
		$('.text_submit_btn').click(function(){
			formData.delete('foodname');
		    formData.append("foodname", $('.search-food').val());
			formData.delete('diarydate');
		    formData.append("diarydate", "${seldate}");
			formData.delete('history');
		    formData.append("history", history[inputnumber]);

		    $.ajax({
		        type: 'POST',
		        url: 'diary/saveManualDiary',
		        data: formData,
		        processData: false,
		        contentType: false,
		        success: function(data) {
                    alert(data.message); // "Upload success"
                    console.log("Flask 응답:", data);
                    $('#myModal4').css("display",'none');
                    location = "/diary?seldate=${seldate}";
                },
		        error: function(request, status, error) {
		            alert('Upload failed22');
		            console.error("Request status: ", status);
		            console.error("Error: ", error);
		            console.error("Request: ", request);
		        }
		    });
		});
		
		
		function openFileUploader(inputId) {
		    document.getElementById(inputId).click();
		}
		// 파일 선택 시 처리
        async function handleFileSelect(event, previewId, photoBoxId, mealType) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function(e) {
                $('.photo-box-detail img').attr('src', e.target.result);
            };
            reader.readAsDataURL(file);

            formData.delete('file');
            formData.append('file', file);
            formData.delete('history');
            formData.append('history', mealType);

            try {
                const result = await $.ajax({
                    type: 'POST',
                    url: 'https://health-api.wadeverse.net/upload',
                    data: formData,
                    processData: false,
                    contentType: false,
                    crossDomain: true,
                    xhrFields: { withCredentials: true },
                    dataType: "json",
                    timeout: 20000,
                });

                console.log("✅ Flask Response:", result);

                if (result.foodname === "Error") {
                    alert('사진이 올바르지 않습니다');
                    return;
                }

                $('#food-name').text(result.foodname);
                $('#selected-value').text(result.foodname);
                $('#options').val(result.foodname);
                $('#photo-cal-no').text($('#options option:selected').attr('cal'));

                formData.delete('photoid');
                formData.append('photoid', result.photoid);

                console.log("📸 Flask photoid:", result.photoid);

                modal2.style.display = "block";
            } catch (error) {
                console.error("🔥 Flask 업로드 실패:", error);
                alert('Networking error, Try again later!');
            } finally {
                // 같은 파일 다시 선택 가능하도록 초기화
                event.target.value = "";
            }
        }
			
		// 이미지분석 모달 확인버튼 클릭시 DB 사진저장 및 다이어리 저장
		$('.photo_submit_btn').click(function() {
			formData.delete('foodname');
		    formData.append("foodname", $('#food-name').text());
			formData.delete('diarydate');
		    formData.append("diarydate", "${seldate}");

		    // 날짜 변경
		    $.ajax({
		        type: 'POST',
		        url: 'diary/savePhotoDiary',
		        data: formData,
		        processData: false,
		        contentType: false,
		        success: function(data) {
		            //alert("Successfully saved picture!");
		            modal2.style.display = "none";
		            location = "/diary?seldate=${seldate}";
		        },
		        error: function(request, status, error) {
		            alert('Upload failed22');
		            console.error("Request status: ", status);
		            console.error("Error: ", error);
		            console.error("Request: ", request);
		        }
		    });
		});

		// 사진 업로드시 이벤트처리 리스너
		document.getElementById('profilePicInput1').addEventListener('change', function(event) {
		    handleFileSelect(event, 'profilePicPreview1', 'photoBox1', "아침");
		});
		document.getElementById('profilePicInput2').addEventListener('change', function(event) {
		    handleFileSelect(event, 'profilePicPreview2', 'photoBox2', "점심");
		});
		document.getElementById('profilePicInput3').addEventListener('change', function(event) {
		    handleFileSelect(event, 'profilePicPreview3', 'photoBox3', "저녁");
		});
		document.getElementById('profilePicInput4').addEventListener('change', function(event) {
		    handleFileSelect(event, 'profilePicPreview4', 'photoBox4', "간식");
		});

		
				
		// 일일권장량 수정
		if ("${userinfo.gender}" == "남자") {
		    //기초대사량(BMR)
		    var bmr = 88.362 + (13.397 * Number(${userinfo.weight})) + (4.799 * Number(${userinfo.height})) - (5.677 * Number(${userinfo.age}));
		} else {
		    var bmr = 447.563 + (9.247 * Number(${userinfo.weight})) + (3.098 * Number(${userinfo.height})) - (4.33 * Number(${userinfo.age}));
		}
		//목표에 따른 계산
		const goalvalue = {
		    '체중감량': 0.75,
		    '근육증량': 1.1,
		    '체중유지': 1
		} ["${userinfo.goal}"] || 1;
						   
		//일일에너지소비(TDEE)
		const actvalue = {
		    '비활동적': 1.2,
		    '저활동적': 1.375,
		    '활동적': 1.55,
		    '매우활동적': 1.725
		} ["${userinfo.activity}"] || 1.2;
		let tdee = bmr * actvalue;
		let goal = tdee * goalvalue;

		//권장 칼로리, 탄단지
		var recomandcal = Math.floor(goal);
		var a = Math.floor(recomandcal*0.35);
		var b = Math.floor(recomandcal*0.2);
		var c = recomandcal-((a*2)+b);
		$('.recomandcal').text(Math.floor(goal)+"kcal");
		$('.rmcal1').text(${calsum1}+"/"+Math.floor(recomandcal*0.35)+"kcal");
		$('.rmcal2').text(${calsum2}+"/"+Math.floor(recomandcal*0.35)+"kcal");
		$('.rmcal3').text(${calsum3}+"/"+Math.floor(recomandcal*0.2)+"kcal");
		$('.rmcal4').text(${calsum4}+"/"+c+"kcal");
			
		// 섭취 탄단지
		var carbg = Math.floor(${carbsum});
		var proteing = Math.floor(${proteinsum});
		var fatg = Math.floor(${fatsum});
		
		// 탄단지 출력
		$('.nutri1').text(carbg+"/"+Math.floor(recomandcal*0.55/4)+"g");
		$('.nutri2').text(proteing+"/"+Math.floor(recomandcal*0.25/4)+"g");
		$('.nutri3').text(fatg+"/"+Math.floor(recomandcal*0.20/9)+"g");
		// 프로그레스바 수정
		$('.progress-carb').css('width', (${carbsum} / (recomandcal * 0.55 / 4)) * 100 + '%');
        $('.progress-protein').css('width', (${proteinsum} / (recomandcal * 0.25 / 4)) * 100 + '%');
        $('.progress-fat').css('width', (${fatsum} / (recomandcal * 0.20 / 9)) * 100 + '%');
		
		
		//권장, 섭취 칼로리 차트
		const totalCalories = recomandcal;
		const consumedCalories = ${calsum1+calsum2+calsum3+calsum4};
		let remainingCalories = totalCalories - consumedCalories<0?0:totalCalories - consumedCalories;
			
		//섭취량, 잔여량, 운동칼로리 변경
		$('.calsum').text(consumedCalories+"kcal");
		$('.remainingcal').text(remainingCalories+"kcal");
		if('${workcal.workcal}'!='')
			$('.caloriesBurned').text('${workcal.workcal}kcal');
		
		const data = {
		    labels: ['Calorie intake', 'Calories left'],
		    datasets: [{
		        data: [consumedCalories, remainingCalories],//<0?0:remainingCalories],	// 섭취칼로리 오버시 조정
		        backgroundColor: ['#FF6384', '#36A2EB'],
		        hoverBackgroundColor: ['#FF6384', '#36A2EB']
		    }]
		};

		const options = {
		    responsive: true,
		    maintainAspectRatio: false,
		    cutout: '80%',
		    plugins: {
		        tooltip: {
		            callbacks: {
		                label: function(tooltipItem) {
		                    return tooltipItem.label + ': ' + tooltipItem.raw + ' kcal';
		                }
		            }
		        },
		        legend: {
		            display: false
		        },
		        title: {
		            display: true,
		            position: 'center'
		        }
		    },

		};

		const ctx = document.getElementById('calorieChart').getContext('2d');
		
		Chart.register({
		    id: 'centerText',
		    beforeDraw: function (chart) {
		        if (chart.config.type === 'doughnut') {
		            const width = chart.width;
		            const height = chart.height;
		            const ctx = chart.ctx;

		            const text = remainingCalories + ' kcal';
		            const fontSize = (height / 114).toFixed(2);
		            ctx.font = fontSize + "em sans-serif";
		            ctx.textBaseline = "middle";
		            ctx.fillStyle = 'white'; // Set text color here

		            const textX = Math.round((width - ctx.measureText(text).width) / 2);
		            const textY = height / 2;

		            ctx.fillText(text, textX, textY);
		        }
		    }
		});
		// 권장, 섭취 칼로리 생성
		new Chart(ctx, {
		    type: 'doughnut',
		    data: data,
		    options: options
		});		
					
			
		// 몸무게 가져오기
		var chartweights = [];
		var chartdays = []; // [7/30, 7/29, 7/28] / [7/29, 7/28, 7/26], [7/29, 7/28, 7/26]
		for (let i = 0; i < 2; i++) {
		    chartdays[i] = [];
		} 
		<c:forEach items = "${weights}" var = "weight">
		chartweights.push(${weight.weight});
		chartdays[0].push("${weight.weightdate}"); 
		</c:forEach>

		
		// 몸무게, 칼로리, 탄단지 차트
		// 일별 칼로리, 탄단지 서버에서 가져온 값 세팅
		var chartcalsum = [];
		var chartcarbsum = [];
		var chartproteinsum = [];
		var chartfatsum = [];
		<c:forEach items="${chartdatas}" var="chartdata">
			chartcalsum.push(${chartdata.calsum});
			chartcarbsum.push(${chartdata.carbsum});
			chartproteinsum.push(${chartdata.proteinsum});
			chartfatsum.push(${chartdata.fatsum});
			chartdays[1].push("${chartdata.diarydate}");
		</c:forEach>		
		
		const ctx1 = document.getElementById('chart1').getContext('2d');
		
		let chartDataSets = [
		    {
		        label: '일별 몸무게',
		        data: chartweights,
		        backgroundColor: 'rgba(255, 99, 132, 0.2)',
		        borderColor: 'rgba(255, 99, 132, 1)',
		        borderWidth: 1
		    },
		    {
		        label: '일별 칼로리',
		        data: chartcalsum,
		        backgroundColor: 'rgba(54, 162, 235, 0.2)',
		        borderColor: 'rgba(54, 162, 235, 1)',
		        borderWidth: 1
		    },
		    {
		        label: '일별 탄수화물',
		        data: chartcarbsum,
		        backgroundColor: 'rgba(60, 255, 0, 0.2)',
		        borderColor: 'rgba(60, 255, 0, 1)',
		        borderWidth: 1
		    },
		    {
				label: '일별 단백질',
			    data: chartproteinsum, // 두 번째 데이터
			    backgroundColor: 'rgba(255, 182, 193, 0.5)', // 파스텔 핑크
			    borderColor: 'rgba(255, 218, 185, 1)', // 파스텔 살구
			    borderWidth: 1
		    },
		    {
				label: '일별 지방',
			    data: chartfatsum, // 세 번째 데이터
			    backgroundColor: 'rgba(230, 230, 250, 0.5)', // 파스텔 퍼플
			    borderColor: 'rgba(148, 0, 211, 1)', // 다크 보라색
			    borderWidth: 1
		    }
		];

		// 차트 카테고리 변수 - 몸무게, 칼로리, 탄단지
		let currentChartType = 0;

		const myChart1 = new Chart(ctx1, {
		    type: 'line',
		    data: {
		        labels: chartdays[currentChartType], //['Red', 'Blue', 'Yellow', 'Green', 'Purple'],
		        datasets: [chartDataSets[currentChartType]]
		    },
		    options: {
		        responsive: true,
		        maintainAspectRatio: false,
		        plugins: {
		            legend: {
		                position: 'top',
		                onClick: function(event, legendItem, legend) {
		                    const index = legendItem.datasetIndex;
		                    if (index === 0) { // Assuming the first label is the one to toggle
		                        currentChartType = (currentChartType + 1) % chartDataSets.length;
		                        myChart1.data.datasets = [chartDataSets[currentChartType]];
								if(currentChartType==0)
									myChart1.data.labels = chartdays[0];
								else myChart1.data.labels = chartdays[1];
		                        myChart1.update();
		                    }
		                }
		            },
		            title: {
		                display: true,
		                text: '일별차트'
		            }
		        }
		    }
		});
			
		// 모달 요소 가져오기
		const modal = document.getElementById("myModal");
		// 모달을 여는 버튼 가져오기
		const btn = document.getElementById("myBtn");
		// 모달을 닫는 <span> 요소 가져오기
		const span = document.getElementsByClassName("close")[0];		
		// 모달 요소 가져오기
		const modal2 = document.getElementById("myModal2");
		// 모달을 닫는 <span> 요소 가져오기
		const span2 = document.getElementsByClassName("close2")[0];
		// 제출 버튼 가져오기
		const submitBtn = document.getElementById("submitWeight");
		
		// 버튼을 클릭하면 모달을 엽니다
		btn.onclick = function() {
		    modal.style.display = "block";
		}

		// <span>을 클릭하면 모달을 닫습니다
		span.onclick = function() {
		    modal.style.display = "none";
		}
		span2.onclick = function() {
		    modal2.style.display = "none";
		}

		// 모달 외부를 클릭하면 모달을 닫습니다
		window.onclick = function(event) {
		    if (modal.style.display=="block" && event.target == modal ) {
		        modal.style.display = "none";
		    } 
			if (modal2.style.display=="block" && event.target == modal2) {
		        modal2.style.display = "none";
		    }
			if(modal3.css('display')=='block' && event.target == modal3[0]){
				modal3.css('display', 'none');
			}
		}

		// 몸무게 입력 함수
		const weightinputfunc = ()=>{
			const weightInput = document.getElementById("weightInput").value;
		    if (weightInput) {
        
				$.ajax({
					type : "get",
					url : "diary/saveWeight?weight="+weightInput+"&weightdate=${seldate}",
					success : function(result){
						alert("입력성공");
						location = "/diary?seldate=${seldate}";
					},
					error : function(stat, err, c){
						alert('입력실패');
						console.log(stat);
						console.log(err);
						console.log(c);
					}
				});
		        // 모달을 닫습니다
		        modal.style.display = "none";
		    }
		}
		// 제출 버튼 클릭 시 차트 데이터에 몸무게 추가
		submitBtn.onclick = function() {
			weightinputfunc();
		}
		// 몸무게 입력 엔터키 이벤트
		$('#weightInput').keyup(function(evt){
			if(evt.keyCode==13)
				weightinputfunc();
		});
		
		
		// JavaScript로 호버 이벤트 처리
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
			

		  
		  // <span>을 클릭하면 모달을 닫기
		  span2.onclick = function() {
		      modal2.style.display = "none";
		  }

		  
		  
		// 몸무게 모달에 오늘날짜 입력
		var date = new Date();
		year = $('#year').text();//date.getFullYear();
		month = $('#month').text(); //date.getMonth()+1;
		date = $('#day').text(); //date.getDate();
					
					
		// 모달 음식변경 셀렉트박스 드롭다운
		document.getElementById('edit-text').addEventListener('click', function() {
		var dropdownContainer = document.getElementById('dropdown-container');
		dropdownContainer.style.display = 'block';
		dropdownContainer.scrollIntoView({ behavior: 'smooth' });

	  	// 여기서 label 문구를 동적으로 변경할 수 있습니다.
	  	var dropdownLabel = document.getElementById('dropdown-label');
	  	dropdownLabel.textContent = 'Choose the correct food:';
  		});

  		document.getElementById('options').addEventListener('change', function() {
	  	var selectedValue = document.getElementById('options').value;
		  
	  	// selected-value와 food-name 요소의 텍스트를 변경합니다.
	  	document.getElementById('selected-value').textContent = selectedValue;
	  	document.getElementById('food-name').textContent = selectedValue;
	  	$('#photo-cal-no').text($('#options option:selected').attr('cal'));
	  	var dropdownContainer = document.getElementById('dropdown-container');
	  	dropdownContainer.style.display = 'none';
  		});
		
		<c:set var="seldates" value="${fn:split(seldate,'-')}"/>
		<c:set var="year" value="${seldates[0]}"/>
		<c:set var="month" value="${seldates[1]}"/>
		<c:set var="date" value="${seldates[2]}"/>
		let currentDate = new Date(${year}, ${month-1}, ${date}); // 2024년 8월 1일 (월은 0부터 시작)
				
        // 새로운 날짜 포맷
        const newYear = currentDate.getFullYear();
        const newMonth = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작
        const newDay = String(currentDate.getDate()).padStart(2, '0');

		// 몸무게 모달에 선택날짜 입력
		$('#myModal h2').text(newYear+" - "+newMonth+" - "+newDay);
		
        // 각 숫자 요소
        const yearElement = document.getElementById('year');
        const monthElement = document.getElementById('month');
        const dayElement = document.getElementById('day');

        // 연도 변경 처리 (애니메이션 없음)
        if (yearElement.innerText !== newYear) {
             // 새로운 연도로 변경
			yearElement.classList.add('hidden');
            setTimeout(() => {
                yearElement.innerText = newYear; // 새로운 월로 변경
                yearElement.classList.remove('hidden'); // 월 표시
            }, 300);
        }

        // 월 변경 처리
        if (monthElement.innerText !== newMonth) {
            monthElement.classList.add('hidden'); // 월 숨김
            setTimeout(() => {
                monthElement.innerText = newMonth; // 새로운 월로 변경
                monthElement.classList.remove('hidden'); // 월 표시
            }, 300);
        }

        // 일 변경 처리
        if (dayElement.innerText !== newDay) {
            dayElement.classList.add('hidden'); // 일 숨김
            setTimeout(() => {
                dayElement.innerText = newDay; // 새로운 일로 변경
                dayElement.classList.remove('hidden'); // 일 표시
            }, 300);
	 	}
						
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month  + '-' + day;
		if(dateString=="${seldate}") {
			$('.right').css('color','#333333');
			$('.right').css('cursor','none');
		}
		$('.diary-date-left').click(function(){
			
			if($(this).hasClass('left')===true)
				currentDate.setDate(currentDate.getDate()-1);
			else {
				if(dateString=="${seldate}") return;
				currentDate.setDate(currentDate.getDate()+1);
			}
			year = currentDate.getFullYear();
			month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
			date = ('0' + currentDate.getDate()).slice(-2);
			nextdate = year+"-"+month+"-"+date;
			location = "diary?seldate="+nextdate;
		});
				
</script>
</body>

</html>