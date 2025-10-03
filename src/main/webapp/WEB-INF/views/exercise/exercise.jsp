<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://webflow.com  -->
<!--  Last Published: Wed Jul 03 2024 07:46:48 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="668501d6493a753e79314790" data-wf-site="668501d6493a753e79314722">

<head>
    <meta charset="utf-8">
    <title>Exercise</title>
    <meta content="Blog" property="og:title">
    <meta content="Blog" property="twitter:title">
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
</head>

<body class="body">
	
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-wrapper w-nav">
        <div class="main-container w-container">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo w-nav-brand"><img src="images/CClogo.png" loading="lazy" width="146" sizes="(max-width: 479px) 100vw, 146px" alt="" srcset="images/CClogo.png 500w, images/CClogo.png 740w" class="logo"></a>
                <nav role="navigation" class="main-nav w-nav-menu">
                    <a href="index" class="menu-item w-nav-link">Home</a>
                    <a href="recipe" class="menu-item w-nav-link">recipe</a>
                    <a href="news" class="menu-item w-nav-link">news</a>
					<a href="exercise" aria-current="page" class="menu-item w-nav-link w--current">exercise</a>
                    <a href="diary" class="menu-item w-nav-link">diary</a>
					<a href='#'><img src="userphotos/${sessionScope.profile}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%;  class="profile-img w-nav-link" ></a>
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
        <div class="inner-pages-wrap">
            <div class="w-layout-blockcontainer main-container w-container">
                <div class="site-map">
                    <div class="sitemap-page"><img src="images/sitemap_img2_1sitemap_img2.png" loading="lazy" alt="" class="sitemap-image">
                        <h4 class="sitemap-title">exercise</h4>
                    </div>
					
					<div class="search-container">
					    <input class='worksearch' type="text" placeholder="Search here...">
					    <button type="submit" class="search-button">Search</button>
					</div>
                </div>
                <div class="blog-wrapper">
                    <div class="blog-list-wrapper w-dyn-list">
                        <div role="list" class="blog-list w-dyn-items w-row">
							<c:forEach items="${list}" var="workout" varStatus="stat">
							    <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item w-dyn-item w-col w-col-6">
							        <div class="blog-item-div">
							            <a href="exercise/detail?exerciseno=${workout.workid}" class="link-to-single-post w-inline-block">
							                <img loading="lazy" src="https://i.ytimg.com/vi/${workout.workvideoid}/hqdefault.jpg" alt="${workout.workid}" sizes="(max-width: 479px) 70vw, (max-width: 767px) 81vw, (max-width: 1919px) 39vw, 586.609375px" class="blog-main-image2">
							            </a>
							            <a href="exercise/detail?exerciseno=${workout.workid}" class="link-to-single-post w-inline-block">
							                <h3 class="blog-title">${workout.workname}</h3>
							            </a>
							            <p class="blog-paragraph">${workout.workcategory}</p>
							            <div class="blog-time">${workout.workcategory}</div>
							        </div>
							    </div>
							</c:forEach>
                        </div>
						<div class="paging-container">
						    <a href="exercise?page=${startPage-5}" class="page-link prev">&laquo; Previous</a>
							<c:forEach var="pno" begin="${startPage}" end="${endPage}" varStatus="status">
								<c:choose> 
									<c:when test="${status.count == ((page-1)%5+1) }">
										<a href="exercise?page=${pno}" class="page-link active">${pno}</a>
									</c:when>
									<c:otherwise>
						    			<a href="exercise?page=${pno}" class="page-link">${pno}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						    <a href="exercise?page=${endPage+1}" class="page-link next">Next &raquo;</a>
							<span></span>
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
    <script src="js/webflow.js" type="text/javascript"></script>
	<script>
		//검색어 유지
		$('.worksearch').val('${param.search}');
		
		//검색기능
		const searching = ()=>{
			let searchword = $('.worksearch').val();
			if(searchword != '')
				location = 'exercise?search='+searchword;
			else location = 'exercise';
		};
		$('.search-button').click(function(){
			searching();
		});
		$('.worksearch').keyup(function(e){
			if(e.keyCode==13) searching();
		});
	</script>
</body>

</html>