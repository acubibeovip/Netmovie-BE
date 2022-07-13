package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.CoinEntity;

public interface CoinService {
	CoinEntity updateCoin(Optional<CoinEntity> coinEntity);
	CoinEntity save(CoinEntity coinEntity);
}
