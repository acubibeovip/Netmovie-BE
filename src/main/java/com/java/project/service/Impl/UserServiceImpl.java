package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.StorageEntity;
import com.java.project.entity.UserEntity;
import com.java.project.repository.StorageRepository;
import com.java.project.repository.UserRepository;
import com.java.project.service.ShareService;
import com.java.project.service.StorageService;
import com.java.project.service.UserService;

@Service
public class UserServiceImpl extends ShareService implements UserService{

	@Autowired
	private UserRepository userRepo;

	@Override
	public List<UserEntity> findAll() {
		return userRepo.findAll();
	}

	@Override
	public Optional<UserEntity> findById(Long id) {
		return userRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		userRepo.deleteById(id);
	}

	@Override
	public List<UserEntity> findByName(String name) {
		return null;
	}

	@Override
	public UserEntity updateUser(Optional<UserEntity> userEntity) {
		return userRepo.save(userEntity.get());
	}

	@Override
	public UserEntity save(UserEntity userEntity) {
		return userRepo.save(userEntity);
	}

	@Override
	public UserEntity findByEmail(String email) {
		return userRepo.findByEmail(email);
	}

	@Override
	public UserEntity findByUserName(String name) {
		return userRepo.findByName(name);
	}
	
	@Override
	public UserEntity findByPassword(String password) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public boolean verify(String verify) {
		UserEntity user = userRepo.findByVerificationCode(verify);
		if(user == null) {			
			return false;
		} else {
			return true;
		}	
	}
}
