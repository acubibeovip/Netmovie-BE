package com.java.project.crawl.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.project.crawl.entity.CrawlElementEntity;

public interface CrawlElementRepository extends JpaRepository<CrawlElementEntity, Long> {

}
