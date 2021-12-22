package com.codingdojo.nocomoto.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.repositories.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	public CommentRepository commentRepository;
	
	public Comment createComment(Comment comment) {
		return commentRepository.save(comment);
	}

}
