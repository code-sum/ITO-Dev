/**
 * 지금 뜨는 약국 뉴스 롤링박스 
 */
document.addEventListener('DOMContentLoaded', ()=>{
    var interval = window.setInterval(rollingCallback, 3000);
})
function rollingCallback(){
    //.prev 클래스 삭제
    document.querySelector('.rollingbanner .prev').classList.remove('prev');

    //.current -> .prev
    let current = document.querySelector('.rollingbanner .current');
    current.classList.remove('current');
    current.classList.add('prev');

    //.next -> .current
    let next = document.querySelector('.rollingbanner .next');
    //다음 목록 요소가 널인지 체크
    if(next.nextElementSibling == null){
        document.querySelector('.rollingbanner ul li:first-child').classList.add('next');
    }else{
    	//목록 처음 요소를 다음 요소로 선택
        next.nextElementSibling.classList.add('next');
    }
    next.classList.remove('next');
    next.classList.add('current');
}


/**
 * 랜덤 문자열 생성
 */
  function fn_randomID() {
	  let randomStr = Math.random().toString(36).substring(2, 12);
	  console.log(randomStr);
	  // 게시글 갯수에 맞춰 randomStr 배열 생성하는 로직 추가 ~
  }


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
  
  
  /**
   * 폼 요소 값이 비어있는지 체크하고 비어있으면 메시지를 표시한다.
   *
   * @param
   *   arr : 비어있는지 체크할 폼 요소 id, 얼럿 메시지 쌍의 배열
   *     ex) checkNotEmpty[ ["elem1","메시지1"], ["elem2","메시지2"] ] 
   *
   * @return : 값이 비어있는 폼 요소가 하나라도 있으면 false 값이 전부 입력된 경우 true
   */
  function checkNotEmpty(arr) {
      
  	for(var i=0, len=arr.length; i<len; i++) {
  		
  		var $elem = $('#' + arr[i][0]);
  		if($elem.length <= 0){ //not exist
  			continue;
  		}
  		var elemValue = $.trim( $elem.val() );
  		var alertMsg = arr[i][1];

  		if ( elemValue == "" ) {
  			swal(alertMsg);
  			$elem.focus();
  			return false;
  		}
  	} 
  	 
      return true;	 
  }
