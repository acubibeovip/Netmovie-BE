package com.java.project.controller.admin;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.ProductsEntity;
import com.java.project.service.Impl.CategoriesServiceImpl;
import com.java.project.service.Impl.ProductsServiceImpl;

@Controller
@RequestMapping("/admin/product")
public class AdminProductsController {
	
	@Autowired
	private ProductsServiceImpl productsServiceImpl;
	
	@GetMapping("list") //data get = [{"id_categories":1,"name_categories":"ahah","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"},{"id_categories":2,"name_categories":"check","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"}]
	public String HomeProductsController(Model model) {
		List<ProductsEntity> listProducts = productsServiceImpl.findAll();
		model.addAttribute("listProducts",listProducts);
		return "admin/product/list";
	}
	
	@GetMapping("/{id}") //date get = Optional[CategoriesEntity(id_categories=1, name_categories=ahah, status_categories=1, update_categories=2022-05-04, modify_categories=2022-05-12)]
	public String getProductsById(@PathVariable("id") Long id , Model model) {
		model.addAttribute("productsDetail", productsServiceImpl.findById(id));
		return "bbb";
	}
	
	@GetMapping("/search/{name}") //data get = [CategoriesEntity(id_categories=1, name_categories=ahah, status_categories=1, update_categories=2022-05-04, modify_categories=2022-05-12)]
	public String getProductsByName(@PathVariable("name") String name, Model model) {
		List<ProductsEntity> getProductsName = productsServiceImpl.findByName(name);
		model.addAttribute("productsSearchName" , getProductsName);
		return "vvv";
	}
	
	@GetMapping("/edit")
	public String editProducts(@RequestParam("id") Long id ,Model model) {
		model.addAttribute("productsEdit" , productsServiceImpl.findById(id).get());
		return "/admin/product/edit";
	}
	
	@PostMapping("/update")
	public String updateProducts(Model model , ProductsEntity productsEntity) {
		Optional<ProductsEntity> productsIn = productsServiceImpl.findById(productsEntity.getId_product());
		System.out.println(productsEntity);
		
		if(productsIn.isPresent() == true) {
			//get current date
			long millis=System.currentTimeMillis();   
			Date dateNow = new Date(millis); 
			
			productsIn.get().setName_product(productsEntity.getName_product());
			productsIn.get().setStatus_product(productsEntity.getStatus_product());
			productsIn.get().setModify_product(dateNow);
			productsIn.get().setDescription_product(productsEntity.getDescription_product());
			productsEntity.setModify_product(dateNow);
			productsServiceImpl.save(productsIn.get());
		}else {
	
		}
		return "redirect:/admin/product/list";
	}
	
	@GetMapping("/new")
	public String newProducts(ProductsEntity productsEntity) {
		return "/admin/product/add";
	}
	
	@PostMapping("/new")
	public String saveProduct(ProductsEntity productsEntity) {	
		//set current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		//set value
		ProductsEntity ProductNew = new ProductsEntity();
		
		ProductNew.setName_product(productsEntity.getName_product());
		ProductNew.setStatus_product(productsEntity.getStatus_product());
		ProductNew.setDescription_product(productsEntity.getDescription_product());
		ProductNew.setModify_product(dateNow);
		ProductNew.setUpdate_product(dateNow);
		
		//save service
		productsServiceImpl.save(ProductNew);
		return "redirect:/admin/product/list";
	}
	
	//Use when need delete but table have foreign key
	@GetMapping("/delete/{id}")
	public String deleteProductsById(@PathVariable("id") Long id , Model model) {
		//check id exist
		Optional<ProductsEntity> checkIdProducts= productsServiceImpl.findById(id); 
		Boolean flag = true;
		
		if(checkIdProducts.isPresent()) {
			flag = true;
			productsServiceImpl.deleteById(id);
		}else {
			flag = false;
		}
		model.addAttribute("productsDelete",flag);
		return "sss";
	}
}
