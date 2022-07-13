package com.java.project.controller.admin;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.project.entity.CommentEntity;
import com.java.project.entity.OrderEntity;
import com.java.project.service.Impl.OrderServiceImpl;
import com.java.project.service.Impl.UserServiceImpl;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {
	
	
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@GetMapping("/list")
	public String HomeOrderController(Model model) {
		List<OrderEntity> orderList = orderServiceImpl.findAll();
		model.addAttribute("orderList", orderList );
		return "admin/order/list";
	}
	
	@GetMapping("/edit")
	public String editOrderController(@RequestParam("id") Long id, Model model) {
		model.addAttribute("orderEdit" ,orderServiceImpl.findById(id).get());
		model.addAttribute("userOrder", userServiceImpl.findAll());
		return "admin/order/edit";
	}
	
	@PostMapping("/update")
	public String updateOrder(OrderEntity orderEntity) {
		//get current date
		long millis = System.currentTimeMillis();
		Date dateNow = new Date(millis);

		Optional<OrderEntity> orderIn = orderServiceImpl.findById(orderEntity.getId_order());
		
		orderIn.get().setModify_order(dateNow);
		orderIn.get().setStatus(orderEntity.getStatus());
		
		orderServiceImpl.save(orderIn.get());
		
		return "redirect:/admin/order/list";
	}
}
