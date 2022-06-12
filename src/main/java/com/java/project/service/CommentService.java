package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.CommentEntity;

public interface CommentService {
	CommentEntity updateComment(Optional<CommentEntity> commentEntity);
	CommentEntity save(CommentEntity commentEntity);
}
