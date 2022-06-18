package com.java.project.controller.client;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.java.project.entity.UserEntity;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.repository.UserRepository;
import com.java.project.service.Impl.ProductsServiceImpl;
import com.java.project.service.Impl.UserServiceImpl;

import net.bytebuddy.utility.RandomString;

@RestController
@RequestMapping("/home/register")
@CrossOrigin(origins = "http://localhost:4200")
public class ClientRegisterAccountController {

	@Autowired
	private UserRepository useRepo;
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private ProductsServiceImpl productServiceImpl;
	
	
	@Autowired
	private JavaMailSender mailSend;
	
	//url to verify
	public static String getURL(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		return url.replace(request.getServletPath(), "");
	}
	
	//send mail
	public void sendMailVerificationEmail(UserEntity userEntity,String url) throws UnsupportedEncodingException, MessagingException {
		String subject = "Please verify your registration";
		String senderName="Net Movie";
		String contentMail = "<p>Dear " + userEntity.getName()+",</p>";
		contentMail += "<p>Please click the link below to verify to you registration</p>";
		
		//get url verification
		String verifyURL = url + "/home/register/verify?code=" + userEntity.getVertification_code();
		//end
		
		contentMail += "<h3> <a href=\"" + verifyURL + "\">VERIFY ACCOUNT</a></h3>";	
		
		contentMail += "<p>Thanks you.</p>";
		
		MimeMessage message = mailSend.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom(userEntity.getEmail(),senderName);
		helper.setTo(userEntity.getEmail());
		helper.setSubject(subject);
		helper.setText(contentMail,true);
		
		mailSend.send(message);
	}
	
	//verify link
	@GetMapping("/verify")
	public ResponseEntity<Map<String , String>> verifyCode(@RequestParam("code") String code){
		Boolean flag = userServiceImpl.verify(code);
		Map<String , String> messageVerify = new HashMap<String, String>();
		if(flag == true) {
			UserEntity updateStatusUser = useRepo.findByVerificationCode(code);
			updateStatusUser.setStatus_user(1);
			userServiceImpl.save(updateStatusUser);
			messageVerify.put("Message-verify", "Success Verify");
			return new ResponseEntity<Map<String,String>>(messageVerify,HttpStatus.OK);
		}else {			
			messageVerify.put("Message-verify", "Fail Verify");
			return new ResponseEntity<Map<String,String>>(messageVerify,HttpStatus.OK);
		}
	}
	
	//create account
	@PostMapping
	public ResponseEntity< Map<String,String> > registerAccountController(@RequestBody String jsonFromFE,HttpServletRequest request) throws JsonMappingException, JsonProcessingException, UnsupportedEncodingException, MessagingException{
	
		//read json
		ObjectMapper objectMapper = new ObjectMapper();	
		
		//get value in user entity from json
		UserEntity userEntity = objectMapper.readValue( jsonFromFE , UserEntity.class);
		
		//check email user
		UserEntity userCheckEmail = userServiceImpl.findByEmail(userEntity.getEmail());
		
		//check username
		UserEntity userCheckUserName = userServiceImpl.findByUserName(userEntity.getUsername());
		
		//message
		String message = "";
		
		//Create Response Consumer
		Map<String,String> responseConsumer = new HashMap<String, String>();
		
		//Random veritication code
		String randomVerification = RandomString.make(64);
		
		//check and save
		if( userCheckEmail == null && userCheckUserName == null) {
			message = "Register Success , please check your gmail and submit letter";
			responseConsumer.put("Message-Consumer", message);
			
			//change
			double productDefault = 1;
			long changeTypeProduct = (long) productDefault ;
			
			//set value new and get data in user json
			UserEntity userNew = new UserEntity();
			userNew.setUsername(userEntity.getUsername());
			userNew.setPassword(bCryptPasswordEncoder.encode(userEntity.getPassword()));
			userNew.setName(userEntity.getName());
			userNew.setPhone(userEntity.getPhone());
			userNew.setEmail(userEntity.getEmail());
			userNew.setAddress(userEntity.getAddress());
			userNew.setGender(userEntity.getGender());
			userNew.setRole("ROLE_USER");
			userNew.setStatus_user(0);
			userNew.setProduct(productServiceImpl.findById(changeTypeProduct).get());
			userNew.setVertification_code(randomVerification);
			userEntity.setVertification_code(randomVerification);
			System.out.println("user new   ---"+userNew);
			userServiceImpl.save(userNew);
			
			//send mail verification
			String url = this.getURL(request);
			sendMailVerificationEmail(userEntity, url);
			
			System.out.println(userNew);
			
		}else {
			message = "Your email or your user name already exists , please register with new email";
			responseConsumer.put("Message-Consumer", message);
		}
		return new ResponseEntity<Map<String,String>>(responseConsumer,HttpStatus.OK);
	}
	
}
