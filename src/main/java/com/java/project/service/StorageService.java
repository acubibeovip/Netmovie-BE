package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.StorageEntity;

public interface StorageService {
	StorageEntity updateStorage(Optional<StorageEntity> contactEntity);
	StorageEntity save(StorageEntity contactEntity);
}
