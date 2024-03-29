package com.java.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.FilmEntity;
import com.java.project.entity.ProductsEntity;

@Repository
public interface FilmRepository extends JpaRepository<FilmEntity, Long>{
	@Query("SELECT f FROM FilmEntity f WHERE f.title_film = :title_film")
	List<FilmEntity> findByName(@Param("title_film") String title_film);
	
	@Query("SELECT f FROM FilmEntity f WHERE f.product.id_product = ?1")
	List<FilmEntity> findByFilmFree(@Param("id_product") Long id_product);
	
	@Query("SELECT f FROM FilmEntity f WHERE f.product.id_product != ?1")
	List<FilmEntity> findByFilmGold(@Param("id_product") Long id);
	
	@Query("SELECT f FROM FilmEntity f WHERE f.categories.id_categories = :id AND f.product.id_product = 1")
	List<FilmEntity> findFreeFilmByCategories(@Param("id") Long id);
	
	@Query("SELECT f FROM FilmEntity f WHERE f.categories.id_categories = :id AND f.product.id_product != 1")
	List<FilmEntity> findVipFilmByCategories(@Param("id") Long id);

	@Query("SELECT f FROM FilmEntity f WHERE f.actor.id_actor = :id AND f.product.id_product = 1")
	List<FilmEntity> findFreeFilmByActor(@Param("id") Long id);

	@Query("SELECT f FROM FilmEntity f WHERE f.actor.id_actor = :id AND f.product.id_product != 1")
	List<FilmEntity> findVipFilmByActor(@Param("id") Long id);
}
