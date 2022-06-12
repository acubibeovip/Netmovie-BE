package com.java.project.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.StorageEntity;

@Repository
public interface ActorRepository extends JpaRepository<ActorEntity, Long> {
	@Query("SELECT a FROM ActorEntity a WHERE a.name_actor = :name_actor")
	List<ActorEntity> findByName(@Param("name_actor") String name_actor);
	
	@Query("SELECT a FROM ActorEntity a WHERE a.country_actor = :country_actor")
	List<ActorEntity> findByCountry(@Param("country_actor") String country_actor);
	
//	@Query(value = "SELECT s.* FROM StorageEntity s  WHERE s.id_actor = :id_actor",nativeQuery = true)
//	List<StorageEntity> findVideoByActor(@Param("id_actor") Long id_actor);
}
