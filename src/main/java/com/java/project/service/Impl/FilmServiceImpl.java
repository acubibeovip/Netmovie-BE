package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.FilmEntity;
import com.java.project.entity.ProductsEntity;
import com.java.project.repository.FilmRepository;
import com.java.project.repository.ProductsRepository;
import com.java.project.service.ActorService;
import com.java.project.service.FilmService;
import com.java.project.service.ShareService;

@Service
public class FilmServiceImpl extends ShareService implements FilmService {

	@Autowired
	private FilmRepository filmRepo;

	@Override
	public List<FilmEntity> findAll() {
		return filmRepo.findAll();
	}

	@Override
	public Optional<FilmEntity> findById(Long id) {
		return filmRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		filmRepo.deleteById(id);
	}

	@Override
	public List<FilmEntity> findByName(String name) {
		return filmRepo.findByName(name);
	}

	@Override
	public FilmEntity updateFilm(Optional<FilmEntity> filmEntity) {
		return filmRepo.save(filmEntity.get());
	}

	@Override
	public FilmEntity save(FilmEntity filmEntity) {
		return filmRepo.save(filmEntity);
	}	
}
