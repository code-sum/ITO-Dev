package egovframework.example.crawl.web;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/crawl/")
public class CrawlController {

   @RequestMapping("jsoupCrawler.do")
   public String jsoupCrawler(Model model) throws Exception {
       String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=%EC%95%BD%EA%B5%AD";
       Document doc = Jsoup.connect(url).get();

       // 딕셔너리에 데이터 저장
       Map<String, String> result = new HashMap<>();
       Elements elements = doc.select("a.news_tit");
       for (Element element : elements) {
           String title = element.text();
           String href = element.attr("href");
           result.put(title, href);
       }

       // Model을 통해 데이터 전달
       model.addAttribute("crawlResult", result);       
       System.out.println("result : " + result);

       return "cmmn/newsListGrd";
   }
}