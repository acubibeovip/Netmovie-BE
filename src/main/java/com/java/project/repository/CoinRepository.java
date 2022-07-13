package com.java.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.java.project.entity.CoinEntity;

@Repository
public interface CoinRepository extends JpaRepository<CoinEntity, Long>{

}
