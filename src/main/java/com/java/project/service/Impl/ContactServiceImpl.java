package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.ContactEntity;
import com.java.project.repository.ContactRepository;
import com.java.project.service.ContactService;
import com.java.project.service.ShareService;

@Service
public class ContactServiceImpl extends ShareService implements ContactService{

	@Autowired
	private ContactRepository contactRepo;

	@Override
	public List<ContactEntity> findAll() {
		return contactRepo.findAll();
	}

	@Override
	public Optional<ContactEntity> findById(Long id) {
		return contactRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		contactRepo.deleteById(id);
	}

	@Override
	public List<ContactEntity> findByName(String name) {
		return null;
	}

	@Override
	public ContactEntity updateContact(Optional<ContactEntity> contactEntity) {
		return contactRepo.save(contactEntity.get());
	}

	@Override
	public ContactEntity save(ContactEntity contactEntity) {
		return contactRepo.save(contactEntity);
	}	
}
