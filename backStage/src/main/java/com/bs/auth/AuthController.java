package com.bs.auth;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.UserVO;


@Controller
@RequestMapping("/auth")
public class AuthController {
	@Autowired
	private AuthService authService;

	
	
	@RequestMapping("/getUserInfo")
	public ModelAndView getUserInfo(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		List<UserVO> result = authService.getUserInfo(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	@RequestMapping("/checkLogin")
	public ModelAndView checkLogin(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO result = authService.checkLogin(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	@RequestMapping("/insertUser")
	public ModelAndView insertUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = authService.insertUser(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = authService.updateUser(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = authService.deleteUser(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	
	
	
	
}