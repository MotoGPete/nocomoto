package com.codingdojo.nocomoto.controllers;

import com.codingdojo.nocomoto.models.Comment;
import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.models.User;
import com.codingdojo.nocomoto.services.CommentService;
import com.codingdojo.nocomoto.services.EpisodeService;
import com.codingdojo.nocomoto.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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
        Long userID = (Long) request.getAttribute("user_id");
        User user = userService.findUser(userID);
        List<Comment> comments = user.getUserComments();
        List<Episode> favorites = user.getUserFaves();
        model.addAttribute("comments", comments);
        model.addAttribute("favorites", favorites);
        return "profile.jsp";
    }


}
