package com.java.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import com.java.project.StreamingService;

import reactor.core.publisher.Mono;

@RestController
public class VideoWatch {
	
	@Autowired
	private StreamingService service;
	
	@GetMapping(value = "/admin/video/{title}" , produces = "video/mp4")
	public Mono<Resource> getVideos(@PathVariable String title,@RequestHeader("Range") String range){
		System.out.println("rang in byte" + range);
		return service.getVideo(title);
	}
}
