package com.codingdojo.nocomoto.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.User;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {

}