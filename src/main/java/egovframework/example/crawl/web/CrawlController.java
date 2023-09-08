package egovframework.example.crawl.web;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/crawl/")
public class CrawlController {
    
	@RequestMapping("jsoupCrawler.do")
	public String jsoupCrawler(Model model, @RequestParam String keyword) {
		
		// 1. JSP단에서 parameter 로 keyword 값을 받아와서 사용
        String apiUrl = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query="+keyword;
        Document doc = null;
        System.out.println("apiUrl > " + apiUrl);

        ArrayList<String> al1 = new ArrayList<>();
        
        try {
        	
            // Jsoup의 connect 메서드가 IOException을 던질 수 있으므로 예외 처리 강화
            doc = Jsoup.connect(apiUrl).get();

            Elements elements1 = doc.select(".news_tit");
            System.out.println("elements " + elements1);

            String href;
            String title2;
            for (Element el : elements1) {
                href = el.select("a").attr("href");
                System.out.println("href " + href);
                title2 = el.select("a").attr("title");
                System.out.println("title2 " + title2);
                al1.add(href);
            }
            System.out.println("al1 > " + al1);

        } catch (IOException e) {
        	
        	// 예외 처리 로직 추가
            e.printStackTrace();
        }
		
		return "cmmn/test";
	}
     
}