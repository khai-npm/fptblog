/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group8swp.fptblog.controller;

import com.group8swp.fptblog.model.CommentDTO;
import com.group8swp.fptblog.model.PostDTO;
import com.group8swp.fptblog.model.UserDTO;
import com.group8swp.fptblog.repositories.PostRepository;
import com.group8swp.fptblog.repositories.UserRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author pc
 */
@Controller
public class BlogManagementController {

    @Autowired
    private PostRepository postRep;
    @Autowired
    private UserRepository userRep;

    // nguoi dung nhap tieu de
    // nguoi dung nhap noi dung blog
    // -> nguoi dung bam submit -> traz ve parameter : 
    //              1. Author -> get session user name -> find user by name -> tra ve object user
    //                        -> new blog -> add para tieu de + noi dung + object user -> luu vao database
    //---------------------------------------------------Add blog------------------------------------------------------------------
    @RequestMapping(value = "/AddNewBlog")
    public String addBlog(HttpSession session, Model model,
            @RequestParam(value = "NewTitle") String newTitle,
            @RequestParam(value = "NewContent") String newContent) {

        if (newTitle.isBlank() || newContent.isBlank()) {
            model.addAttribute("AddBlogError", "content must not be null to upload as a post !");
            return "redirect:/viewforum";
        }

        UserDTO user = (UserDTO) session.getAttribute("user");

        PostDTO newPost = new PostDTO();
        newPost.setAuthor(user.getUserName());
        newPost.setTitle(newTitle);
        newPost.setPostContent(newContent);

//        user.getPostModel().add(newPost);
//        userRep.save(user);
        postRep.save(newPost);

        return "redirect:/viewforum";
    }

    //---------------------------------------------------view blog------------------------------------------------------------------
    @RequestMapping(value = "/viewforum")
    public String viewforum(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        List<PostDTO> post = postRep.findAll();
        Collections.reverse(post);
        model.addAttribute("post", post);
        model.addAttribute("user", user);
        return "viewforum";
    }

    //---------------------------------------------------add blog but in their profile------------------------------------------------------------------
    @RequestMapping(value = "/AddNewBlogAccount")
    public String addBlogAccount(HttpSession session, Model model,
            @RequestParam(value = "NewTitle") String newTitle,
            @RequestParam(value = "NewContent") String newContent) {

        if (newTitle.isBlank() || newContent.isBlank()) {
            model.addAttribute("AddBlogError", "content must not be null to upload as a post !");
            return "redirect:/viewauthor";
        }

        UserDTO user = (UserDTO) session.getAttribute("user");

        PostDTO newPost = new PostDTO();
        newPost.setAuthor(user.getUserName());
        newPost.setTitle(newTitle);
        newPost.setPostContent(newContent);

//        user.getPostModel().add(newPost);
//        userRep.save(user);
        postRep.save(newPost);

        return "redirect:/viewauthor";
    }

    //---------------------------------------------------view blog detail------------------------------------------------------------------
    @RequestMapping("/details/{id}")
    public String showPostDetails(@PathVariable("id") int postId, HttpSession session, Model model) {
        PostDTO post = postRep.findByPostId(postId);
        UserDTO user = (UserDTO) session.getAttribute("user");
        model.addAttribute("post", post);
        model.addAttribute("user", user);
        return "blogdetail";
    }

    //---------------------------------------------------view information about us------------------------------------------------------------------
    @RequestMapping(value = "/about")
    public String about(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        model.addAttribute("user", user);
        return "aboutus";
    }

    //---------------------------------------------------view information contact us------------------------------------------------------------------
    @RequestMapping(value = "/contact")
    public String contact(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        model.addAttribute("user", user);
        return "contactus";
    }

    //---------------------------------------------------search blog by keywords------------------------------------------------------------------
    @RequestMapping("/search")
    public String search(@RequestParam("keywords") String keywords, HttpSession session, Model model) {
        // Perform the search operation based on the provided keywords
        UserDTO user = (UserDTO) session.getAttribute("user");
        List<PostDTO> posts = postRep.findAll();
        List<PostDTO> filteredPosts = new ArrayList<>();

        for (PostDTO post : posts) {
            String postContent = post.getPostContent().toLowerCase().trim();
            String title = post.getTitle().toLowerCase().trim();
            String author = post.getAuthor().toLowerCase().trim();

            if (postContent.contains(keywords.toLowerCase().trim())
                    || title.contains(keywords.toLowerCase().trim())
                    || author.contains(keywords.toLowerCase().trim())) {
                filteredPosts.add(post);
            }
        }

        Collections.reverse(filteredPosts);
        model.addAttribute("post", filteredPosts);
        model.addAttribute("user", user);
        return "search";
    }

}
