package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.CommentEntity;
import com.java.project.repository.CommentRepository;
import com.java.project.service.CommentService;
import com.java.project.service.ShareService;

@Service
public class CommentServiceImpl extends ShareService implements CommentService{
	@Autowired
	private CommentRepository commentRepo;

	@Override
	public List<CommentEntity> findAll() {
		return commentRepo.findAll();
	}

	@Override
	public Optional<CommentEntity> findById(Long id) {
		return commentRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		commentRepo.deleteById(id);
	}

	@Override
	public List<CommentEntity> findByName(String name) {
		//dont need use function
		return null;
	}

	@Override
	public CommentEntity updateComment(Optional<CommentEntity> commentEntity) {
		return commentRepo.save(commentEntity.get());
	}

	@Override
	public CommentEntity save(CommentEntity commentEntity) {
		return commentRepo.save(commentEntity);
	}	
}
