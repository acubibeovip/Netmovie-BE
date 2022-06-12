package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.CategoriesEntity;
import com.java.project.repository.CategoryRepository;
import com.java.project.service.CategoriesService;
import com.java.project.service.ShareService;

/**
 *	author DangVy
 *	categories admin
 **/

@Service
public class CategoriesServiceImpl extends ShareService implements CategoriesService{
	
	@Autowired
	private CategoryRepository categoriesRepo;

	@Override
	public List<CategoriesEntity> findAll() {
		return categoriesRepo.findAll();
	}

	@Override
	public Optional<CategoriesEntity> findById(Long id) {
		return categoriesRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		categoriesRepo.deleteById(id);
	}

	@Override
	public List<CategoriesEntity> findByName(String name) {
		return categoriesRepo.findByName(name);
	}

	@Override
	public CategoriesEntity updateCategories(Optional<CategoriesEntity> categoriesEntity) {
		return categoriesRepo.save(categoriesEntity.get());
	}

	@Override
	public CategoriesEntity save(CategoriesEntity categoriesEntity) {
		return categoriesRepo.save(categoriesEntity);
	}	
	
}
