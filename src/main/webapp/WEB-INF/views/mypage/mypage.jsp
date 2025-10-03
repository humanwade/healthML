<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>

<body class="body">
	
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-wrapper w-nav">
        <div class="main-container w-container">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo w-nav-brand"><img src="../images/CClogo.png" loading="lazy" width="146" sizes="(max-width: 479px) 100vw, 146px" alt="" srcset="../images/CClogo.png 500w, ../images/CClogo.png 740w" class="logo"></a>
                <nav role="navigation" class="main-nav w-nav-menu">
                    <a href="index" class="menu-item w-nav-link">Home</a>
                    <a href="recipe" class="menu-item w-nav-link">recipe</a>
                    <a href="news" class="menu-item w-nav-link">news</a>
					<a href="exercise" aria-current="page" class="menu-item w-nav-link">exercise</a>
                    <a href="diary" class="menu-item w-nav-link">diary</a>
					<a href='../mypage'><img src="userphotos/${sessionScope.profile}" width="146" sizes="(max-width: 479px) 100vw, 146px" border-radius: 50%;  class="profile-img w-nav-link" ></a>
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
	                <div class="sitemap-page"><img src="images/sitemap_blog_4sitemap_blog_03.png" loading="lazy" alt="" class="sitemap-image">
	                    <h4 class="sitemap-title">Mypage</h4>
	                </div>
	                <div class="sitemap-info"><img src="images/circle-blue_1circle-blue.png" loading="lazy" alt="" class="sitemap-dot">
	                    <div class="sitemap-text">회원정보</div>
	                </div>
	            </div>
	            <div class="blog-wrapper">
	                <div class="blog-list-wrapper w-dyn-list">
	                    <div role="list" class="blog-list w-dyn-items w-row">
	                        <div data-w-id="896831f0-9c76-54de-eebe-d8914b48a114" role="listitem" class="blog-item1 w-dyn-item w-col w-col-6">
	                            <div class="container2">
	                                <div class="container3">
	                                    <h1>회원정보</h1>
	                                    <div class="info-group2-inline">
	                                        <table>
	                                            <tr>
	                                                <td class="info-group3" style="width: 45%; text-align:center; padding-top:20%; padding-right:33px;">
	                                                    <label style="width: 45%;">이름</label>
	                                                </td>
	                                                <td rowspan=3 style="width: 10%; "><input type="file" id="profilePicInput" accept="image/*" style="display: none;" enctype="multipart/form-data">
	                                                    <div class="profile-img2" onclick="openFileUploader()"><img id="profilePicPreview" src="userphotos/${sessionScope.profile}" alt="프로필 사진 미리보기"></div>
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td><span style="width: 45%; padding-bottom:50px margin-bottom:50px">${user.USERNAME}</span></td>
	                                            </tr>
	                                            <tr>
	                                                <td> &nbsp; </td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                    </br>
	                                    <div class="info-group2-inline">
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">성별</label>
	                                            <span style="margin-bottom:20px;">${user.GENDER}</span>
	                                        </div>
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">나이</label>
	                                            <span style="margin-bottom:20px;">${user.AGE}</span>
	                                        </div>
	                                    </div>
	                                    <div class="info-group2-inline">
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">이메일</label>
	                                            <span style="margin-bottom:20px;">${user.EMAIL}</span>
	                                        </div>
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">몸무게 </label>
	                                            <span style="margin-bottom:20px;">${user.WEIGHT}(kg)</span>
	                                        </div>
	                                    </div>
	                                    <div class="info-group2-inline">
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">키 </label>
	                                            <span style="margin-bottom:20px;">${user.HEIGHT} (cm)</span>
	                                        </div>
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">목표</label>
	                                            <span style="margin-bottom:20px;">${user.GOAL}</span>
	                                        </div>
	                                        <div class="info-group2">
	                                            <label style="margin-bottom:20px;">활동량</label>
	                                            <span style="margin-bottom:20px;">${user.ACTIVITY}</span>
	                                        </div>
	                                    </div>
	                                    <div class="btn2">
	                                        <button onclick="redirect1()">회원정보 변경</button>
	                                        <button onclick="redirect()">비밀번호 변경</button>
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
        <div class="copyright-text">Calories Cut  -  Innovatively Yours: © 2024  🌟  Powered by <a href="#" class="copyright-text">2조</a>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=668501d6493a753e79314722" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../js/webflow.js" type="text/javascript"></script>
   <script>
	function redirect() {
      window.location.href = "mypage/change"; 
	}
	  
	function redirect1() {
      window.location.href = "mypage/info"; 
	}        
	                
	function openFileUploader() {
     document.getElementById('profilePicInput').click();
	}

	// 파일 선택 시 처리
   	document.getElementById('profilePicInput').addEventListener('change', function() {
	var file = this.files[0]; // 선택된 파일 객체
	var formData = new FormData();
		if (file) {
	   	var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성
	  	formData.append("file", file);
	  	$.ajax({
	   	type : 'POST',
	   	url : 'mypage/changeProfile',
	   	data : formData,
	   	async: false,
	   	contentType : false,
		processData : false,
	   	success : function(result){
			if(result=="fail") alert("이미지 파일을 선택하세요.");
	 		},
	
			error : function(err){
	  		alert('실패');
	  		console.log(err);
	   		}
		});
	          
	  	reader.onload = function(e) {
	    document.getElementById('profilePicPreview').setAttribute('src', e.target.result); // 이미지 미리보기 설정
	  	$('.profile-img').attr('src', e.target.result);
	  	};
		
	  	reader.readAsDataURL(file); // 파일을 읽어 data URL 형식으로 변환
		}
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