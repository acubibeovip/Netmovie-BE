package com.java.project.controller.client;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.java.project.entity.UserEntity;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.project.repository.UserRepository;
import com.java.project.service.Impl.UserServiceImpl;

import net.bytebuddy.utility.RandomString;

@RestController
@RequestMapping("/home/register")
public class ClientRegisterAccountController {

	@Autowired
	private UserRepository useRepo;
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSend;
	
	//url to verify
	public static String getURL(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		System.out.println("request   " + url);
		System.out.println("url.replace(request.getServletPath(), \"\")   " + url.replace(request.getServletPath(), ""));
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
		System.out.println("verify " +contentMail);
		
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
		System.out.println(userServiceImpl.verify(code));
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
	@GetMapping
	public ResponseEntity< Map<String,String> > registerAccountController(HttpServletRequest request) throws JsonMappingException, JsonProcessingException, UnsupportedEncodingException, MessagingException{
	
		//read json
		ObjectMapper objectMapper = new ObjectMapper();	
		String jsonNeed = "{\"id_user\":1,\"username\":\"new regis\",\"password\":\"112233\",\"name\":\"tran dang vy\",\"phone\":\"0906868797\",\"email\":\"vytdps19913@fpt.edu.vn\",\"address\":\"1134/26 truong sa\",\"gender\":1,\"role\":\"ROLE_USER\",\"status_user\":0,\"product\":{\"id_product\":5,\"name_product\":\"chua dang ky edit\",\"status_product\":0,\"update_product\":\"2022-06-07\",\"modify_product\":\"2022-06-07\",\"description_product\":\"bbbbbbb\"}}";

		//get value in user entity from json
		UserEntity userEntity = objectMapper.readValue( jsonNeed , UserEntity.class);
		
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
			
			//set value new and get data in user json
			UserEntity userNew = new UserEntity();
			userNew.setUsername(userEntity.getUsername());
			userNew.setPassword(bCryptPasswordEncoder.encode(userEntity.getPassword()));
			userNew.setName(userEntity.getName());
			userNew.setPhone(userEntity.getPhone());
			userNew.setEmail(userEntity.getEmail());
			userNew.setAddress(userEntity.getAddress());
			userNew.setGender(userEntity.getGender());
			userNew.setRole(userEntity.getRole());
			userNew.setStatus_user(userEntity.getStatus_user());
			userNew.setProduct(userEntity.getProduct());
			userNew.setVertification_code(randomVerification);
			userEntity.setVertification_code(randomVerification);
			userServiceImpl.save(userNew);
			
			//send mail verification
			String url = this.getURL(request);
			sendMailVerificationEmail(userEntity, url);
			
			
		}else {
			message = "Your email or your user name already exists , please register with new email";
			responseConsumer.put("Message-Consumer", message);
		}
		
		return new ResponseEntity<Map<String,String>>(responseConsumer,HttpStatus.OK);
	}
	
}
