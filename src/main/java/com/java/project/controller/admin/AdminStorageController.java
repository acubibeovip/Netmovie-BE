package com.java.project.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.ProductsEntity;
import com.java.project.entity.StorageEntity;
import com.java.project.service.Impl.ProductsServiceImpl;
import com.java.project.service.Impl.StorageServiceImpl;

@Controller
@RequestMapping("/admin/storage")
public class AdminStorageController {
	
	@Autowired
	private StorageServiceImpl storageServiceImpl;
	
	
	
	@GetMapping("/new")
	public String newStorage(StorageEntity storageEntity,Model model, HttpServletRequest request) throws IOException{
		return "/admin/storage/add";
	}
	
	@PostMapping("/new")
	public String saveStorage(@RequestParam("imageStorage") MultipartFile imageFile ,@RequestParam("videoStorage") MultipartFile videoFile , Model model ,StorageEntity storageEntity) throws IllegalStateException, IOException {		
			
		StorageEntity storageNew = new StorageEntity();
		
		//get current date
		long millis=System.currentTimeMillis();   
		Date dateNow = new Date(millis); 
		
		
		//get extensiton
		int dot = videoFile.getOriginalFilename().lastIndexOf('.');
		String base = (dot == -1) ? videoFile.getOriginalFilename() : videoFile.getOriginalFilename().substring(0, dot);
		
		
		//set up entity
		storageNew.setVideo_storage(base);
		storageNew.setId_user(storageEntity.getId_user());
		storageNew.setDescription_storage(storageEntity.getDescription_storage());
		storageNew.setImage_storage(imageFile.getOriginalFilename());
		storageNew.setUpdate_storage(dateNow);
		storageNew.setModify_storage(dateNow);
		
		
		//get current director and save video in library
		String currentPath = new File(".").getCanonicalPath();
		imageFile.transferTo(new File(currentPath+"\\target\\classes\\static\\img\\"+imageFile.getOriginalFilename()));
		videoFile.transferTo(new File(currentPath+"\\target\\classes\\videos\\"+videoFile.getOriginalFilename()));
		
		//save in database
		storageServiceImpl.save(storageNew);
		return "redirect:/admin/storage/list";
	}
	
	
	@GetMapping("/list")
	public String HomeStorageController(Model model) {
		List<StorageEntity> listStorage = storageServiceImpl.findAll();
		model.addAttribute("listStorage",listStorage);
		return "admin/storage/list";
	}
	
	@GetMapping("/storage/{id}") 
	public String getStorageById(@PathVariable("id") Long id , Model model) {
		model.addAttribute("storageDetail", storageServiceImpl.findById(id));
		return "bbb";
	}
	
	@GetMapping("/storage/search/{name}") 
	public String getStorageByName(@PathVariable("name") String name, Model model) {
		List<StorageEntity> getStorageName = storageServiceImpl.findByName(name);
		model.addAttribute("storageSearchName" , getStorageName);
		return "vvv";
	}
	
	@GetMapping("/edit")
	public String editStorage(@RequestParam("id") Long id ,Model model) {
		model.addAttribute("storageEdit" , storageServiceImpl.findById(id).get());
		return "/admin/storage/edit";
	}
	
	@PostMapping("/update")
	public String updateActor(@RequestParam("imageStorage") MultipartFile imgStorage, @RequestParam("videoStorage") MultipartFile videoStorage , Model model , StorageEntity storageEntity) throws IOException {
		Optional<StorageEntity> storageIn = storageServiceImpl.findById(storageEntity.getId_storage());
		System.out.println(storageEntity);
//		
//		// get old data
//		String imgPastData = storageIn.get().getImage_storage();
//		String videoPastData = storageIn.get().getVideo_storage();
//		
//		//get extensiton
//		int dot = videoStorage.getOriginalFilename().lastIndexOf('.');
//		
//
//		if(storageIn.isPresent() == true) {
//			//get current date
//			long millis=System.currentTimeMillis();   
//			Date dateNow = new Date(millis); 
//			
//			//image
//			try {
//				//set value
//				storageIn.get().setImage_storage(imgStorage.getOriginalFilename());
//				
//				//save folder
//				String currentPath = new File(".").getCanonicalPath();
//				imgStorage.transferTo(new File(currentPath+"\\target\\classes\\static\\img\\"+imgStorage.getOriginalFilename()));
//			} catch (IOException e) {
//				storageIn.get().setImage_storage(imgPastData);
//			}
//			
//			//video
//			try {
//				
//				//set value
//				String base = (dot == -1) ? videoStorage.getOriginalFilename() : videoStorage.getOriginalFilename().substring(0, dot);
//				storageIn.get().setVideo_storage(base);					
//				
//				//save folder
//				String currentPath = new File(".").getCanonicalPath();
//				videoStorage.transferTo(new File(currentPath+"\\target\\classes\\videos\\"+videoStorage.getOriginalFilename()));
//			} catch (IOException e) {
//				storageIn.get().setVideo_storage(videoPastData);
//			}
//			storageIn.get().setModify_storage(dateNow);
//			storageIn.get().setDescription_storage(storageEntity.getDescription_storage());
			//storageServiceImpl.save(storageIn.get());
//		}else {
//	
//		}
		return "redirect:/admin/storage/list";
	}
	
	//Use when need delete but table have foreign key
//	@GetMapping("/actor/delete/{id}")
//	public String deleteActorById(@PathVariable("id") Long id , Model model) {
//		//check id exist
//		Optional<ActorEntity> checkIdActor = actorServiceImpl.findById(id); 
//		Boolean flag = true;
//		
//		if(checkIdActor.isPresent()) {
//			flag = true;
//			actorServiceImpl.deleteById(id);
//		}else {
//			flag = false;
//		}
//		model.addAttribute("actorDelete",flag);
//		return "sss";
//	}
}
