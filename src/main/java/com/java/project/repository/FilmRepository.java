package com.java.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.entity.FilmEntity;
import com.java.project.entity.ProductsEntity;

@Repository
public interface FilmRepository extends JpaRepository<FilmEntity, Long>{
	@Query("SELECT f FROM FilmEntity f WHERE f.title_film = :title_film")
	List<FilmEntity> findByName(@Param("title_film") String title_film);
}
