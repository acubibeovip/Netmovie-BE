package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.ProductsEntity;

public interface ProductsService {
	ProductsEntity updateProducts(Optional<ProductsEntity> products);
	ProductsEntity save(ProductsEntity products);
}
