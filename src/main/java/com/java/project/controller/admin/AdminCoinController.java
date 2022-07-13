package com.java.project.controller.admin;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.CoinEntity;
import com.java.project.service.Impl.CoinServiceImpl;
import com.java.project.service.Impl.UserServiceImpl;

@Controller
@RequestMapping("/admin/coin")
public class AdminCoinController {
	
	@Autowired
	private CoinServiceImpl coinServiceImpl;
	
	@Autowired
	private UserServiceImpl userServiceImpl;

	@GetMapping("/list")
	public String HomeCoinController(Model model) {
		List<CoinEntity> listCoin = coinServiceImpl.findAll();
		model.addAttribute("listCoin", listCoin);
		return "admin/coin/list";
	}
	
	@GetMapping("/new")
	public String NewCoinController(Model model) {
		model.addAttribute("userList",userServiceImpl.findAll());
		return "admin/coin/add";
	}
	
	@PostMapping("/new")
	public String saveCoinController(Model model,CoinEntity coinEntity) {
		//get current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		//set new actor
		CoinEntity coinNew = new CoinEntity();
		coinNew.setAmount(coinEntity.getAmount());
		coinNew.setStatus(coinEntity.getStatus());
		coinNew.setUser(coinEntity.getUser());
		coinNew.setUpdate_coin(dateNow);
		coinNew.setModify_coin(dateNow);
		
		coinServiceImpl.save(coinNew);
		return "redirect:/admin/coin/list";
	}
	
	@GetMapping("/edit")
	public String editCoinController(Model model , @RequestParam("id") Long id) {
		model.addAttribute("editCoin", coinServiceImpl.findById(id).get());
		model.addAttribute("userCoin", userServiceImpl.findAll());
		return "admin/coin/edit";
	}
	
	@PostMapping("/update")
	public String updateCoinController(Model model, CoinEntity coinEntity ) {
		
		//get current date
		long millis = System.currentTimeMillis();
		Date dateNow = new Date(millis);
		
		
		Optional<CoinEntity> coinIn = coinServiceImpl.findById(coinEntity.getId_coin());
		if(coinIn.isPresent()) {
			coinIn.get().setAmount(coinEntity.getAmount());
			coinIn.get().setStatus(coinEntity.getStatus());
			coinIn.get().setModify_coin(dateNow);
			coinIn.get().setUser(coinEntity.getUser());
			coinServiceImpl.save(coinIn.get());
			model.addAttribute("editCoin","Success");
		}else {
			model.addAttribute("editCoin","Fail");
		}
		return "redirect:/admin/coin/list";
	}
}
