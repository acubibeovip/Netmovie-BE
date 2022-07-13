package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.CoinEntity;
import com.java.project.repository.CoinRepository;
import com.java.project.service.CoinService;
import com.java.project.service.ShareService;

@Service
public class CoinServiceImpl extends ShareService implements CoinService{

	@Autowired
	private CoinRepository coinRepo;
	
	@Override
	public CoinEntity updateCoin(Optional<CoinEntity> coinEntity) {
		return coinRepo.save(coinEntity.get());
	}

	@Override
	public CoinEntity save(CoinEntity coinEntity) {
		return coinRepo.save(coinEntity);
	}

	@Override
	public List<CoinEntity> findAll() {	
		return coinRepo.findAll();
	}

	@Override
	public List<CoinEntity> findByName(String name) {
		return null;
	}

	@Override
	public Optional<CoinEntity> findById(Long id) {
		return coinRepo.findById(id);
	}

	@Override
	public void deleteById(Long id) {
	}

}
