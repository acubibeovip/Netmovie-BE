package com.java.project.controller.admin;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.project.crawl.SetUpCrawl;
import com.java.project.crawl.entity.CrawlElementEntity;
import com.java.project.crawl.serviceImpl.CrawlElementServiceImpl;
import com.java.project.service.Impl.CategoriesServiceImpl;

@Controller
@RequestMapping("/admin/crawl")
public class AdminCrawlController {

	@Autowired
	private CrawlElementServiceImpl crawlServiceImpl;
	
	@Autowired
	private CategoriesServiceImpl categoriesServiceImpl;
	
	
	@GetMapping("/list")
	public String CrawlListController(Model model) {
		model.addAttribute("listCrawl" , crawlServiceImpl.findAll());
		return "/admin/crawl/list";
	}
	
	@GetMapping("/new")
	public String CrawlAddController(Model model) {
		model.addAttribute("categoriesList" , categoriesServiceImpl.findAll());
		return "/admin/crawl/add";
	}
	
	@PostMapping("/new")
	public String saveNew(Model model,CrawlElementEntity crawlEntity) throws IOException {
		
		//create new variable 
		CrawlElementEntity crawlNew = new CrawlElementEntity();

		//set up content crawl
		SetUpCrawl setContentCrawl = new SetUpCrawl(crawlEntity.getName_web_crawl(),crawlEntity.getUrl_crawl(),crawlEntity.getNumber_tag_crawl(),crawlEntity.getCard_tag_crawl());
		
		//add value
		crawlNew.setName_web_crawl(crawlEntity.getName_web_crawl());
		crawlNew.setUrl_crawl(crawlEntity.getUrl_crawl());
		crawlNew.setNumber_tag_crawl(crawlEntity.getNumber_tag_crawl());
		crawlNew.setCard_tag_crawl(crawlEntity.getCard_tag_crawl());
		crawlNew.setContent_crawl(setContentCrawl.setUpLinkCrawl().toString());
		crawlNew.setCategories(crawlEntity.getCategories());
		
		crawlServiceImpl.save(crawlNew);
		model.addAttribute("success", "Add New Success");
		
		return "redirect:/admin/crawl/list";
	}
	
	@GetMapping("/edit")
	public String CrawlEditController(Model model , @RequestParam("id") Long id) {
		model.addAttribute("editCrawl", crawlServiceImpl.findById(id).get());
		model.addAttribute("categoriesEdit",categoriesServiceImpl.findAll());
		System.out.println(categoriesServiceImpl.findAll());
		return "/admin/crawl/edit";
	}
	
	@PostMapping("/update")
	public String updateCrawlController(CrawlElementEntity crawlEntity , Model model) throws IOException {
		System.out.println("crawlEntity   -"+crawlEntity);
		Optional<CrawlElementEntity> crawlEdit = crawlServiceImpl.findById(crawlEntity.getId_element_crawl());
		
		//set up content crawl
		SetUpCrawl setContentCrawl = new SetUpCrawl(crawlEntity.getName_web_crawl(),crawlEntity.getUrl_crawl(),crawlEntity.getNumber_tag_crawl(),crawlEntity.getCard_tag_crawl());
				
		
		crawlEdit.get().setName_web_crawl(crawlEntity.getName_web_crawl());
		crawlEdit.get().setUrl_crawl(crawlEntity.getUrl_crawl());
		crawlEdit.get().setNumber_tag_crawl(crawlEntity.getNumber_tag_crawl());
		crawlEdit.get().setCard_tag_crawl(crawlEntity.getCard_tag_crawl());
		crawlEdit.get().setStatus_crawl(crawlEntity.getStatus_crawl());
		crawlEdit.get().setCategories(crawlEntity.getCategories());
		crawlEdit.get().setContent_crawl(setContentCrawl.setUpLinkCrawl().toString());
		
		crawlServiceImpl.save(crawlEdit.get());
		return "redirect:/admin/crawl/list";
	}
	
	
}
