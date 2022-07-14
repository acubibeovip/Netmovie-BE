package com.java.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.repository.query.Param;
import com.java.project.entity.CoinEntity;

@Repository
public interface CoinRepository extends JpaRepository<CoinEntity, Long>{
	
	@Modifying
	@Query("UPDATE CoinEntity c SET c.amount = c.amount - :product WHERE c.user.id_user = 1")
	void buyProductCoin(@Param("product") float product);
	
	@Query("SELECT c FROM CoinEntity c WHERE c.user.id_user = :id")
	CoinEntity findUserOnTableCoin(@RequestParam("id") Long id);
}
