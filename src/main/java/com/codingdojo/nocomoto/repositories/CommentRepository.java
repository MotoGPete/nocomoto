package com.codingdojo.nocomoto.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.Episode;


@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {
	List<Comment> findAll();
	
	
	
	
}