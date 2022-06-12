package com.java.project.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.project.entity.CommentEntity;
import com.java.project.service.Impl.CommentServiceImpl;
import com.java.project.service.Impl.ProductsServiceImpl;


@RestController
@RequestMapping("/home/comment")
public class ClientCommentController {

	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> getCommentController(){
		Map<String,List> comment = new HashMap<String,List>();
		comment.put("Comment", commentServiceImpl.findAll());
		System.out.println(commentServiceImpl.findAll());
		return new ResponseEntity<Map<String,List>>(comment,HttpStatus.OK);
	}
}
