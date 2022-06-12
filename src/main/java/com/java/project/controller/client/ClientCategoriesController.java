package com.java.project.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.CategoriesEntity;
import com.java.project.service.Impl.CategoriesServiceImpl;

@RestController
@RequestMapping("/home/categories")
public class ClientCategoriesController {
	
	@Autowired
	private CategoriesServiceImpl categoriesServiceImpl;
	
	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> getCategories(){
		Map<String,List> categories = new HashMap<String, List>();
		categories.put("Categories", categoriesServiceImpl.findAll());
		return new ResponseEntity<Map<String,List>>(categories,HttpStatus.OK);
	}
	
	@GetMapping("/id-categories/{id-categories}")
	public Map<String,Optional<CategoriesEntity>> getActorId(@PathVariable("id-categories") Long id){
		Map<String,Optional<CategoriesEntity>> categoriesId = new HashMap<String,Optional<CategoriesEntity>>();
		categoriesId .put("Categories-id", categoriesServiceImpl.findById(id));
		return categoriesId ;
	}
	
	@GetMapping("/name-categories/{name-categories}")
	public Map<String,List> getCategoriesName(@PathVariable("name-categories") String name){
		Map<String,List> categoriesName = new HashMap<>();
		categoriesName.put("Categories-name", categoriesServiceImpl.findByName(name));
		return categoriesName;
	}
	
	
}
