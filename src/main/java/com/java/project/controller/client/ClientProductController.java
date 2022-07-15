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

import com.java.project.entity.ProductsEntity;
import com.java.project.rabbitmq.service.RabbitMQSender;
import com.java.project.service.Impl.ProductsServiceImpl;

@RestController
@RequestMapping("/home/product")
public class ClientProductController {

	@Autowired
	private ProductsServiceImpl productServiceImpl;
	
	@Autowired
	private RabbitMQSender rabbitMQSender;
	
	@GetMapping("/find-all")
	public ResponseEntity<Map<String,List>> getProduct(){
		Map<String,List> product = new HashMap<String, List>();
		product.put("Products", productServiceImpl.findAll());

		//rabbitMQSender.send(productServiceImpl.findAll());
		return new ResponseEntity<Map<String,List>>(product,HttpStatus.OK);
	}
}
