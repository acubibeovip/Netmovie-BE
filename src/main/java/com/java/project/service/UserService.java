package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.ActorEntity;
import com.java.project.entity.UserEntity;

public interface UserService {
	UserEntity updateUser(Optional<UserEntity> userEntity);
	UserEntity save(UserEntity userEntity);
}
