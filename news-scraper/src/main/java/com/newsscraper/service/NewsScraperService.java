package com.newsscraper.service;

import java.io.IOException;
import java.util.List;

import com.newsscraper.model.NewsScraperModel;

public interface NewsScraperService {

	Object getAllAuthors();

	List<NewsScraperModel> searchAuthorNames(String authorName);

	NewsScraperModel searchArticleTitle(String articleTitle);

	void getAllArticles() throws IOException;

}
