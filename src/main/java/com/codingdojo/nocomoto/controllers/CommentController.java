package com.codingdojo.nocomoto.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.CommentForm;
import com.codingdojo.nocomoto.services.CommentService;
import com.codingdojo.nocomoto.services.EpisodeService;
import com.codingdojo.nocomoto.services.UserService;

@RestController
public class CommentController {
	@Autowired
	CommentService commentService;
	@Autowired
	EpisodeService episodeService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/saveComment", method = RequestMethod.POST, consumes="application/json")
	   public String saveComment(@RequestBody CommentForm newCommentForm) {
		Comment newComment = new Comment();
		newComment.setContent(newCommentForm.getContent());
		newComment.setLabel(newCommentForm.getLabel());
		newComment.setHref(newCommentForm.getHref());
		newComment.setEpisode(episodeService.findEpisode(newCommentForm.getEpisode_id()));
		newComment.setUser(userService.findUser(newCommentForm.getUser_id()));
		commentService.createComment(newComment);
		   
		    return "episodeShow.jsp";

		
	   }
	 
	 //@PostMapping("/saveComment")
//		public void saveComment(@RequestBody Comment newComment) {
//			   commentService.createComment(newComment);
//				
//			
//		   }
}
