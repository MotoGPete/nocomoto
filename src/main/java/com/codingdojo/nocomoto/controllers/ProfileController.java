package com.codingdojo.nocomoto.controllers;

import com.codingdojo.nocomoto.services.CommentService;
import com.codingdojo.nocomoto.services.EpisodeService;
import com.codingdojo.nocomoto.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ProfileController {
    @Autowired
    EpisodeService episodeService;
    @Autowired
    CommentService commentService;
    @Autowired
    UserService userService;

    @GetMapping("/profile")
    public String showProfile(HttpSession request, Model model){
        if (request.getAttribute("user_id") == null) {
            return "redirect:/";
        }
        return "profile.jsp";
    }


}
