package com.codingdojo.nocomoto.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.services.CommentService;
import com.codingdojo.nocomoto.services.EpisodeService;






@Controller
public class EpisodeController {

	@Autowired
	EpisodeService episodeService;
	@Autowired
	CommentService commentService;
	
	// **************Show All****************
	@GetMapping("/episodes")
	public String dashboard(Model model, HttpSession session) {
		List<Episode> episodes = episodeService.allEpisodes();
		model.addAttribute("episodes", episodes);
		return "episodes.jsp";
	}
//*******************SHow One*******************
	@GetMapping("/episodes/{id}")
	public String episodeShow(@PathVariable("id") Long id, Model model, HttpSession session) {
		Episode episode = episodeService.findEpisode(id);
		model.addAttribute("episode", episode);
		
		return "episodeShow.jsp";
	}
//*********************Create Comment************************
	@GetMapping("/comment/new/{id}")
	public String createComment(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
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
}