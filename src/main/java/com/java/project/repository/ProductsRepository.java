package com.java.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.entity.ProductsEntity;

@Repository
public interface ProductsRepository extends JpaRepository<ProductsEntity, Long> {
	@Query("SELECT p FROM ProductsEntity p WHERE p.name_product = :name_product")
	List<ProductsEntity> findByName(@Param("name_product") String name_product);
}
