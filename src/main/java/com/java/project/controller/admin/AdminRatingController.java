package com.java.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.project.service.Impl.RatingServiceImpl;

@Controller
@RequestMapping("/admin/rating")
public class AdminRatingController {

	@Autowired
	private RatingServiceImpl ratingServiceImpl;
	
	@GetMapping("/list")
	public String HomeRatingController() {
		return "/admin/rating/list";
	}
}
