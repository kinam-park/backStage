package com.bs.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page")
public class MainController {
	
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/main");
		
		return modelAndView;
	}
	
	@RequestMapping("/collection")
	public ModelAndView collection() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/collection");
		
		return modelAndView;
	}
	@RequestMapping("/onlineStore")
	public ModelAndView onlineStore() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/onlineStore");
		
		return modelAndView;
	}
	@RequestMapping("/news")
	public ModelAndView news() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/news");
		
		return modelAndView;
	}
	
	@RequestMapping("/write")
	public ModelAndView write() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/write");
		
		return modelAndView;
	}
	
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/login");
		
		return modelAndView;
	}
	
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/join");
		
		return modelAndView;
	}
	
	
}