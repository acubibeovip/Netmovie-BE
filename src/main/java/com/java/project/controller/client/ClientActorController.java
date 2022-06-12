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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.StorageEntity;
import com.java.project.service.Impl.ActorServiceImpl;

@RestController
@RequestMapping("/home/actor")
public class ClientActorController {
	
	@Autowired
	private ActorServiceImpl actorServiceImpl;
	
	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> HomeController() {
		Map<String,List> listActor = new HashMap<String , List>();
		listActor.put("Actor", actorServiceImpl.findAll());
		return new ResponseEntity<Map<String,List>>(listActor, HttpStatus.OK);
	}
	
	@GetMapping("/id-actor/{id-actor}")
	public Map<String,Optional<ActorEntity>> getActorId(@PathVariable("id-actor") Long id){
		Map<String,Optional<ActorEntity>> actorId = new HashMap<String,Optional<ActorEntity>>();
		actorId.put("Actor-id", actorServiceImpl.findById(id));
		return actorId;
	}
	
	@GetMapping("/name-actor/{name-actor}")
	public Map<String,List> getActorName(@PathVariable("name-actor") String name){
		Map<String , List> actorName = new HashMap<>();
		actorName.put("Actor-name",actorServiceImpl.findByName(name));
		return actorName;
	}
	
	@GetMapping("/country-actor/{country-actor}")
	public  Map<String,List> getVideoFromId(@PathVariable("country-actor") String country){
		Map<String , List> actorFromCountry= new HashMap<>();
		actorFromCountry.put("Find-actor-by-country", actorServiceImpl.findByCountry(country));
		return actorFromCountry;
	}
	
}
