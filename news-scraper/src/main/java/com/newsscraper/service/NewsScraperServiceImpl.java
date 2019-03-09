package com.newsscraper.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.newsscraper.model.NewsScraperModel;

@Service
public class NewsScraperServiceImpl implements NewsScraperService {

	private final Logger logger = LoggerFactory.getLogger(NewsScraperServiceImpl.class);

	private static List<String> availableAuthors = new ArrayList<>();

	static HashMap<String, NewsScraperModel> articlesMap = new HashMap<>();

	@Override
	public void getAllArticles() throws IOException {
		logger.debug("start method: getArticles");
		Elements firstPageElements = getDocument("https://www.thehindu.com/archive/")
				.getElementById("archiveWebContainer").select("a");
		boolean sizeReached = false;
		for (Element firstPageElement : firstPageElements) {
			Elements secondPageElements = getDocument(firstPageElement.absUrl("href"))
					.getElementsByClass("ui-state-default");
			for (Element secondPageElement : secondPageElements) {
				Elements thirdPageElements = getDocument(secondPageElement.absUrl("href"))
						.getElementsByClass("archive-list").select("a");
				for (Element articlePageElement : thirdPageElements) {
					if (!articlesMap.containsKey(articlePageElement.text())) {
						Element articleElement = getDocument(articlePageElement.absUrl("href"));
						String articleTitle = articlePageElement.text();
						String authorName = articleElement.getElementsByClass("author-img-name 1").text();
						String description = "";
						Elements articleParagraphElements = articleElement.getElementsByTag("p");
						for (Element paragraphElement : articleParagraphElements) {
							description += paragraphElement.text() + " ";
						}
						if (!StringUtils.isEmpty(authorName)) {
							availableAuthors.add(authorName);
							articlesMap.put(articleTitle, new NewsScraperModel(articleTitle, authorName, description));
						}
						if (articlesMap.size() == 100) {
							sizeReached = true;
							break;
						}
					}
				}
				if (sizeReached) {
					break;
				}
			}
			if (sizeReached) {
				break;
			}
		}
		logger.debug("end method: getArticles");
	}

	private Document getDocument(String url) throws IOException {
		return Jsoup.connect(url).userAgent("Mozilla/5.0 Chrome/26.0.1410.64 Safari/537.31").timeout(300000)
				.followRedirects(true).maxBodySize(1024 * 1024 * 3).get();
	}

	@Override
	public List<String> getAllAuthors() {
		HashSet<String> articleSet = new HashSet<>(availableAuthors);
		return new ArrayList<>(articleSet);
	}

	@Override
	public List<NewsScraperModel> searchAuthorNames(String authorName) {
		Iterator<Map.Entry<String, NewsScraperModel>> mapItr = articlesMap.entrySet().iterator();
		HashSet<NewsScraperModel> authorsData = new HashSet<>();
		while (mapItr.hasNext()) {
			Map.Entry<String, NewsScraperModel> mapEntry = mapItr.next();
			if (mapEntry.getValue().getAuthorName().equalsIgnoreCase(authorName)) {
				authorsData.add(mapEntry.getValue());
			}
		}
		return new ArrayList<>(authorsData);
	}

	@Override
	public NewsScraperModel searchArticleTitle(String articleTitle) {
		if(articlesMap.containsKey(articleTitle)) {
			return articlesMap.get(articleTitle);
		}
		return new NewsScraperModel();
	}
}