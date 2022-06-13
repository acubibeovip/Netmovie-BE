package com.java.project.controller.admin;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.project.crawl.SetUpCrawl;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

	@GetMapping
	public String HomeController(Model model) throws IOException {
	
		System.out.println(model.getAttribute("video"));
		return "/admin/dashboard/home";
	}
}
