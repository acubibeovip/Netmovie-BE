package com.java.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity,Long> {
	@Query("SELECT c FROM UserEntity c WHERE c.username = :username")
	UserEntity findByName(@Param("username") String username);
//	@Query("SELECT u FROM UserEntity u WHERE u.username = :username")
//	public UserEntity findByName(@Param("username") String username);
}
