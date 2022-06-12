package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.CategoriesEntity;

public interface CategoriesService {
	CategoriesEntity updateCategories(Optional<CategoriesEntity> categoriesEntity);
	CategoriesEntity save(CategoriesEntity categoriesEntity);
}
