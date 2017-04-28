package com.bs.auth;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.PaymentVO;
import com.bs.models.UserVO;


@Controller
@RequestMapping("/auth")
public class AuthController {
	@Autowired
	private AuthService authService;

	
	/***
	 * 로그인을 성공했다면, 그 이후 서버세션에 유저계정 정보가 들어가게됨. 그 정보를 가져오는 함수
	 * NULL 값이 넘어간다면, 서버세션에 로그인정보가 없는것임.
	 ***/
	@RequestMapping("/getMyInfo")
	public ModelAndView getMyInfo(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		modelAndView.addObject("result",  userVO);
		return modelAndView;
	
	}
	
	
	/***
	 * 유저 리스트(관리자용) 가져옴.. 관리자 페이지에서 사용할듯 해서 그냥 만들어둠.
	 ***/
	@RequestMapping("/getUserInfo")
	public ModelAndView getUserInfo(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO user1VO = (UserVO)session.getAttribute("userInfo");
		List<UserVO> result = null;		
		if(user1VO != null && user1VO.getLevel().equals("admin")){
			result = authService.getUserInfo(user1VO);
		}		
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	/***
	 * 로그인 체크
	 * #{email} : 로그인 계정 주소
	 * #{password} : 패스워드
	 ***/
	@RequestMapping("/checkLogin")
	public ModelAndView checkLogin(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO result = authService.checkLogin(userVO);
		
		if (result != null) {
            session.setAttribute("userInfo", result);
            session.setAttribute("userId", result.getUser_id());
            
        }else {        	
            session.setAttribute("userInfo", null);            
        }
		
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	

	/***
	 * 유효성 검사
	 * #{email} : 로그인 계정 주소
	 * 
	 ***/
	@RequestMapping("/checkValidate")
	public ModelAndView checkValidate(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = authService.checkValidate(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/***
	 * 회원가입
	 * #{email}   : 계정 메일주소     
	 * #{password}   : 패스워드   
	 * #{user_name}  : 사용자명
	 * #{birthday}   : 생년월일
	 * #{phone}        : 폰번호
	 * #{level}        : 권한, 없으면 일반유저로 배정
	 * #{addr1}        : 주소
	 * #{addr2}        : 주소
	 * #{zipcode}      : 우편번호
	 ***/
	@RequestMapping("/insertUser")
	public ModelAndView insertUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = authService.insertUser(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/***
	 * 회원 정보 수정
	 * #{user_id}      : 수정할 회원 아이디      
	 * #{password}   : 패스워드   
	 * #{user_name}  : 사용자명
	 * #{birthday}   : 생년월일
	 * #{phone}        : 폰번호
	 * #{level}        : 권한, 없으면 일반유저로 배정
	 * #{addr1}        : 주소
	 * #{addr2}        : 주소
	 * #{zipcode}      : 우편번호
	 ***/
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO user1VO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(user1VO != null && user1VO.getUser_id().equals(userVO.getUser_id())){
			result = authService.updateUser(userVO);
		}		
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	/***
	 * 회원 정보 삭제(어드민만)
	 * #{user_id}      : 삭제할 회원 아이디      
	 * 
	 ***/
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO user1VO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(user1VO != null && user1VO.getLevel().equals("admin")){
			result = authService.deleteUser(userVO);
		}	
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	
	
	
	
}