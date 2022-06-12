package com.java.project.crawl.service;

import java.util.Optional;

import com.java.project.crawl.entity.CrawlElementEntity;


public interface CrawlElementService {
	CrawlElementEntity updateCrawl(Optional<CrawlElementEntity> crawlEntity);
	CrawlElementEntity save(CrawlElementEntity crawlEntity);
}
