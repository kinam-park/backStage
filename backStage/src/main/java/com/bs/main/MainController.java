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
	
	@RequestMapping("/write")
	public ModelAndView write() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/write");
		
		return modelAndView;
	}
	
	
}