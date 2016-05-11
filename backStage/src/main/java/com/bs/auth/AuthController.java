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

import com.bs.models.UserVO;



@Controller

public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private AuthService authService;  
	
//	
	@RequestMapping("/auth/login")
	public ModelAndView getTest(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("auth/login.jsp");
		//UserVO result = authService.getTest(userVO);
		//modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void login(HttpSession session) {
        logger.info("Welcome login! {}", session.getId());
    }
     
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpSession session) {
        CustomUserDetails userDetails = (CustomUserDetails)session.getAttribute("userLoginInfo");
         
        logger.info("Welcome logout! {}, {}", session.getId(), userDetails.getUsername());
         
         
        session.invalidate();
    }
     
    @RequestMapping(value = "login_success", method = RequestMethod.GET)
    public void login_success(HttpSession session) {
        CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getDetails();
         
        logger.info("Welcome login_success! {}, {}", session.getId(), userDetails.getUsername() + "/" + userDetails.getPassword());
        session.setAttribute("userLoginInfo", userDetails);
    }
     
    @RequestMapping(value = "page1", method = RequestMethod.GET)
    public void page1() {      
    }
     
    @RequestMapping(value = "login_duplicate", method = RequestMethod.GET)
    public void login_duplicate() {    
        logger.info("Welcome login_duplicate!");
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