package com.java.project.controller.admin;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.CategoriesEntity;
import com.java.project.service.Impl.CategoriesServiceImpl;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoriesController {
	
	@Autowired
	private CategoriesServiceImpl categoriesServiceImpl;
	
	@GetMapping("/list") //data get = [{"id_categories":1,"name_categories":"ahah","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"},{"id_categories":2,"name_categories":"check","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"}]
	public String HomeCategoriesController(Model model) {
		List<CategoriesEntity> listCaregories = categoriesServiceImpl.findAll();
		model.addAttribute("listCategories",listCaregories);
		return "admin/categories/list";
	}
	
	@GetMapping("/{id}") 
	public String getCategoriesById(@PathVariable("id") Long id , Model model) {
		model.addAttribute("categoriesDetail", categoriesServiceImpl.findById(id));
		return "bbb";
	}
	
	@GetMapping("/search/{name}") 
	public String getCategoriesByName(@PathVariable("name") String name, Model model) {
		List<CategoriesEntity> getCategoriesName = categoriesServiceImpl.findByName(name);
		model.addAttribute("categoriesSearchName" , getCategoriesName);
		return "vvv";
	}
	
	@GetMapping("/edit")
	public String editCategories(@RequestParam("id") Long id ,Model model) {
		model.addAttribute("categoriesEdit" , categoriesServiceImpl.findById(id).get());
		return "/admin/categories/edit";
	}
	
	@PostMapping("/update")
	public String updateCategories(Model model , CategoriesEntity categoriesEntity) throws JsonMappingException, JsonProcessingException {

		Optional<CategoriesEntity> categoriesIn = categoriesServiceImpl.findById(categoriesEntity.getId_categories());
		System.out.println(categoriesIn);
		if(categoriesIn.isPresent() == true) {
			//get current date
			long millis=System.currentTimeMillis();   
			Date dateNow = new Date(millis); 
			categoriesIn.get().setName_categories(categoriesEntity.getName_categories());
			categoriesIn.get().setStatus_categories(categoriesEntity.getStatus_categories());
			categoriesIn.get().setModify_categories(dateNow);
			categoriesServiceImpl.save(categoriesIn.get());
		}else {
			model.addAttribute("responseAction","Error Update");
		}
		return "redirect:/admin/categories/list";
	}
	
	@GetMapping("/new")
	public String newCategories(CategoriesEntity categoriesEntity) throws JsonMappingException, JsonProcessingException {		
		return "admin/categories/add";
	}
	
	@PostMapping("/new")
	public String saveCategories(CategoriesEntity categoriesEntity){
		//set current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		CategoriesEntity categoriesNew = new CategoriesEntity();
		
		categoriesNew.setName_categories(categoriesEntity.getName_categories());
		categoriesNew.setStatus_categories(categoriesEntity.getStatus_categories());
		categoriesNew.setModify_categories(dateNow);
		categoriesNew.setUpdate_categories(dateNow);
		
		System.out.println("save categories" + categoriesEntity);
		categoriesServiceImpl.save(categoriesNew);
		return "redirect:/admin/categories/list";
	}
	
	//Use when need delete but table have foreign key
	@GetMapping("/delete/{id}")
	public String deleteCategoriesById(@PathVariable("id") Long id , Model model) {
		//check id exist
		Optional<CategoriesEntity> checkIdCategories = categoriesServiceImpl.findById(id); 
		Boolean flag = true;
		
		if(checkIdCategories.isPresent()) {
			flag = true;
			categoriesServiceImpl.deleteById(id);
		}else {
			flag = false;
		}
		model.addAttribute("categoriesDelete",flag);
		return "sss";
	}
}
