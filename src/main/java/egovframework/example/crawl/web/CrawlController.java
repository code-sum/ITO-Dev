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
		
        String apiUrl = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=%EC%95%BD%EA%B5%AD";
        Document doc = null;
        System.out.println("apiUrl > " + apiUrl);

        // Jsoup의 connect 메서드가 IOException을 던질 수 있으므로 예외 처리 강화
        try {
            doc = Jsoup.connect(apiUrl).get();
        } catch (IOException e){
        	e.printStackTrace();
        }

        ArrayList<String> al1 = new ArrayList<>();

        Elements elements1 = doc.select(".news_tit");
        System.out.println("elements " + elements1);
        
        String href;
        String title2;
        for(Element el : elements1){

            href = el.select("a").attr("href");
            System.out.println("href " + href);
            title2 = el.select("a").attr("title");
            System.out.println("title2 " + title2);
            al1.add(href);
        }
        System.out.println("al1 > " + al1);
        
		
		return "cmmn/test";
	}
     
}