package com.bs.auth;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.User;



@Controller

public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
//	
//	@Autowired
//	private AuthService authService;
	

	@RequestMapping("/login.do")
	public void login(HttpSession session) {
		
	}
	
	@RequestMapping("/loginFail.do")
	public void loginFail(HttpSession session) {
		
	}
	
	@RequestMapping("/logout.do")
	public void logout(HttpSession session) {
		
	}
	
////	
	@RequestMapping("/loginView")
	public ModelAndView loginView(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("auth/login");
		//UserVO result = authService.getTest(userVO);
		//modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
//	
//	@RequestMapping("/getTest")
//	public ModelAndView getTest(UserVO userVO,HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//		
//		UserVO result = authService.getTest(userVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	
//	}
	
	
}