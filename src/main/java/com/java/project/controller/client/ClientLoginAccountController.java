package com.java.project.controller.client;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.UserEntity;
import com.java.project.repository.UserRepository;
import com.java.project.service.Impl.UserServiceImpl;

@RestController
@RequestMapping("/home")
@CrossOrigin(origins = "http://localhost:4200")
public class ClientLoginAccountController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired 
	private UserRepository userRepo;
	
	@PostMapping("/login")
	//@RequestBody String jsonGetFromFE
	public ResponseEntity<Map<String,String>> loginCheckAccountControllerClient(Model model) throws JsonMappingException, JsonProcessingException, Exception{
		
		String jsons = "{\"username\":\"vy\",\"password\":\"1234\"}";
		
		//read json
		ObjectMapper readJson = new ObjectMapper();
		
		//parse json into user entity
		UserEntity userInput = readJson.readValue(jsons, UserEntity.class);
		
		//create message from fe
		Map<String,String> jsonResponse = new HashMap<String, String>();
		
		//check username login		
		try{			
			UserEntity userDetailLogin = userRepo.findDetailByName(userInput.getUsername());
			//response FE

			BCryptPasswordEncoder newCheckPassword = new BCryptPasswordEncoder();
			
			//handle json data fe and data be
			if(newCheckPassword.matches( userInput.getPassword(),userDetailLogin.getPassword()) == true) {
				jsonResponse.put("Message-login", "Login Success");
			}else {
				jsonResponse.put("Message-login", "Password Wrong, Please Check Again");
			}
			
			return new ResponseEntity<Map<String,String>>(jsonResponse ,HttpStatus.OK);

		}catch(Exception io) {
			jsonResponse.put("Message-login", "Account Exist, Register First");
			return new ResponseEntity<Map<String,String>>(jsonResponse ,HttpStatus.OK);
		}
		
	}
}
