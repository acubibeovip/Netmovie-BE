package com.java.project.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.ActorEntity;
import com.java.project.entity.CategoriesEntity;
import com.java.project.service.Impl.ActorServiceImpl;

@Controller
@RequestMapping("/admin/actor")
public class AdminActorController {

	
	@Autowired
	private ActorServiceImpl actorServiceImpl;
		
	@GetMapping("/list") 
	public String HomeActorController(Model model) {
		List<ActorEntity> listActor = actorServiceImpl.findAll();
		model.addAttribute("listActor",listActor);
		return "admin/actor/list";
	}
	
	@GetMapping("/{id}") 
	public String getActorById(@PathVariable("id") Long id , Model model) {
		model.addAttribute("actorDetail", actorServiceImpl.findById(id));
		return "bbb";
	}
	
	@GetMapping("/search/{name}") 
	public String getActorByName(@PathVariable("name") String name, Model model) {
		List<ActorEntity> getActorName = actorServiceImpl.findByName(name);
		model.addAttribute("actorSearchName" , getActorName);
		return "vvv";
	}
	
	@GetMapping("/edit")
	public String editActor(@RequestParam("id") Long id , Model model) {
		model.addAttribute("actorEdit" , actorServiceImpl.findById(id).get());
		return "admin/actor/edit";
	}
	
	@PostMapping("/update")
	public String saveActor(@RequestParam("imageActor") MultipartFile imgActor ,Model model,ActorEntity actorEntity) throws IOException {
		Optional<ActorEntity> actorIn = actorServiceImpl.findById(actorEntity.getId_actor());
		String imgNameActor = actorIn.get().getImage_actor();
		
		if(actorIn.isPresent() == true) {
			//get current date
			long millis=System.currentTimeMillis();   
			System.out.println("asdada"+imgActor.getOriginalFilename());
			Date dateNow = new Date(millis); 
			
				try {					
					actorIn.get().setImage_actor(imgActor.getOriginalFilename());		
					//set value				
					//get current director and save video in library
					String currentPath = new File(".").getCanonicalPath();
					imgActor.transferTo(new File(currentPath+"\\target\\classes\\static\\img\\"+imgActor.getOriginalFilename()));
				}
				catch(IOException io) {
					actorIn.get().setImage_actor(imgNameActor);
				}
				actorIn.get().setName_actor(actorEntity.getName_actor());
				actorIn.get().setCountry_actor(actorEntity.getCountry_actor());
				actorIn.get().setAge_actor(actorEntity.getAge_actor());
				actorIn.get().setFollow_actor(actorEntity.getFollow_actor());
				actorIn.get().setModify_actor(dateNow);
				actorServiceImpl.save(actorIn.get());
			
		}else {
			model.addAttribute("responseAction","Error Update");
		}
		return "redirect:/admin/actor/list";
	}
	
//	@GetMapping("/actor/update/{id}")
//	public String updateActor(@PathVariable("id") Long id , Model model , ActorEntity actorEntity) throws JsonMappingException, JsonProcessingException {
//		//need data FE = {"id_categories":1,"name_categories":"ahah","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"};
//		ObjectMapper objectMapper = new ObjectMapper();
//		String jsonNeed = "{\"id_categories\":1,\"name_categories\":\"test update ne hihi\",\"status_categories\":0,\"update_categories\":\"2022-05-04\",\"modify_categories\":\"2022-05-12\"}";
//		actorEntity = objectMapper.readValue( jsonNeed , ActorEntity.class);
//		Optional<ActorEntity> actorIn = actorServiceImpl.findById(id);
//		if(actorIn.isPresent() == true) {
//			//get current date
//			long millis=System.currentTimeMillis();   
//			Date dateNow = new Date(millis); 
//			actorIn.get().setName_actor(actorEntity.getName_actor());
//			actorIn.get().setCountry_actor(actorEntity.getCountry_actor());
//			actorIn.get().setAge_actor(actorEntity.getAge_actor());
//			actorIn.get().setFollow_actor(actorEntity.getFollow_actor());
//			actorIn.get().setModify_actor(dateNow);
//			actorServiceImpl.save(actorIn.get());
//		}else {
//	
//		}
//		return "hhh";
//	}
	
	@GetMapping("/new")
	public String newActor( ActorEntity actorEntity) throws JsonMappingException, JsonProcessingException {
		return "/admin/actor/add";
	}
	
	@PostMapping("/new")
	public String saveActor(@RequestParam("imageActor") MultipartFile imageActor, ActorEntity actorEntity) throws IOException {
		
		//get current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		//set new actor
		ActorEntity actorNew = new ActorEntity();
		actorNew.setName_actor(actorEntity.getName_actor());
		actorNew.setImage_actor(imageActor.getOriginalFilename());
		actorNew.setCountry_actor(actorEntity.getCountry_actor());
		actorNew.setAge_actor(actorEntity.getAge_actor());
		actorNew.setFollow_actor(actorEntity.getFollow_actor());
		actorNew.setUpdate_actor(dateNow);
		actorNew.setModify_actor(dateNow);
		
		//get current director and save video in library
		String currentPath = new File(".").getCanonicalPath();
		System.out.println("asd"+imageActor);
		imageActor.transferTo(new File(currentPath+"\\target\\classes\\static\\img\\"+imageActor.getOriginalFilename()));

		actorServiceImpl.save(actorNew);
		return "redirect:/admin/actor/list";
	}
	
	//Use when need delete but table have foreign key
	@GetMapping("/actor/delete/{id}")
	public String deleteActorById(@PathVariable("id") Long id , Model model) {
		//check id exist
		Optional<ActorEntity> checkIdActor = actorServiceImpl.findById(id); 
		Boolean flag = true;
		
		if(checkIdActor.isPresent()) {
			flag = true;
			actorServiceImpl.deleteById(id);
		}else {
			flag = false;
		}
		model.addAttribute("actorDelete",flag);
		return "sss";
	}
}
