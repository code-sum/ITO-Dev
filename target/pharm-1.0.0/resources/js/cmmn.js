  /**
   * TOP버튼 공통코드
   */
  function fn_scrollToTop() {
	  $(document).on('click', '#btnTop', function(e) {
		  window.scrollTo({top: 0, behavior: "smooth"});
	    });
  }

  
  /**
   * 숫자 1000 단위마다 쉼표(,) 공통코드
   */
  function fn_commas() {
	   var nums = document.querySelectorAll(".numcom");
	   nums.forEach(function (num) {
	       var number = parseFloat(num.textContent); // 숫자로 변환
	       var formattedNumber = number.toLocaleString();
	       num.textContent = formattedNumber; // 변경된 숫자를 다시 설정
	   });
	}
  
  
  /**
   * 링크를 적용한 페이징 태그 생성
   * @param  currentPage 현재 페이지
   * @param  totalCount 총 건수
   * @param  pageRow 페이지당 보여주는 목록 갯수
   * @param  blockPage 페이지 번호 갯수 
   * @param  pageFunc  페이지 번호를 클릭하면 호출할 함수 객체
   * @param  exParams  pageFunc에 넘겨줄 추가적인 파라미터 ( optional / 가능한 파라미터 형식: 문자열 )
   * @return html 문자열
   */
  function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
  {	
  	totalCount = parseInt(totalCount);
  	pageRow = parseInt(pageRow);
  	blockPage = parseInt(blockPage);
  	
  			
  	
  	var totalPage = Math.ceil(totalCount / pageRow);
  	if (totalPage == 0) {
  		totalPage = 1;
  	}

  	// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
  	if (currentPage > totalPage) {
  		currentPage = totalPage;
  	}

  	// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
  	var startCount = (currentPage - 1) * pageRow;
  	var endCount = startCount + pageRow;

  	
  	
  	// 시작 페이지와 마지막 페이지 값 구하기.
  	startPage = Math.floor((currentPage - 1) / blockPage) * blockPage + 1;
  	endPage = startPage + blockPage - 1;

  	// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
  	if (endPage > totalPage) {
  		endPage = totalPage;
  	}
  	
  	// 추가 파라미터가 있는 경우 함수 호출 파라미터로 적용
  	var sExParam = exParams==undefined ? "" : ",\"" + exParams.join("\",\"") + "\"";
  	
  	var pagingHtml = "<div class='paging'>";
  	pagingHtml += "<a class='first' href='javascript:"+pageFunc+"(1"+sExParam+")'><span class='hidden'>맨앞</span></a>";
  	pagingHtml += "<a class='pre' href='javascript:"+pageFunc+"(" + (startPage - 1 == 0 ? 1 : (startPage -1)) +sExParam+")'><span class='hidden'>이전</span></a>";

  	for (var i = startPage; i <= endPage; i++) {
  		if (i > totalPage) {
  			break;
  		}
  		
  		if(i > startPage) {
  			firstPage = "";
  		}
  		
  		if (i == currentPage) {
  			pagingHtml += "<strong>" + i + "</strong>";
  		} else {
  			pagingHtml += " <a href=javascript:"+pageFunc+"(" + i + sExParam +")>" + i + "</a>";
  		}
  	}

  	pagingHtml += "<a class='next' href='javascript:"+pageFunc+"(" + (endPage + 1 > totalPage ? totalPage : (endPage + 1))+ sExParam + ")'><span class='hidden'>다음</span></a>";
  	pagingHtml += "<a class='last' href='javascript:"+pageFunc+"(" + totalPage + sExParam + ")'><span class='hidden'>맨뒤</span></a>";
  	pagingHtml += "</div>";

  	return pagingHtml;
  }
