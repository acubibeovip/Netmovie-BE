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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.ContactEntity;
import com.java.project.service.Impl.ContactServiceImpl;

@Controller
@RequestMapping("/admin/contact")
public class AdminContactController {
	@Autowired
	private ContactServiceImpl contactServiceImpl;
	
	@GetMapping("/list")
	public String HomeContactController(Model model) {
		List<ContactEntity> listContacts = contactServiceImpl.findAll();
		model.addAttribute("listContact",listContacts);
		return "/admin/contact/list";
	}
	
	@GetMapping("/{id}") //date get = Optional[CategoriesEntity(id_categories=1, name_categories=ahah, status_categories=1, update_categories=2022-05-04, modify_categories=2022-05-12)]
	public String getContactById(@PathVariable("id") Long id , Model model) {
		model.addAttribute("contactDetail", contactServiceImpl.findById(id));
		return "bbb";
	}
	
	@GetMapping("/search/{name}") //data get = [CategoriesEntity(id_categories=1, name_categories=ahah, status_categories=1, update_categories=2022-05-04, modify_categories=2022-05-12)]
	public String getContactByName(@PathVariable("name") String name, Model model) {
		List<ContactEntity> getContactName = contactServiceImpl.findByName(name);
		model.addAttribute("contactSearchName" , getContactName);
		return "vvv";
	}
	
	@GetMapping("/edit/{id}")//date get = {"id_categories":1,"name_categories":"ahah","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"}
	public Optional<ContactEntity> editContact(@PathVariable("id") Long id ,Model model) {
		model.addAttribute("contactEdit" , contactServiceImpl.findById(id));
		return (Optional<ContactEntity>) model.getAttribute("contactEdit");
	}
	
	@GetMapping("/update/{id}")
	public String updateContact(@PathVariable("id") Long id , Model model , ContactEntity contactEntity) throws JsonMappingException, JsonProcessingException {
		//need data FE = {"id_categories":1,"name_categories":"ahah","status_categories":1,"update_categories":"2022-05-04","modify_categories":"2022-05-12"};
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonNeed = "{\"id_categories\":1,\"name_categories\":\"test update ne hihi\",\"status_categories\":0,\"update_categories\":\"2022-05-04\",\"modify_categories\":\"2022-05-12\"}";
		contactEntity = objectMapper.readValue( jsonNeed , ContactEntity.class);
		Optional<ContactEntity> contactIn = contactServiceImpl.findById(id);
		if(contactIn.isPresent() == true) {
			//get current date
			long millis=System.currentTimeMillis();   
			Date dateNow = new Date(millis); 
			contactIn.get().setTitle_contact(contactEntity.getTitle_contact());
			contactIn.get().setMessage_contact(contactEntity.getMessage_contact());
			contactIn.get().setEmail_contact(contactEntity.getEmail_contact());
			contactIn.get().setPhone_contact(contactEntity.getPhone_contact());
			contactIn.get().setModify_contact(dateNow);
			contactServiceImpl.save(contactIn.get());
		}else {
	
		}
		return "hhh";
	}
	
	@GetMapping("/new")
	public String newContact(ContactEntity contactEntity) throws JsonMappingException, JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonNeed = "{\"id_categories\":1,\"name_categories\":\"test insert ne hihi\",\"status_categories\":0,\"update_categories\":\"2022-05-04\",\"modify_categories\":\"2022-05-12\"}";
		contactEntity = objectMapper.readValue( jsonNeed , ContactEntity.class);
		
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		ContactEntity contactNew = new ContactEntity();
		
		contactNew.setTitle_contact(contactEntity.getTitle_contact());
		contactNew.setMessage_contact(contactEntity.getMessage_contact());
		contactNew.setEmail_contact(contactEntity.getEmail_contact());
		contactNew.setPhone_contact(contactEntity.getPhone_contact());
		contactNew.setModify_contact(dateNow);
		contactNew.setUpdate_contact(dateNow);
		contactServiceImpl.save(contactNew);
		return "zzz";
	}
	
	//Use when need delete but table have foreign key
	@GetMapping("/delete/{id}")
	public String deleteContactById(@PathVariable("id") Long id , Model model) {
		//check id exist
		Optional<ContactEntity> checkIdContact= contactServiceImpl.findById(id); 
		Boolean flag = true;
		
		if(checkIdContact.isPresent()) {
			flag = true;
			contactServiceImpl.deleteById(id);
		}else {
			flag = false;
		}
		model.addAttribute("contactDelete",flag);
		return "sss";
	}
	
}
