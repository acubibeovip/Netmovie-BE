package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.StorageEntity;
import com.java.project.repository.ActorRepository;
import com.java.project.repository.CategoryRepository;
import com.java.project.service.ActorService;
import com.java.project.service.CategoriesService;
import com.java.project.service.ShareService;

@Service
public class ActorServiceImpl extends ShareService implements ActorService{
	
	@Autowired
	private ActorRepository actorRepo;

	@Override
	public List<ActorEntity> findAll() {
		return actorRepo.findAll();
	}

	@Override
	public Optional<ActorEntity> findById(Long id) {
		return actorRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		actorRepo.deleteById(id);
	}

	@Override
	public List<ActorEntity> findByName(String name) {
		return actorRepo.findByName(name);
	}

	@Override
	public ActorEntity updateActor(Optional<ActorEntity> categoriesEntity) {
		return actorRepo.save(categoriesEntity.get());
	}

	@Override
	public ActorEntity save(ActorEntity categoriesEntity) {
		return actorRepo.save(categoriesEntity);
	}	
	
	public List<ActorEntity> findByCountry(String country) {
		return actorRepo.findByCountry(country);
	}
//	
//
//	public List<StorageEntity> findVideoByActor(Long id) {
//		return actorRepo.findVideoByActor(id);
//	}
}
