package com.java.project.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.CoinEntity;
import com.java.project.service.Impl.CoinServiceImpl;
import com.java.project.service.Impl.UserServiceImpl;

@RestController
@RequestMapping("/home/coin")
public class ClientCoinController {

	@Autowired
	private CoinServiceImpl coinServiceImpl;
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@PostMapping("/buy")
	public ResponseEntity<Map<String , String>> buyProductByCoin(@RequestBody String jsonFE) throws JsonMappingException, JsonProcessingException {
		
		Map<String , String> message = new HashMap<String, String>();
	
		//read json
		ObjectMapper objectMapper = new ObjectMapper();
		
		//get value
		CoinEntity coinProductBuy = objectMapper.readValue(jsonFE, CoinEntity.class);
		
		//get coint by id
		CoinEntity findCoinByUser =  coinServiceImpl.findUserOnTableCoin(coinProductBuy.getUser().getId_user());
		
		
		if(findCoinByUser.getAmount() < coinProductBuy.getAmount()) {
			message.put("Message-Buy","Not Enough Money, Please Top Up");
		}
		else {
			message.put("Message-Buy", "Success");
			findCoinByUser.setAmount(findCoinByUser.getAmount() -  coinProductBuy.getAmount());
			coinServiceImpl.save(findCoinByUser);
		}		
		return new ResponseEntity<Map<String , String>>(message,HttpStatus.OK);
	}
}
