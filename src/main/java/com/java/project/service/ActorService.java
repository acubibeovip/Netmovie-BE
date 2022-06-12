package com.java.project.service;

import java.util.List;
import java.util.Optional;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.StorageEntity;
import com.java.project.repository.ActorRepository;

public interface ActorService{
	ActorEntity updateActor(Optional<ActorEntity> actorEntity);
	ActorEntity save(ActorEntity actorEntity);
}
