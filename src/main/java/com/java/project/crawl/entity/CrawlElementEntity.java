package com.java.project.crawl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.java.project.entity.CategoriesEntity;

import lombok.Data;

@Data
@Entity
@Table(name = "table_crawl_data")
public class CrawlElementEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_element_crawl;
	
	@Column(name = "name_web_crawl")
	private String name_web_crawl;
	
	@Column(name = "url_crawl")
	private String url_crawl;
	
	@Column(name = "number_tag_crawl")
	private int number_tag_crawl;
	
	@Column(name = "card_tag_crawl")
	private String card_tag_crawl;
	
	@Column(name = "content_crawl")
	private String content_crawl;
	
	@Column(name = "status_crawl")
	private int status_crawl;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_categories")
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private CategoriesEntity categories;
	
}
