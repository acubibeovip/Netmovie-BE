package com.java.project;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.java.project.crawl.SetUpCrawl;

@SpringBootApplication
public class NetAppMovieApplication {

	public static void main(String[] args) {
		SpringApplication.run(NetAppMovieApplication.class, args);
	}

}
