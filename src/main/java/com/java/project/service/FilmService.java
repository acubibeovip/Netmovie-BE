package com.java.project.service;

import java.util.List;
import java.util.Optional;

import com.java.project.entity.FilmEntity;
import com.java.project.entity.ProductsEntity;

public interface FilmService {
	FilmEntity updateFilm(Optional<FilmEntity> films);
	FilmEntity save(FilmEntity films);
	List<FilmEntity> findByFreeFilm(Long id);
	List<FilmEntity> findByGoldFilm(Long id);
	List<FilmEntity> filmFreeByCategories(Long id);
	List<FilmEntity> filmVipByCategories(Long id);
	List<FilmEntity> filmFreeByActor(Long id);
	List<FilmEntity> filmVipByActor(Long id);
}
