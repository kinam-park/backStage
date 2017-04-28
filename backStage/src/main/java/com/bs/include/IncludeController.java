package com.bs.include;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.UserVO;

@Controller
@RequestMapping("/include")
public class IncludeController {
	
	@RequestMapping("/header")
	public ModelAndView header(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("include/header");
		
		return modelAndView;
	}
	
	@RequestMapping("/footer")
	public ModelAndView footer() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("include/footer");
		
		return modelAndView;
	}
}