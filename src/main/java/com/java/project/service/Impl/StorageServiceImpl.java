package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.StorageEntity;
import com.java.project.repository.StorageRepository;
import com.java.project.service.ShareService;
import com.java.project.service.StorageService;

@Service
public class StorageServiceImpl extends ShareService implements StorageService {


	@Autowired
	private StorageRepository storageRepo;

	@Override
	public List<StorageEntity> findAll() {
		return storageRepo.findAll();
	}

	@Override
	public Optional<StorageEntity> findById(Long id) {
		return storageRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		storageRepo.deleteById(id);
	}

	@Override
	public List<StorageEntity> findByName(String name) {
		return null;
	}

	@Override
	public StorageEntity updateStorage(Optional<StorageEntity> storageEntity) {
		return storageRepo.save(storageEntity.get());
	}

	@Override
	public StorageEntity save(StorageEntity storageEntity) {
		return storageRepo.save(storageEntity);
	}
}
