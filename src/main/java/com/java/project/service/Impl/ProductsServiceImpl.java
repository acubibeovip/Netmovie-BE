package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.ProductsEntity;
import com.java.project.repository.ProductsRepository;
import com.java.project.service.ProductsService;
import com.java.project.service.ShareService;


/**
 *	author DangVy
 *	products admin
 **/


@Service
public class ProductsServiceImpl extends ShareService implements ProductsService {


	@Autowired
	private ProductsRepository productsRepo;

	@Override
	public List<ProductsEntity> findAll() {
		return productsRepo.findAll();
	}

	@Override
	public Optional<ProductsEntity> findById(Long id) {
		return productsRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		productsRepo.deleteById(id);
	}

	@Override
	public List<ProductsEntity> findByName(String name) {
		return productsRepo.findByName(name);
	}

	@Override
	public ProductsEntity updateProducts(Optional<ProductsEntity> productsEntity) {
		return productsRepo.save(productsEntity.get());
	}

	@Override
	public ProductsEntity save(ProductsEntity productsEntity) {
		return productsRepo.save(productsEntity);
	}	

}
