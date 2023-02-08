package com.jw.lookify.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jw.lookify.models.Song;
import com.jw.lookify.services.SongService;

@Controller
public class SongController {
	@Autowired
	SongService serv;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(
			Model m
			) {
		m.addAttribute("songs", serv.findAll());
		return "/dashboard.jsp";
	}
	
	@GetMapping("/songs/new")
	public String createForm(
			Model m
			) {
		m.addAttribute("s", new Song());
		return "/create.jsp";
	}
	@PostMapping("/songs/new")
	public String save(
			@Valid @ModelAttribute("s") Song s,
			BindingResult result
			
			) {
		if (result.hasErrors()) {
			return "/dashboard.jsp";
		} else {
			serv.save(s);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/songs/delete/{id}")
	public String delete(
			@PathVariable("id") Long id
			) {
		serv.deleteById(id);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/songs/edit/{id}")
	public String edit(
			@PathVariable("id") Long id,
			Model m
			) {
		m.addAttribute("s", serv.findById(id));
		return "/edit.jsp";
	}
	
	@PutMapping("/songs/edit/{id}")
	public String update( 
			@Valid @ModelAttribute("s") Song s,
			BindingResult result
			) {
		if (result.hasErrors()) {
			return "/edit.jsp";
		} else {
			serv.save(s);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/songs/top")
	public String top10(Model m) {
		m.addAttribute("songs", serv.top10());
		return "/top.jsp";
	}
	
	@PostMapping("/songs/search")
	public String search(
			@RequestParam(value="search") String str,
			HttpSession session
			) {
		session.setAttribute("songs", serv.search(str));
		return "redirect:/songs/search/result";
	}
	
	@GetMapping("/songs/search/result")
	public String result(
			HttpSession session
			) {
		return "/viewResult.jsp";
	}
}
