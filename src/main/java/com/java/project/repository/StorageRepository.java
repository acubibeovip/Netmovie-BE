package com.java.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.java.project.entity.StorageEntity;

@Repository
public interface StorageRepository extends JpaRepository<StorageEntity, Long>{

}
