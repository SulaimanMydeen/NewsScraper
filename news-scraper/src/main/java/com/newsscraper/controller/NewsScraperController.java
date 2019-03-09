package com.newsscraper.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newsscraper.model.NewsScraperModel;
import com.newsscraper.service.NewsScraperService;


@Controller
@SessionAttributes("name")
public class NewsScraperController {
	private final Logger logger = LoggerFactory.getLogger(NewsScraperController.class);
	
	@Autowired
    NewsScraperService newsScraperService;
	
	@RequestMapping(value = "/newsScraper", method = RequestMethod.GET)
	public String newsScraper(ModelMap model) {
		logger.debug("newsScraper method started...");
		model.addAttribute("allAuthors", new NewsScraperModel());
		model.addAttribute("searchAuthorName", new NewsScraperModel());
		model.addAttribute("searchArticleTitle", new NewsScraperModel());
		return "news-scraper";
	}
	
	@RequestMapping(value = "/getAllAuthors", method = RequestMethod.GET)
	public String getAllAuthors(ModelMap model) {
		logger.debug("getAllAuthors method started...");
		model.addAttribute("allAuthorList", newsScraperService.getAllAuthors());
		return "all-authors";
	}
	
	@RequestMapping(value = "/searchAuthorNames", method = RequestMethod.POST)
	public String searchAuthorNames(@ModelAttribute("searchAuthorName") NewsScraperModel newsScraperModel, ModelMap model) {
		logger.debug("searchAuthorNames method started...");
		model.addAttribute("authorNameList", newsScraperService.searchAuthorNames(newsScraperModel.getAuthorName()));
		return "author-names";
	}
	
	@RequestMapping(value = "/searchArticleTitle", method = RequestMethod.POST)
	public String searchArticleTitle(@ModelAttribute("searchArticleTitle") NewsScraperModel newsScraperModel, ModelMap model) {
		logger.debug("searchArticleTitle method started...");
		model.addAttribute("articleTitleList", newsScraperService.searchArticleTitle(newsScraperModel.getArticleTitle()));
		return "article-title";
	}
}
