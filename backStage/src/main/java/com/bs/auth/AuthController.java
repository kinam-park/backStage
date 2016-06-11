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
	
	
}