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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.ActorEntity;
import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.UserEntity;
import com.java.project.rabbitmq.service.RabbitMQSender;
import com.java.project.repository.UserRepository;
import com.java.project.service.Impl.CategoriesServiceImpl;
import com.java.project.service.Impl.FilmServiceImpl;

@RestController
@RequestMapping("/home/categories")
public class ClientCategoriesController {
	
	@Autowired
	private CategoriesServiceImpl categoriesServiceImpl;
	
	@Autowired
	private FilmServiceImpl filmServiceImpl;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RabbitMQSender rabbitMQSender;
	
	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> getCategories(){
		Map<String,List> categories = new HashMap<String, List>();
		categories.put("Categories", categoriesServiceImpl.findAll());
		
		//send rabbit mq
		rabbitMQSender.sendFindByAll(categories);
		
		return new ResponseEntity<Map<String,List>>(categories,HttpStatus.OK);
	}
	
	@GetMapping("/{id-categories}")
	public ResponseEntity<Map<String,List>> getFilmByCategories(@PathVariable("id-categories") Long id) throws JsonMappingException, JsonProcessingException{
	
		
		String jsons = "{\"username\":\"vy\"}";
		
		//readJson
		ObjectMapper readJson = new ObjectMapper();
		
		//parse json into user entity
		UserEntity userInput = readJson.readValue(jsons, UserEntity.class);
		
		//create message from fe
		Map<String,String> jsonResponse = new HashMap<String, String>();
		
		
		//check username login		
		UserEntity userDetailLogin = userRepo.findDetailByName(userInput.getUsername());
		
		//change
		double productDefault = 1;
		long changeTypeProduct = (long) productDefault ;
		//list free film
		Map<String,List> film = new HashMap<String, List>();
		
		Map<String,List> filmByCategories = new HashMap<String, List>();
		
		
		if(userDetailLogin.getProduct().getId_product() == 1) {
			filmByCategories.put("Film-Free-By-Categories", filmServiceImpl.filmFreeByCategories(id));
			return new ResponseEntity<Map<String,List>>(filmByCategories,HttpStatus.OK); 
		}else {
			filmByCategories.put("Film-Free-By-Categories", filmServiceImpl.filmFreeByCategories(id));
			filmByCategories.put("Film-Vip-By-Categories", filmServiceImpl.filmVipByCategories(id));
			return new ResponseEntity<Map<String,List>>(filmByCategories,HttpStatus.OK); 
		}
		
		
	}
	
	@GetMapping("/id-categories/{id-categories}")
	public Map<String,Optional<CategoriesEntity>> getActorId(@PathVariable("id-categories") Long id){
		Map<String,Optional<CategoriesEntity>> categoriesId = new HashMap<String,Optional<CategoriesEntity>>();
		categoriesId.put("Categories-id", categoriesServiceImpl.findById(id));
		
		//send rabbit mq
		rabbitMQSender.sendFindById(categoriesId);
		
		return categoriesId ;
	}
	
	@GetMapping("/name-categories/{name-categories}")
	public Map<String,List> getCategoriesName(@PathVariable("name-categories") String name){
		Map<String,List> categoriesName = new HashMap<>();
		categoriesName.put("Categories-name", categoriesServiceImpl.findByName(name));
		
		//send rabbit mq
		rabbitMQSender.sendFindByName(categoriesName);
		
		return categoriesName;
	}
	
	
}
