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
import com.java.project.entity.CommentEntity;
import com.java.project.service.Impl.CommentServiceImpl;

@Controller
@RequestMapping("/admin/comment")
public class AdminCommentController {

	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@GetMapping("/list") 
	public String HomeCommentController(Model model) {
		List<CommentEntity> listComments = commentServiceImpl.findAll();
		model.addAttribute("listComments",listComments);
		return "admin/comment/list";
	}
	
	@GetMapping("/{id}") 
	public String getCommentById(@PathVariable("id") Long id , Model model) {
		model.addAttribute("commentDetail", commentServiceImpl.findById(id));
		return "bbb";
	}
	
	@GetMapping("/search/{name}") 
	public String getCommentByName(@PathVariable("name") String name, Model model) {
		List<CommentEntity> getCommentName = commentServiceImpl.findByName(name);
		model.addAttribute("commentSearchName" , getCommentName);
		return "vvv";
	}
	
	@GetMapping("/edit")
	public String editComment(@RequestParam("id") Long id ,Model model) {
		model.addAttribute("commentEdit" , commentServiceImpl.findById(id).get());
		return "admin/comment/edit";
	}
	
	@PostMapping("/update")
	public String updateComment(Model model , CommentEntity commentEntity) throws JsonMappingException, JsonProcessingException {
		Optional<CommentEntity> commentIn = commentServiceImpl.findById(commentEntity.getId_comment());
		System.out.println(commentEntity);
		if(commentIn.isPresent() == true) {
			//get current date
			long millis=System.currentTimeMillis();   
			Date dateNow = new Date(millis); 
			
			commentIn.get().setStatus_comment(commentEntity.getStatus_comment());
			commentIn.get().setModify_comment(dateNow);
			commentServiceImpl.save(commentIn.get());
		}else {
	
		}
		return "redirect:/admin/comment/list";
	}
	
//	@GetMapping("/new")
//	public String newComment(CommentEntity commentEntity) throws JsonMappingException, JsonProcessingException {
//		ObjectMapper objectMapper = new ObjectMapper();
//		String jsonNeed = "{\"id_categories\":1,\"name_categories\":\"test insert ne hihi\",\"status_categories\":0,\"update_categories\":\"2022-05-04\",\"modify_categories\":\"2022-05-12\"}";
//		commentEntity = objectMapper.readValue( jsonNeed , CommentEntity.class);
//		
//		long millis=System.currentTimeMillis();   
//		Date dateNow = new Date(millis); 
//		
//		CommentEntity commentNew = new CommentEntity();
//		
//		commentNew.setComment(commentEntity.getComment());
//		commentNew.setStatus_comment(commentEntity.getStatus_comment());
//		commentNew.setModify_comment(dateNow);
//		commentNew.setUpdate_comment(dateNow);
//		commentNew.setId_user(commentEntity.getId_user());
//		commentNew.setId_ratting(commentEntity.getId_ratting());
//		commentNew.setId_film(commentEntity.getId_film());
//		commentServiceImpl.save(commentNew);
//		return "zzz";
//	}
	
	//Use when need delete but table have foreign key
	@GetMapping("/delete/{id}")
	public String deleteCommentById(@PathVariable("id") Long id , Model model) {
		//check id exist
		Optional<CommentEntity> checkIdComment= commentServiceImpl.findById(id); 
		Boolean flag = true;
		
		if(checkIdComment.isPresent()) {
			flag = true;
			commentServiceImpl.deleteById(id);
		}else {
			flag = false;
		}
		model.addAttribute("commentDelete",flag);
		return "sss";
	}
}
