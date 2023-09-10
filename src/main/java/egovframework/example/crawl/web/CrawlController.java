package egovframework.example.crawl.web;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/crawl/")
public class CrawlController {
    
	@RequestMapping("jsoupCrawler.do")
	public String jsoupCrawler() throws Exception {
		
        String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=%EC%95%BD%EA%B5%AD";
        System.out.println("=====================================");
        System.out.println("url : " + url);

        Document doc = Jsoup.connect(url).get();
        
        System.out.println(doc.toString());
		
		return "{\"l\":\"l\"}";
	}
     
}