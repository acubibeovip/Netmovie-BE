package com.java.project.controller.admin;

import java.sql.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.project.entity.FilmEntity;
import com.java.project.service.Impl.ActorServiceImpl;
import com.java.project.service.Impl.CategoriesServiceImpl;
import com.java.project.service.Impl.FilmServiceImpl;
import com.java.project.service.Impl.ProductsServiceImpl;
import com.java.project.service.Impl.StorageServiceImpl;

@Controller
@RequestMapping("/admin/film")
public class AdminFilmsController {

	@Autowired
	private FilmServiceImpl filmServiceImpl;
	
	@Autowired
	private CategoriesServiceImpl categoriesServiceImpl;
	
	@Autowired
	private ActorServiceImpl actorServiceImpl;
	
	@Autowired
	private StorageServiceImpl storageServiceImpl;
	
	@Autowired
	private ProductsServiceImpl productServiceImpl;
	
	@GetMapping("/list")
	public String HomeFilmController(Model model) {
		model.addAttribute("filmList",filmServiceImpl.findAll());
		return "admin/film/list";
	}
	
	@GetMapping("/new")
	public String newController(Model model) {
		model.addAttribute("categoriesList",categoriesServiceImpl.findAll());
		model.addAttribute("actorList",actorServiceImpl.findAll());
		model.addAttribute("storageList",storageServiceImpl.findAll());
		model.addAttribute("productList",productServiceImpl.findAll());
		return "admin/film/add";
	}
	
	@PostMapping("/new")
	public String saveController(FilmEntity filmEntity) {
		//get current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		FilmEntity newFilm = new FilmEntity();
		newFilm.setTitle_film(filmEntity.getTitle_film());
		newFilm.setDescription_film(filmEntity.getDescription_film());
		newFilm.setStatus_film(filmEntity.getStatus_film());
		newFilm.setUpdate_film(dateNow);
		newFilm.setModify_film(dateNow);
		newFilm.setCategories(filmEntity.getCategories());
		newFilm.setActor(filmEntity.getActor());
		newFilm.setStorage(filmEntity.getStorage());
		newFilm.setProduct(filmEntity.getProduct());
		filmServiceImpl.save(newFilm);
		return "redirect:/admin/film/list";
	}
	
	@GetMapping("/edit")
	public String editFilmController(Model model ,@RequestParam("id") Long id) {
		model.addAttribute("filmEdit",filmServiceImpl.findById(id).get());
		model.addAttribute("categoriesFilm" , 	categoriesServiceImpl.findAll());
		model.addAttribute("actorFilm" 		,	actorServiceImpl.findAll());
		model.addAttribute("storageFilm" 	, 	storageServiceImpl.findAll());
		model.addAttribute("productFilm" 	, 	productServiceImpl.findAll());
		return "/admin/film/edit";
	}
	
	@PostMapping("/update")
	public String saveUpdateFilm(Model model,FilmEntity filmEntity) {
		
		System.out.println(filmEntity);
		//get current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		Optional<FilmEntity> filmIn = filmServiceImpl.findById(filmEntity.getId_film());
		filmIn.get().setTitle_film(filmEntity.getTitle_film());
		filmIn.get().setDescription_film(filmEntity.getDescription_film());
		filmIn.get().setStatus_film(filmEntity.getStatus_film());
		filmIn.get().setModify_film(dateNow);
		filmIn.get().setCategories(filmEntity.getCategories());
		filmIn.get().setActor(filmEntity.getActor());
		filmIn.get().setStorage(filmEntity.getStorage());
		filmIn.get().setProduct(filmEntity.getProduct());
		
		filmServiceImpl.save(filmIn.get());
		return "redirect:/admin/film/list";
	}
}
