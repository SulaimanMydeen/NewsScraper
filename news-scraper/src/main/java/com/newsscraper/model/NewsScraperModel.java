package com.newsscraper.model;

public class NewsScraperModel {

	private String articleTitle;
	private String authorName;
	private String description;

	public NewsScraperModel() {
		super();
	}

	public NewsScraperModel(String articleTitle, String authorName, String description) {
		super();
		this.articleTitle = articleTitle;
		this.authorName = authorName;
		this.description = description;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
