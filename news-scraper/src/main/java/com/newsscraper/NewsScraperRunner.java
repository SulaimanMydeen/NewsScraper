package com.newsscraper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.newsscraper.service.NewsScraperService;

@Component
public class NewsScraperRunner implements CommandLineRunner {

	@Autowired
	NewsScraperService newsScraperService;
	
	@Override
	public void run(String... args) throws Exception {
		newsScraperService.getAllArticles();
	}

}
