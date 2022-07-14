package com.java.project.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.java.project.service.Impl.OrderServiceImpl;

@RestController
@RequestMapping("/home/order")
public class ClientOrderController {

	
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	@GetMapping("/list")
	public ResponseEntity<Map<String,List>> ListOrderController(@RequestParam("id") Long id,Model model) {
		Map<String,List> dataOrderByUser = new HashMap<String, List>();
		dataOrderByUser.put("Order-By-User", orderServiceImpl.findAllByUserId(id));
		return new ResponseEntity<Map<String,List>>(dataOrderByUser,HttpStatus.OK);
	}
}
