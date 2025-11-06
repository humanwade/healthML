<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html data-wf-page="668501d6493a753e79314790" data-wf-site="668501d6493a753e79314722">

<head>
    <meta charset="utf-8">
    <title>Report</title>
    <meta content="Blog" property="og:title">
    <meta content="Blog" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
    <link href="../css/webflow.css" rel="stylesheet" type="text/css">
    <link href="../css/jades-ultra-awesome-site-d9185c.webflow.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
	<style>

		.calendar-container {
		    width: 300px;
		    border: 1px solid #555;
		    border-radius: 5px;
		    padding: 20px;
		    background-color: #333;
		}

		.calendar-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-bottom: 10px;
		}

		.calendar-header button {
		    background: none;
		    border: none;
		    color: #fff;
		    cursor: pointer;
		    font-size: 18px;
		}

		.current-month-year {
		    font-size: 16px;
		    font-weight: bold;
		}

		.calendar-body {
		    padding-bottom: 10px;
		}

		.calendar-days,
		.calendar-dates {
		    display: flex;
		    flex-wrap: wrap;
		}

		.calendar-days div,
		.calendar-dates div {
		    width: 14.28%;
		    text-align: center;
		    padding: 5px 0;
		}

		.calendar-days div {
		    color: #ccc;
		}

		.calendar-dates div {
		    cursor: pointer;
		}

		.calendar-dates div:hover {
		    background-color: #444;
		}

		.calendar-dates .inactive {
		    color: #555;
		}

		.selected-date {
		    text-align: center;
		    margin-top: 10px;
		    font-size: 18px;
		}

		.prev, .next {
		    margin-top: -14px;
		    width: 41px;
		    height: 41px;
		    font-size: 0px !important;
		    color: #666;
		    position: absolute;
		    top: 48%;
		    z-index: 1;
		    background: url(//pics.auction.co.kr/pc/hp/new_homepage.png) no-repeat -786px -314px;
		    cursor: pointer;
		}
		
		.photos-report .next {
		    right: -7px;
		    background-position: -835px -258px;
		    width: 34px;
		    height: 41px;
			}
			
		.photos-report .prev {
			left: -7px;
		    background-position: -788px -257px;
		    width: 34px;
		    height: 41px;
		}
		
		.photo-box-report.active {
		    display: block; /* 활성화된 슬라이드만 보이도록 함 */
		}
		

		.photos-report {
		    position: relative;
		    overflow: hidden;
			transition: transform 0.5s ease;
			}
		
		
			.no-images {
				background-color: #2b2b2b;
			    border: 1px solid #444;
			    border-radius: 10px;
			    padding: 20px;
			    width: 30%;
			    text-align: center;
			    color: #fff;
			    margin-bottom: 20px;
			    height: 300px;
			    overflow: hidden;
			    display: inline-block;
			    transition: opacity 0.5s ease;
				text-align:center;
				font-weight:bold;
				line-height: 1.8rem;
				display: flex; /* Flexbox 사용 */
				justify-content: center; /* 가로 정중앙 배치 */
				align-items: center; /* 세로 정중앙 배치 */
			}
			
			@media (max-width: 768px){
				.no-images{
					width:60%;
				}
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
    <link href="../images/wj-logo.png" rel="shortcut icon" type="../image/x-icon">
    <link href="../images/webclip.png" rel="apple-touch-icon">

    <!-- Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
					<a href="../exercise" aria-current="page" class="menu-item w-nav-link">exercise</a>
                    <a href="../diary" class="menu-item w-nav-link">diary</a>
                   
					<a href='../mypage'><img src="/userphotos/${sessionScope.profile}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%;  class="profile-img w-nav-link" ></a>
		        	  <div class="dropdown2">
						<span class="dropdown-real-mypage"><a href="/mypage">Mypage</a></span>
						<span class="dropdown-item"><a href="/diary/report">report</a></span>
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
                    <div class="sitemap-page"><img src="../images/sitemap_blog_4sitemap_blog_03.png" loading="lazy" alt="" class="sitemap-image">
                        <h4 class="sitemap-title">REPORT</h4>
                    </div>
                    <div class="sitemap-info"><img src="../images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="sitemap-dot">
                        <div class="sitemap-text">History</div>
                    </div>
                </div>
                <div class="blog-wrapper">
                    <div class="blog-list-wrapper w-dyn-list">
                        <div role="list" class="blog-list w-dyn-items w-row">
                            <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item1 w-dyn-item w-col w-col-6">
                                <div class="blog-item-div">
                                    <div class="content-container">
                                        
										<div class="calendar">
										    <div class="calendar-header">
										        <button class="prev-month">&#8249;</button>
										        <span class="month-year"></span>
										        <button class="next-month">&#8250;</button>
										    </div>
										    <div class="calendar-body">
										        <div class="calendar-days">
										            <div>Sun</div>
										            <div>Mon</div>
										            <div>Tue</div>
										            <div>Wed</div>
										            <div>Thu</div>
										            <div>Fri</div>
										            <div>Sat</div>
										        </div>
										        <div class="calendar-dates"></div>
										    </div>
										</div>
										<div class="photos-report">
										        <c:forEach items="${diaries}" var="diary" end='2'>
										            <div class="photo-box-report">
														<span class="close">&times;</span>
														<c:if test="${diary.uploadname!=null}">
										                	<img src="https://health-api.wadeverse.net/uploads/${diary.uploadname}" alt="${diary.datano}">
														</c:if>
														<c:if test="${diary.uploadname==null}">
										                	<img src="/images/CClogo.png" alt="${diary.datano}">
														</c:if>
										            </div>
										        </c:forEach>
												<c:if test="${empty diaries}">
													<div class="photo-box-report no-images">You can check it after upload picture</div>
												</c:if>
												<button class="prev">이전</button>
												<button class="next">다음</button>	
										    </div>
                                        </div>
                                </div>
                                <div class="blog-item-div">
                                    <div class="content-container">
										<div class="date-text-report">
										    <button id="yearButton">Avg Cals</button>
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
    <div class="footer">
        <div class="copyright-text">Calories Cut  -  Innovatively Yours: © 2025  🌟  Powered by <a href="#" class="copyright-text">Wade Jung</a>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=668501d6493a753e79314722" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../js/webflow.js" type="text/javascript"></script>
    <script>
        // 첫 번째 차트 (Line Chart)
		var ctx1 = document.getElementById('chart1').getContext('2d');
		var carbsum=[0,0,0,0,0];
		var proteinsum = [0,0,0,0,0];
		var fatsum = [0,0,0,0,0];
		var calsum = [0,0,0,0,0];
		<c:forEach items="${reports}" var="report">
			carbsum[${report.week-1}] = carbsum[${report.week-1}]+${report.carbsum};
			proteinsum[${report.week-1}] = proteinsum[${report.week-1}]+${report.proteinsum};
			fatsum[${report.week-1}] = fatsum[${report.week-1}]+${report.fatsum};
			calsum[${report.week-1}] = calsum[${report.week-1}]+${report.calsum};
		</c:forEach>
		linechartdata = 	{
						    type: 'line',
						    data: {
								labels: ['1주차', '2주차', '3주차', '4주차', '5주차'],
								    datasets: [
									{
									    label: 'Cals',
									    data: carbsum,
									    backgroundColor: 'rgba(255, 153, 153, 0.1)', // 파스텔톤 빨강
									    borderColor: 'rgba(255, 99, 132, 1)', // 선 색상
									    borderWidth: 3,
									    pointBackgroundColor: '#fff',
									    pointBorderColor: 'rgba(255, 99, 132, 1)',
									    pointBorderWidth: 2,
									    pointRadius: 5,
									    fill: true
									},
									{
									    label: 'Protein',
									    data: proteinsum,
									    backgroundColor: 'rgba(153, 204, 255, 0.1)', // 파스텔톤 파랑
									    borderColor: 'rgba(54, 162, 235, 1)',
									    borderWidth: 3,
									    pointBackgroundColor: '#fff',
									    pointBorderColor: 'rgba(54, 162, 235, 1)',
									    pointBorderWidth: 2,
									    pointRadius: 5,
									    fill: true
									},
									{
									    label: 'Fat',
									    data: fatsum,
									    backgroundColor: 'rgba(153, 255, 153, 0.1)', // 파스텔톤 초록
									    borderColor: 'rgba(60, 255, 0, 1)',
									    borderWidth: 3,
									    pointBackgroundColor: '#fff',
									    pointBorderColor: 'rgba(60, 255, 0, 1)',
									    pointBorderWidth: 2,
									    pointRadius: 5,
									    fill: true
									}
								    ]
						    },
						    options: {
						        responsive: true,
						        maintainAspectRatio: false,
						        plugins: {
						            legend: {
						                position: 'top',
						            },
						            title: {
						                display: true,
						                text: 'Avg cal/pro/fat'
						            }
						        }
						    }
						};
		var myChart1 = new Chart(ctx1, linechartdata);

		var barData = {
		    labels: ['1주차', '2주차', '3주차', '4주차', '5주차'],
		    datasets: [{
				label: '칼로리',
				        data: calsum,
						backgroundColor: [
						    'rgba(255, 153, 153, 0.8)', // 파스텔톤 빨강
						    'rgba(153, 204, 255, 0.8)', // 파스텔톤 파랑
						    'rgba(255, 255, 153, 0.8)', // 파스텔톤 노랑
						    'rgba(153, 255, 204, 0.8)', // 파스텔톤 초록
						    'rgba(204, 153, 255, 0.8)'  // 파스텔톤 보라
						],
						borderColor: [
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)'  // 화이트 테두리
						],
						borderWidth: 2,
						hoverBackgroundColor: [
						    'rgba(255, 153, 153, 1)', // 파스텔톤 빨강
						    'rgba(153, 204, 255, 1)', // 파스텔톤 파랑
						    'rgba(255, 255, 153, 1)', // 파스텔톤 노랑
						    'rgba(153, 255, 204, 1)', // 파스텔톤 초록
						    'rgba(204, 153, 255, 1)'  // 파스텔톤 보라
						],
						hoverBorderColor: [
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)', // 화이트 테두리
						    'rgba(255, 255, 255, 1)'  // 화이트 테두리
						]

		    }]
		};

		// 차트를 전환하는 함수
		function toggleChart() {
		    if (myChart1.config.type === 'line') {
		        myChart1.destroy(); // 기존 라인 차트 파괴
		        myChart1 = new Chart(ctx1, {
		            type: 'bar',
		            data: barData,
		            options: {
		                responsive: true,
		                maintainAspectRatio: false,
		                plugins: {
		                    legend: {
		                        position: 'top',
		                    },
		                    title: {
		                        display: true,
		                        text: '평균칼로리'
		                    }
		                }
		            }
		        });
		        document.getElementById('yearButton').innerText = '평균탄단지보기'; // 버튼 텍스트 변경
		    } else {
		        myChart1.destroy(); // 기존 막대 차트 파괴
		        myChart1 = new Chart(ctx1, linechartdata);
		        document.getElementById('yearButton').innerText = '평균칼로리보기'; // 버튼 텍스트 변경
		    }
		}

		// 버튼 클릭 이벤트 리스너
		document.getElementById('yearButton').addEventListener('click', toggleChart);

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


				  // 달력
				  // 문서의 모든 내용이 로드된 후 실행
				  document.addEventListener('DOMContentLoaded', function () {
				      // 달력 요소를 선택
				      const calendarElement = document.querySelector('.calendar');
				      // 년도와 월을 표시할 요소 선택
				      const monthYearElement = calendarElement.querySelector('.month-year');
				      // 날짜를 표시할 요소 선택
				      const datesElement = calendarElement.querySelector('.calendar-dates');
				      // 이전 달로 이동 버튼 요소 선택
				      const prevMonthButton = calendarElement.querySelector('.prev-month');
				      // 다음 달로 이동 버튼 요소 선택
				      const nextMonthButton = calendarElement.querySelector('.next-month');

				      // 현재 날짜를 저장
				      let currentDate = new Date("${seldate}");

				      // 달력을 렌더링하는 함수
				      function renderCalendar(date) {
				          // 현재 연도와 월을 가져옴
				          const year = date.getFullYear();
				          const month = date.getMonth();
				          // 이번 달의 첫 번째 날의 요일을 가져옴 (0: 일요일, 6: 토요일)
				          const firstDayOfMonth = new Date(year, month, 1).getDay();
				          // 이번 달의 마지막 날짜를 가져옴
				          const lastDateOfMonth = new Date(year, month + 1, 0).getDate();
				          // 이전 달의 마지막 날짜를 가져옴
				          const lastDayOfPrevMonth = new Date(year, month, 0).getDate();

				          // 헤더에 년도와 월 설정
				          monthYearElement.textContent = year + "-" + (month+1);

				          // 이전의 날짜 목록을 모두 지움
				          datesElement.innerHTML = '';

				          // 이전 달의 날짜를 표시
				          for (let i = firstDayOfMonth - 1; i >= 0; i--) {
				              const dayElement = document.createElement('div');
				              dayElement.classList.add('inactive'); // 비활성화된 날짜로 표시
				              dayElement.textContent = lastDayOfPrevMonth - i;
				              datesElement.appendChild(dayElement);
				          }

				          // 이번 달의 날짜를 표시
				          for (let i = 1; i <= lastDateOfMonth; i++) {
				              const dayElement = document.createElement('div');
				              dayElement.textContent = i;
				              datesElement.appendChild(dayElement);
				          }

				          // 다음 달의 날짜를 표시
				          const totalDates = firstDayOfMonth + lastDateOfMonth;
				          const nextMonthDates = (Math.ceil(totalDates / 7) * 7) - totalDates;

				          for (let i = 1; i <= nextMonthDates; i++) {
				              const dayElement = document.createElement('div');
				              dayElement.classList.add('inactive'); // 비활성화된 날짜로 표시
				              dayElement.textContent = i;
				              datesElement.appendChild(dayElement);
				          }
				      }

				      // 이전 달 버튼 클릭 이벤트 처리
				      prevMonthButton.addEventListener('click', function () {
				          currentDate.setMonth(currentDate.getMonth() - 1); // 현재 날짜를 이전 달로 설정
						  year = currentDate.getFullYear();
  						  month = ("0"+(currentDate.getMonth()+1)).slice(-2);
  						  location = "report?seldate="+year+"-"+month+"-"+"01";
				          //renderCalendar(currentDate); // 달력 다시 렌더링
				      });

				      // 다음 달 버튼 클릭 이벤트 처리
				      nextMonthButton.addEventListener('click', function () {
						  currentDate.setMonth(currentDate.getMonth() + 1); // 현재 날짜를 다음 달로 설정
						  year = currentDate.getFullYear();
						  month = ("0"+(currentDate.getMonth()+1)).slice(-2);
						  location = "report?seldate="+year+"-"+month+"-"+"01";
				          //renderCalendar(currentDate); // 달력 다시 렌더링
				      });

				      // 초기 달력 렌더링
				      renderCalendar(currentDate);

					  // 날짜 클릭시 선택 날짜 페이지
	  				  $('.calendar-dates').on('click', 'div:not(.inactive)', function(){
                          let text = $('.month-year').text().trim();
                          text = text.replace(/\s+/g, '');
                          const [year, month] = text.split('-');
                          const day = ("0" + $(this).text()).slice(-2);
                          const seldate = year + "-" + ("0" + month).slice(-2) + "-" + day;

                          console.log("seldate:", seldate);
                          location = "report?seldate=" + seldate;
                      });

				  }); // end dom loaded 이벤트

				// 달력에 해당날짜 표시 (클래스추가 + css)
				$(function(){
					let d = Number('${seldate}'.slice(-2));
				$('.calendar-dates div').filter(function() {
					 return $(this).text()==d && !$(this).hasClass('inactive');
					}).addClass('select-day');
				});


				let item = [];
				let itemtotal = ${diaries.size()};
				let pagetotal = Math.floor((itemtotal-1) / 3) + 1;
				let page = 1;

				<c:forEach items="${diaries}" var="diary">
				    item.push({"img":'${diary.uploadname}', "diaryno" : '${diary.datano}'});
				</c:forEach>

				function updateSlides() {
                    if (itemtotal === 0) {
                        // 이미지가 없을 때 처리
                        $('.photos-report').html('<div class="photo-box-report no-images">이미지 업로드시 확인 가능</div>');
                    } else {
                        // 이미지가 있을 때의 처리
                        let start = (page - 1) * 3;
                        let end = start + 3;
                        if (item.length < end) end = item.length;

                        let aa = "";
                        // ✅ JSP 내에서 contextPath를 JS 변수로 전달
                        let contextPath = '${pageContext.request.contextPath}';

                        for (let i = start; i < end; i++) {
                            aa += '<div class="photo-box-report">'
                                + '<span class="close">&times;</span>'; // X 버튼 추가

                            if (item[i].img != '')
                                aa += '<img src="https://health-api.wadeverse.net/uploads/' + item[i].img + '" alt="' + item[i].diaryno + '">';
                            else
                                aa += '<img src="../images/CClogo.png" alt="' + item[i].diaryno + '">';

                            aa += '</div>';
                        }

                        aa += `<button class="prev">이전</button>
                               <button class="next">다음</button>`;

                        $('.photos-report').fadeOut(300, function () { // 페이드 아웃 효과
                            $(this).empty().append(aa).fadeIn(300);  // 새로운 내용을 추가하고 페이드 인 효과
                        });
                    }
                }


				// X 버튼 클릭 이벤트 추가
		        $('.photos-report').on('click','.close', function() {
					let id = $(this).next().attr('alt');
					location = 'deleteDiary?datano='+id+'&seldate=${param.seldate}';
		           /* $(this).parent('.photo-box-report').fadeOut(300, function() {
		                //$(this).remove(); // X 버튼 클릭 시 해당 박스 제거
		            });	*/
		        });

				//updateSlides();  // 처음 페이지 로드 시 실행

				$('.photos-report').on('click', '.next', function () {
				    if (page < pagetotal) {
				        page += 1;
				        updateSlides();
				    }
				});

				$('.photos-report').on('click', '.prev', function () {
				    if (page > 1) {
				        page -= 1;
				        updateSlides();
				    }
				});
    </script>
</body>

</html>
