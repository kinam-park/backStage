package com.bs.include;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/include")
public class IncludeController {
	
	@RequestMapping("/header")
	public ModelAndView header() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("include/header");
		
		return modelAndView;
	}
	
//	@RequestMapping("/sideMenu")
//	public ModelAndView sideMenu() {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("include/sideMenu");
//		
//		return modelAndView;
//	}
//	
//	@RequestMapping("/footer")
//	public ModelAndView footer() {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("include/footer");
//		
//		return modelAndView;
//	}
}