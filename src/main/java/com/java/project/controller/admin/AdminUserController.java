package com.java.project.controller.admin;

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

import com.java.project.entity.UserEntity;
import com.java.project.service.Impl.ProductsServiceImpl;
import com.java.project.service.Impl.UserServiceImpl;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private ProductsServiceImpl productServiceImpl;
	
	@GetMapping("/list")
	public String HomeUserController(Model model) {
		List<UserEntity> listUser = userServiceImpl.findAll();
		model.addAttribute("userList",listUser);
		System.out.println("sss---    "+userServiceImpl.findAll());
		return "admin/user/list";
	}
	
	@GetMapping("/edit")
	public String EditUserController(Model model , @RequestParam("id") Long id) {
		model.addAttribute("userEdit" , userServiceImpl.findById(id).get());
		model.addAttribute("productList", productServiceImpl.findAll());
		return "/admin/user/edit";
	}
	
	@PostMapping("/update")
	public String saveUser(Model model , UserEntity userEntity) {
		
		 Optional<UserEntity> userCheck = userServiceImpl.findById(userEntity.getId_user());
		
		 if(userCheck.isPresent() == true) {
			//get current date
			long millis=System.currentTimeMillis();   
			Date dateNow = new Date(millis);
			
			//set value
			userCheck.get().setRole(userEntity.getRole());
			userCheck.get().setStatus_user(userEntity.getStatus_user());
			userCheck.get().setProduct(userEntity.getProduct());
			userServiceImpl.save(userCheck.get());
			
		}else {
			model.addAttribute("responseAction","Error Update");
		}
		
		
		
		return "redirect:/admin/user/list";
	}
}
