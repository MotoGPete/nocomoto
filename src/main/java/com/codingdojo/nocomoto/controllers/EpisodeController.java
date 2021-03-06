package com.codingdojo.nocomoto.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.codingdojo.nocomoto.models.User;
import com.codingdojo.nocomoto.repositories.UserRepository;
import com.codingdojo.nocomoto.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.services.CommentService;
import com.codingdojo.nocomoto.services.EpisodeService;






@Controller
public class EpisodeController {
	
	private static DateTimeFormatter myFormatPublishedAt = DateTimeFormatter.ofPattern("MMM dd yyyy");

	@Autowired
	EpisodeService episodeService;
	@Autowired
	CommentService commentService;
	@Autowired
	UserService userService;
	@Autowired
	UserRepository userRepository;
	// **************Show All****************
	@GetMapping("/episodes")
	public String dashboard(Model model, HttpSession session) {
//		List<Episode> episodes = episodeService.allEpisodes();
		List<Episode> episodes = episodeService.findDescendingEpisodes();
		model.addAttribute("episodes", episodes);
		return "episodes.jsp";
	}
//*******************SHow One*******************
	@GetMapping("/episodes/{id}")
	public String episodeShow(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Episode episode = episodeService.findEpisode(id);
		model.addAttribute("episode", episode);
		List<Comment> descComments = episode.getComments();
		Collections.reverse(descComments);
		model.addAttribute("descComments", descComments);
//		LocalDateTime publishedAt = episode.published_at;
		
//		String formattedDate = publishedAt.format(myFormatPublishedAt);
//		model.addAttribute("formattedEpisodeDate",formattedDate);
		return "episodeShow.jsp"; 
	}
//*********************Create Comment************************
	@GetMapping("/comment/new/{id}")
	public String createComment(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Long userID = (Long) session.getAttribute("user_id");
		User user = userService.findUser(userID);
		model.addAttribute("user", user);
		Episode  episode = episodeService.findEpisode(id);
		Comment comment = new Comment();
		model.addAttribute("newComment", comment);
		model.addAttribute("episode", episode);
		return "commentNew.jsp";
	}
	

	@PostMapping("/comment/new/{id}")
	public String processCreateEpisode(@Valid @ModelAttribute("newComment") Comment newComment, BindingResult result,
			HttpSession session, @PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "episodesNew.jsp";
		} else {
			commentService.createComment(newComment);
			return "redirect:/episodes/{id}";
		}

	}
	@PostMapping("/episodes/{id}")
	public String addFavorite(HttpServletRequest request, @PathVariable("id") Long id, Model model){

		HttpSession session = (request.getSession());
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		//this is the part that isn't working
		Long userID = (Long) session.getAttribute("user_id");
		User user = userService.findUser(userID);
		List<Episode> userFave = user.getUserFaves();
		Episode episode = episodeService.findEpisode(id);
		userFave.add(episode);
		user.setUserFaves(userFave);
		userRepository.save(user);
		return "redirect:/episodes/{id}";
	}
	
	
//	@PostMapping("/saveComment")
//	public void saveComment(@RequestBody Comment newComment) {
//		   commentService.createComment(newComment);
//			
//		
//	   }
	
//	   @RequestMapping(value = "saveComment", method = RequestMethod.POST)
//	   public ResponseEntity<String> saveComment(@RequestBody Comment newComment) {
//		   commentService.createComment(newComment);
//		    return ResponseEntity.ok("Hello World!");
//
//		
//	   }
	
//	// **********create***************
//	@GetMapping("/episodes/new")
//	public String createEpisode(Model model, HttpSession session) {
//		if (session.getAttribute("user_id") == null) {
//			return "redirect:/";
//		}
//		Episode newEpisode = new Episode();
//		model.addAttribute("newEpisode", newEpisode);
//
//		return "ideasNew.jsp";
//	}
//
//	@PostMapping("/episodes/new")
//	public String processCreateEpisode(@Valid @ModelAttribute("newEpisode") Episode newEpisode, BindingResult result,
//			HttpSession session) {
//		if (result.hasErrors()) {
//			return "episodesNew.jsp";
//		} else {
//			episodeService.createEpisode(newEpisode);
//			return "redirect:/episodes";
//		}
//
//	}
//
//	// **************update*****************
	@GetMapping("/comment/edit/{id}")
	public String episodesEdit(@PathVariable("id") Long id, Model model) {
		Comment comment = commentService.findComment(id);
		model.addAttribute("newComment", comment);
		return "commentsEdit.jsp";
	}
	
	

	
	@PutMapping("/comment/edit/{id}")
	public String processEditForm(@Valid @ModelAttribute("newComment") Comment newComment, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "commentsEdit.jsp";
		} else {
			commentService.createComment(newComment);
			return "redirect:/episodes{id}";
		}

	}
	
	// *****************delete********************
		@DeleteMapping("/comment/delete/{id}/{episodeId}")
		public String processDeleteComment(@PathVariable("id") Long id, @PathVariable("episodeId") Long episodeId) {
			commentService.deleteComment(id);
			return "redirect:/episodes/{episodeId}";
		}
	
}