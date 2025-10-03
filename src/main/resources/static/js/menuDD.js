var isMobile = /Mobi/i.test(window.navigator.userAgent);
// JavaScript로 호버 이벤트 처리
  const profileImg = document.querySelector('.profile-img');
  const dropdown = document.querySelector('.dropdown2');
  if(!isMobile){
  // 이미지에 마우스가 올라갔을 때 드롭다운 표시
  profileImg.addEventListener('mouseover', () => {
      dropdown.style.display = 'block';
  });

  //이미지에서 마우스가 벗어났을 때 드롭다운 숨기기
  profileImg.addEventListener('mouseout', () => {
      dropdown.style.display = 'none';
  });

  // 드롭다운 메뉴에 마우스가 올라갔을 때 드롭다운 유지
  dropdown.addEventListener('mouseover', () => {
      dropdown.style.display = 'block';
  });

  // 드롭다운 메뉴에서 마우스가 벗어났을 때 드롭다운 숨기기
  dropdown.addEventListener('mouseout', () => {
      dropdown.style.display = 'none';
  });
  }
  else {
	  profileImg.addEventListener('click', (evt) => {
		  evt.stopPropagation();
          dropdown.style.display = 'block';
      });
	  
	  $('body').click(function(){
		if(dropdown.style.display == 'block')
			dropdown.style.display = 'none';
	  });
  }
