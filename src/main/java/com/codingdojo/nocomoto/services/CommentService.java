package com.codingdojo.nocomoto.services;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.repositories.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	public CommentRepository commentRepository;
	
	public Comment createComment(Comment comment) {
		return commentRepository.save(comment);
	}
	
	//deletes
	public void deleteComment(Long id) {
		commentRepository.deleteById(id);	
	}
	
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if(optionalComment.isPresent()) {
         return optionalComment.get();
     } else {
         return null;
     	}
	}
	
	public Period findPeriod(LocalDate date) {
		LocalDate today = LocalDate.now();
		Period p = Period.between(date, today);
		return p; 
		                 
	}
}
