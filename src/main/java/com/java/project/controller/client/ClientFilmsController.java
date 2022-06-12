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

import com.java.project.service.Impl.FilmServiceImpl;

@RestController
@RequestMapping("/home/films")
public class ClientFilmsController {
	
	@Autowired
	private FilmServiceImpl filmServiceImpl;
	
	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> getAllFilm(){
		Map<String,List> film = new HashMap<String, List>();
		film.put("Films", filmServiceImpl.findAll());
		return new ResponseEntity<Map<String,List>>(film,HttpStatus.OK);
	}

}
