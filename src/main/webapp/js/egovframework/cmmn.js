// cmmn.js 연결 테스트 : TOP 버튼 구현
  let scrollToTop = document.querySelector(".scrollToTop");
  scrollToTop.onclick = () => window.scrollTo({top: 0, behavior: "smooth"});