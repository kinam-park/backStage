package com.bs.auth;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.UserVO;




@Controller

public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	
	@RequestMapping("/getTest")
	public ModelAndView getTest(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		//UserVO result = authService.getTest(userVO);
		modelAndView.addObject("result",  "gg");
		return modelAndView;
	
	}
	
	
}