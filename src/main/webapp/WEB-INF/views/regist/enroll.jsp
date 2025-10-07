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
	<style>
		.dropdown {
		    max-height: 100px; /* 드롭다운의 최대 높이 설정 */
		    overflow-y: auto;  /* 세로 스크롤 추가 */
		    border: 1px solid #ccc; /* 테두리 추가 */
		    margin-top: -30px; /* 간격 설정 */
		    padding: 10px; /* 내측 여백 설정 */
		    display: none; /* 기본적으로 숨김 */
			position: relative;
			left: -25%;
		}
		@media (max-width: 430px){
			.dropdown {
				left: -14%;
				margin-top: 1px;
			}
			
			.checkbox-group label {
			    display: block;
			    margin-bottom: 5px;
			    margin-left: 20%;
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
    <link href="images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="images/webclip.png" rel="apple-touch-icon">
</head>

<body>
  <div class="pages-wrapper">
	<section class="section authentication">
	    <div class="container">
	        <div class="authentication-content">
	            <div class="log-in">
	                <div class="sign-in-form-wrap w-form">
	                    <form id="profile-goal-form" name="profile-goal-form" method="post" action="saveUser" class="profile-goal-form" onsubmit="return formSubmit()">
	                        <div class="enrolltext">
	                            <h2>회원가입</h2>
	                        </div>
	                        <div class="sign-in-single-fields">
	                            <div class="input-group">
	                                <label for="name">이름&emsp;&emsp;</label>
	                                <input type="text" id="name" name="username" class="username w-input1" placeholder="이름을 입력해주세요" />
	                                <div id="nameError" class="error">이름을 입력해주세요.</div>
	                            </div>
	                            <div class="input-group">
	                                <label for="email">이메일&emsp;</label>
	                                <div class="input-wrapper">
	                                    <input type="text" id="email" name="email" class="email w-input1" placeholder="이메일을 입력해주세요" />
	                                    <button type="button" onclick="checkDuplicateEmail()">중복확인</button>
	                                </div>
	                                <div id="emailError" class="error1">올바른 이메일을 입력해주세요.</div>
	                            </div>
	                            <div class="input-group">
	                                <label for="password">비밀번호</label>
	                                <input type="password" id="password" name="password" class="pass w-input1" placeholder="비밀번호를 입력해주세요" />
	                                <div id="passwordError" class="error">비밀번호 : 8-15자의 영문자, 숫자, 특자문자</div>
	                            </div>
	                            <div class="input-group">
	                                <label for="passwordCheck">비밀번호확인</label>
	                                <input type="password" id="passwordCheck" class="passcheck w-input1" placeholder="비밀번호를 확인해주세요" />
	                                <div id="passwordCheckError" class="error">비밀번호가 일치하지 않습니다.</div>
	                            </div>
	                        </div>

	                        <div class="checkbox-group">
	                            <label>
	                                <input type="checkbox" class="chb1" name="terms1"> 칼로리컷 이용약관
	                                <div class="dropdown">
	                                    <div class="dropdown-content">
	                                        <h5>이용약관</h5>
	                                        <h5>제 1 조 (목적)</h5>
	                                        <p>본 약관은 [서비스 이름] (이하 "서비스")의 이용 조건과 절차, 이용자와 회사의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.</p>

	                                        <h5>제 2 조 (용어의 정의)</h5>
	                                        <p>1. "회사"라 함은 [회사 이름]을 의미합니다.</p>
	                                        <p>2. "회원"이라 함은 본 약관에 동의하고 서비스에 가입하여 이용하는 고객을 의미합니다.</p>
	                                        <p>3. "비회원"이라 함은 회원에 가입하지 않고 제공되는 서비스를 이용하는 자를 의미합니다.</p>

	                                        <h5>제 3 조 (약관의 효력 및 변경)</h5>
	                                        <p>1. 본 약관은 서비스 화면에 게시하거나 기타의 방법으로 공지함으로써 효력이 발생합니다.</p>
	                                        <p>2. 회사는 관련 법령을 위배하지 않는 범위 내에서 본 약관을 개정할 수 있습니다. 개정된 약관은 공지 후 효력을 발휘합니다.</p>
	                                        <p>3. 회원은 개정된 약관에 대해 거부할 권리가 있으며, 개정된 약관의 효력 발생일 이후에도 서비스를 계속 사용할 경우 동의한 것으로 간주됩니다.</p>

	                                        <h5>제 4 조 (회원가입)</h5>
	                                        <p>1. 회원이 되고자 하는 자는 회사가 정한 가입 양식에 따라 회원정보를 기입하고 이 약관에 동의함으로써 회원 가입을 신청합니다.</p>
	                                        <p>2. 회사는 가입을 신청한 자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.</p>
	                                        <ul>
	                                            <li>등록 내용에 허위, 기재 누락, 오기가 있는 경우</li>
	                                            <li>기타 회사가 정한 등록 요건을 충족하지 못한 경우</li>
	                                        </ul>

	                                        <h5>제 5 조 (회원의 의무)</h5>
	                                        <p>1. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 해서는 안 됩니다.</p>
	                                        <ul>
	                                            <li>서비스 이용 관련 제반 사항을 허위로 작성하는 행위</li>
	                                            <li>타인의 개인정보를 도용하거나 부정 사용하는 행위</li>
	                                            <li>회사의 지적재산권, 기타 타인의 권리를 침해하는 행위</li>
	                                            <li>법령에 위반되거나 공서양속에 반하는 행위</li>
	                                        </ul>

	                                        <h5>제 6 조 (서비스의 제공 및 중단)</h5>
	                                        <p>1. 회사는 회원에게 다음과 같은 서비스를 제공합니다.</p>
	                                        <ul>
	                                            <li>[제공하는 서비스 내용]</li>
	                                        </ul>
	                                        <p>2. 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 중단할 수 있습니다.</p>
	                                        <ul>
	                                            <li>서비스용 설비의 보수 등 공사로 인한 경우</li>
	                                            <li>정전, 서비스 설비 장애 또는 서비스 이용 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</li>
	                                            <li>기타 불가항력적 사유가 있는 경우</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                            </label>
	                            <label>
	                                <input type="checkbox" class="chb1" name="terms2"> 개인정보 수집 및 이용
	                                <div class="dropdown">
	                                    <div class="dropdown-content">
	                                        <h5>개인정보 수집 및 이용 약관</h5>
	                                        <h5>1. 개인정보 수집 목적</h5>
	                                        <p>회원가입 및 서비스 제공을 위해 아래와 같은 목적 하에 개인정보를 수집합니다.</p>
	                                        <ul>
	                                            <li>회원 식별 및 본인 확인</li>
	                                            <li>서비스 제공 및 이용 문의 응대</li>
	                                            <li>서비스 개선 및 신규 서비스 개발</li>
	                                            <li>마케팅 및 광고 활용</li>
	                                        </ul>

	                                        <h5>2. 수집하는 개인정보 항목</h5>
	                                        <p>회원가입 시, 다음과 같은 개인정보를 수집합니다.</p>
	                                        <ul>
	                                            <li>필수 항목: 이름, 이메일 주소, 비밀번호, 연락처(전화번호)</li>
	                                            <li>선택 항목: 생년월일, 성별, 주소</li>
	                                        </ul>

	                                        <h5>3. 개인정보 수집 방법</h5>
	                                        <p>- 홈페이지, 모바일 앱을 통한 회원가입</p>
	                                        <p>- 고객센터를 통한 전화 및 온라인 상담</p>

	                                        <h5>4. 개인정보의 이용 및 보유 기간</h5>
	                                        <p>수집된 개인정보는 회원 탈퇴 후 또는 수집 목적 달성 시까지 보관되며, 이후 해당 정보를 지체 없이 파기합니다. 단, 법령에서 정한 일정 기간 동안 보관이 필요할 경우에는 해당 기간 동안 보관합니다.</p>
	                                        <ul>
	                                            <li>계약 또는 청약 철회 등에 관한 기록: 5년</li>
	                                            <li>소비자의 불만 또는 분쟁 처리에 관한 기록: 3년</li>
	                                        </ul>

	                                        <h5>5. 개인정보의 제3자 제공</h5>
	                                        <p>회원의 동의 없이 제3자에게 개인정보를 제공하지 않습니다. 다만, 법령에 따라 요구되는 경우 예외로 합니다.</p>

	                                        <h5>6. 개인정보의 보호 및 관리</h5>
	                                        <p>당사는 개인정보 보호를 위해 관련 법령에 따라 안전성 확보에 필요한 기술적, 관리적 대책을 강구하고 있습니다. 개인정보에 접근할 수 있는 권한을 가진 직원은 최소한으로 제한하며, 개인정보 보호 교육을 실시하고 있습니다.</p>

	                                        <h5>7. 이용자의 권리</h5>
	                                        <p>이용자는 언제든지 본인의 개인정보 열람, 정정, 삭제를 요청할 수 있으며, 개인정보의 처리에 대한 동의를 철회할 수 있습니다. 이와 관련된 요청은 고객센터를 통해 가능합니다.</p>
	                                    </div>
	                                </div>
	                            </label>
	                            <label>
	                                <input type="checkbox" class="chb1" name="terms3"> 이용 제한 및 서비스 중지
	                                <div class="dropdown">
	                                    <div class="dropdown-content">
	                                        <h5>이용약관</h5>
	                                        <h5>이용 제한 및 서비스 중지 관련 약관</h5>
	                                        <p>회사는 다음의 경우 회원의 서비스 이용을 제한하거나 중지할 수 있습니다.</p>
	                                        <ul>
	                                            <li>회원이 법령 또는 본 약관의 의무를 위반한 경우</li>
	                                            <li>회원이 타인의 권리, 명예, 신용 및 기타 정당한 이익을 침해하는 경우</li>
	                                            <li>서비스의 안정적인 운영을 방해하는 행위를 하는 경우</li>
	                                            <li>부당한 방법으로 서비스에 접근하거나 이와 관련된 보안을 위협하는 경우</li>
	                                            <li>기타 회사가 정한 이용 조건에 위배되는 경우</li>
	                                            <li>이용자가 요구되는 정산금액을 미지불한 경우</li>
	                                        </ul>
	                                        <p>회사는 서비스 제공을 위한 설비의 보수, 점검, 교체 또는 고장, 통신의 두절 등의 사유가 발생한 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 회사는 사전 또는 사후에 회원에게 이를 통지합니다.</p>
	                                        <p>회사는 천재지변, 비상사태, 전쟁, 정부의 명령, 법령 변경 등 불가항력적인 사유로 인해 서비스를 제공할 수 없는 경우에는 서비스의 전부 또는 일부를 제한하거나 중단할 수 있습니다.</p>
	                                    </div>
	                                </div>
	                            </label>
	                        </div>
	                        <div class="sign-in-buttons">
	                            <input type="submit" data-wait="Please wait..." class="sing-up-btn w-button" value="가입하기">
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
     <script>
		var emailDupleCheck = false;
		// sessionStorage에서 데이터 가져오기
		const data = JSON.parse(sessionStorage.getItem('formData') || '{}');
		// sessionStorage 데이터를 폼에 추가
		for (const key in data) {
		    if (data.hasOwnProperty(key)) {
		        const hiddenField = $('<input>', {
		            type: 'hidden',
		            name: key,
		            value: data[key]
		        });
		        $('#profile-goal-form').append(hiddenField);
		    }
		}

		function formSubmit() {
            console.log('formSubmit 실행됨');

            const valid = validateForm();
            console.log("validateForm():", valid);
            console.log("emailDupleCheck:", emailDupleCheck);

            if (!valid || !emailDupleCheck) {
                alert('필수항목을 확인해주세요.');
                return false;
            }
        }
	  
		function validateForm() {
            let isValid = true;

            // 입력값 가져오기
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const passwordCheck = document.getElementById('passwordCheck').value;

            // 에러 메시지 초기화
            document.getElementById('nameError').style.display = 'none';
            document.getElementById('emailError').style.display = 'none';
            document.getElementById('passwordError').style.display = 'none';
            document.getElementById('passwordCheckError').style.display = 'none';

            // 이름
            if (!name) {
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            }

            // 이메일
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            }

            // 비밀번호
            const passwordPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
            if (!passwordPattern.test(password)) {
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            }

            // 비밀번호 확인
            if (password !== passwordCheck) {
                document.getElementById('passwordCheckError').style.display = 'block';
                isValid = false;
            }

            // 약관 체크박스 검증
            const terms1 = document.querySelector('input[name="terms1"]');
            const terms2 = document.querySelector('input[name="terms2"]');
            const terms3 = document.querySelector('input[name="terms3"]');

            if (!terms1.checked || !terms2.checked || !terms3.checked) {
                console.warn("약관 체크 상태:", {
                    terms1: terms1.checked,
                    terms2: terms2.checked,
                    terms3: terms3.checked
                });
                isValid = false;
            }

            return isValid;
        }


		// 각 입력 필드에 이벤트 리스너 추가
		document.getElementById('name').addEventListener('keyup', validateForm);
		document.getElementById('email').addEventListener('keyup', validateForm);
		document.getElementById('password').addEventListener('keyup', validateForm);
		document.getElementById('passwordCheck').addEventListener('keyup', validateForm);

		function checkDuplicateEmail() {
            const email = document.getElementById('email').value;
            const emailError = document.getElementById('emailError').style.display;

            if (email) {
                if (emailError == 'none') {
                    $.ajax({
                        url: '/regist/emailDupleCheck?email=' + encodeURIComponent(email),
                        type: 'get',
                        success: function(result) {
                            if (result === 'success') {
                                emailDupleCheck = true;
                                alert("사용가능한 이메일입니다.");
                            } else {
                                emailDupleCheck = false;
                                alert("중복된 이메일입니다.");
                            }
                        },
                        error: function(xhr, status, error) {
                            alert('AJAX 요청 실패: ' + xhr.status);
                            console.log("status:", status);
                            console.log("error:", error);
                        }
                    });
                } else return;
            } else {
                alert('이메일을 입력해주세요.');
            }
        }


		$('#profile-goal-form').keyup(function(evt) {
		    console.log(evt.target.id);
		    validateForm(evt.target.id);
		});


		document.addEventListener('DOMContentLoaded', function() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"][name^="terms"]');
            let scrolledToBottom = {
                terms1: false,
                terms2: false,
                terms3: false
            };

			// 드롭다운 스크롤 감지
			checkboxes.forEach(checkbox => {
			    const dropdown = checkbox.parentElement.querySelector('.dropdown');

			    dropdown.addEventListener('scroll', function() {
			        const isAtBottom = dropdown.scrollHeight - dropdown.scrollTop <= dropdown.clientHeight + 1; // 오차 허용
			        const checkboxName = checkbox.getAttribute('name');
			        scrolledToBottom[checkboxName] = isAtBottom;

			        if (isAtBottom) {
			            checkbox.checked = true; // 스크롤이 맨 아래에 도달한 경우에 체크
			        }
			    });

			    // 체크박스 클릭 이벤트 처리
			    checkbox.addEventListener('click', function(event) {
			        event.stopPropagation(); // 클릭 이벤트 전파 방지

			        // 드롭다운 표시
			        dropdown.style.display = 'block';

			        if (!scrolledToBottom[checkbox.getAttribute('name')]) {
			            alert('약관을 끝까지 스크롤해야 동의할 수 있습니다.');
			            checkbox.checked = false; // 스크롤 완료되지 않은 경우 체크 해제
			        }
			    });
			});

			// 드롭다운 외부 클릭 시 닫기
			document.addEventListener('click', function() {
			document.querySelectorAll('.dropdown').forEach(dropdown => {
			    dropdown.style.display = 'none';
				});
			});
		});

      </script>
  </body>

  </html>