package com.java.project.service;

import java.util.List;
import java.util.Optional;

import com.java.project.entity.CategoriesEntity;

public abstract class ShareService {
	abstract public <T> List<T> findAll();
	abstract public <T> List<T> findByName(String name);
	abstract public <T> Optional<T> findById(Long id);
	abstract public void deleteById(Long id);
}