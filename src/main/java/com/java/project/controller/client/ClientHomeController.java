package com.java.project.controller.client;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.DeserializationProblemHandler;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.java.project.entity.ActorEntity;
import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.CommentEntity;
import com.java.project.entity.ContactEntity;
import com.java.project.entity.ProductsEntity;
import com.java.project.entity.StorageEntity;
import com.java.project.service.Impl.ActorServiceImpl;
import com.java.project.service.Impl.CategoriesServiceImpl;
import com.java.project.service.Impl.CommentServiceImpl;
import com.java.project.service.Impl.ContactServiceImpl;
import com.java.project.service.Impl.ProductsServiceImpl;
import com.java.project.service.Impl.StorageServiceImpl;

@RestController
@RequestMapping("/home")
public class ClientHomeController {

	@Autowired
	private CategoriesServiceImpl categoriesServiceImpl;
	
	@Autowired 
	private ActorServiceImpl actorServiceImpl;
	
	@Autowired
	private StorageServiceImpl storageServiceImpl;
	
	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@Autowired
	private ContactServiceImpl contactServiceImpl;
	
	@Autowired
	private ProductsServiceImpl productServiceImpl;
	
	@GetMapping
	public ResponseEntity<Map<String,Object>> getAllDataInSQL() {
		//list categories
		List<CategoriesEntity> categories = categoriesServiceImpl.findAll();
		
		//list actor
		List<ActorEntity> actor = actorServiceImpl.findAll();
		
		//list storage
		List<StorageEntity> storage = storageServiceImpl.findAll();
		
		//list comment
		List<CommentEntity> comment = commentServiceImpl.findAll();
		
		//list contact
		List<ContactEntity> contact = contactServiceImpl.findAll();
		
		//list films
		List<ProductsEntity> product = productServiceImpl.findAll();
		
		
		Map<String , Object> addList = new HashMap<String , Object>();
		
		addList.put("Categories",categories);
		addList.put("Actor",actor);
		addList.put("Storage",storage);
		addList.put("Comment",comment);
		addList.put("Contact",contact);
		addList.put("Product",product);
		return new ResponseEntity<Map<String,Object>>(addList,HttpStatus.OK);
	}
}