package com.codingdojo.nocomoto.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.models.LoginUser;
import com.codingdojo.nocomoto.models.User;
//import com.codingdojo.nocomoto.services.EpisodeService;
import com.codingdojo.nocomoto.services.UserService;



@Controller
public class UserController {

	@Autowired
	private UserService userServ;
//	@Autowired
//	private EpisodeService episodeServ;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		userServ.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/home";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userServ.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		session.setAttribute("userName", user.getUserName());
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String loginSuccess(Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		} else {
			// back up super secret method to pass user model
//	    		User user = userServ.findUser((Long) session.getAttribute("user_id"));
//	    		model.addAttribute(user);
			return "redirect:/episodes";
		}
	}

//	@PutMapping("/idea/{id}")
//		public String addLikeToUser(@PathVariable("id")Long id, Model model,
//				@RequestParam("user_id")Long userid
//				){
//		  Episode episode = episodeServ.findEpisode(id);
//			
//		  User user = userServ.findUser(userid);
//			
////			if(dog.getTreats()== null) {
////				List<Treat> treats = new ArrayList<>();
////				treats.add(treat);
////				dog.setTreats(treats);
////				}else {
////					dog.getTreats().add(treat);
////					
////				}
////				
//				episodeServ.addUserToEpisode(episode, user);
//			return "redirect:/";
//	}

}
