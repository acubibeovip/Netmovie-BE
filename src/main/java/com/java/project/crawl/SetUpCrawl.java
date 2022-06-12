package com.java.project.crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.jsoup.nodes.Document;


public class SetUpCrawl {
	
	private String name_web_crawl;
	
	private String url_crawl;
	
	private int number_tag_crawl;
	
	private String card_tag_name;
	
	
	public SetUpCrawl() {
	
	}
	
	public SetUpCrawl(String name_web_crawl , String url_crawl , int number_tag_crawl , String card_tag_name) {
		this.name_web_crawl = name_web_crawl;
		this.url_crawl = url_crawl;
		this.number_tag_crawl = number_tag_crawl;
		this.card_tag_name = card_tag_name;
	}
	
	
	public ResponseEntity<List<String>> setUpLinkCrawl () throws IOException {
		String url = this.url_crawl;
		Document doc = Jsoup.connect(url).timeout(5000).get();
		//Element pages = doc.select("a[class=last-page]").first();
		
		//int countPage = Integer.parseInt(pages.ownText());
		List<String> addNewCrawl = new ArrayList<>();
		for(int i = 1 ; i <= this.number_tag_crawl ; i++) {
			Document docPage = Jsoup.connect(url + "/" + i).timeout(5000).get();
			Elements elementPage = docPage.select(this.card_tag_name);
			for(int j = 0 ; j < elementPage.size() ; j++) {
				addNewCrawl.add(elementPage.get(j).html());
			}
		}
		return new ResponseEntity<List<String>>(addNewCrawl,HttpStatus.OK);
	}
	
}
