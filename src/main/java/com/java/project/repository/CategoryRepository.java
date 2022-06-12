package com.java.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.query.Param;
import com.java.project.entity.CategoriesEntity;

@Repository
public interface CategoryRepository extends JpaRepository<CategoriesEntity,Long> {
	@Query("SELECT c FROM CategoriesEntity c WHERE c.name_categories = :name_categories")
	List<CategoriesEntity> findByName(@Param("name_categories") String name_categories);
}
