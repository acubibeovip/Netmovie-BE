package com.java.project.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.FilmEntity;
import com.java.project.entity.UserEntity;
import com.java.project.repository.UserRepository;
import com.java.project.service.Impl.FilmServiceImpl;

@RestController
@RequestMapping("/home/films")
public class ClientFilmsController {
	
	@Autowired
	private FilmServiceImpl filmServiceImpl;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private HttpSession session;


	@GetMapping("/details")
	public ResponseEntity<Map<String,FilmEntity>> getDetailFilm(@RequestParam("id") Long id) {

		Map<String,FilmEntity> film = new HashMap<>();
		film.put("Film-Detail",filmServiceImpl.findById(id).get());
		return new ResponseEntity<Map<String,FilmEntity>>(film,HttpStatus.OK);
	}

	@GetMapping("/film-by-actor/{id}")
	public ResponseEntity<Map<String,List>> getAllFilmFreeByActor(@PathVariable("id") Long id){
		//List free film
		Map<String,List> film = new HashMap<String,List>();
		film.put("Film-Free-By-Actor",filmServiceImpl.filmFreeByActor(id));
		return new ResponseEntity<Map<String,List>>(film,HttpStatus.OK);
	}

	@GetMapping("/film-vip-by-actor/{id}")
	public ResponseEntity<Map<String,List>> getAllFilmVipByActor(@PathVariable("id") Long id) throws JsonMappingException, JsonProcessingException {

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

		Map<String,List> filmByActor = new HashMap<String, List>();


		if(userDetailLogin.getProduct().getId_product() == 1) {
			filmByActor.put("Film-Free-By-Actor",filmServiceImpl.filmFreeByActor(id));
			return new ResponseEntity<Map<String,List>>(filmByActor,HttpStatus.OK);
		}else {
			filmByActor.put("Film-Free-By-Actor", filmServiceImpl.filmFreeByActor(id));
			filmByActor.put("Film-Vip-By-Actor", filmServiceImpl.filmVipByActor(id));
			return new ResponseEntity<Map<String,List>>(filmByActor,HttpStatus.OK);
		}
	}

	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> getAllFilm(){
		//change
		double productDefault = 1;
		long changeTypeProduct = (long) productDefault ;
		
		//list free film
		Map<String,List> film = new HashMap<String, List>();
		film.put("Films-Free", filmServiceImpl.findByFreeFilm(changeTypeProduct));
		return new ResponseEntity<Map<String,List>>(film,HttpStatus.OK);
	}
	
	@GetMapping("/gold") 
	public ResponseEntity<Map<String,List>> getGoldFilms() throws JsonMappingException, JsonProcessingException{
		
		String jsons = "{\"username\":\"vy\"}";
		
		//read json
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
		
		
		if(userDetailLogin.getProduct().getId_product() == 1) {
			film.put("Films-Free", filmServiceImpl.findByFreeFilm(changeTypeProduct));
			return new ResponseEntity<Map<String,List>>(film,HttpStatus.OK); 
		}else {
			film.put("Films-Vip", filmServiceImpl.findByGoldFilm(changeTypeProduct));
			return new ResponseEntity<Map<String,List>>(film,HttpStatus.OK); 
		}
	}
}
