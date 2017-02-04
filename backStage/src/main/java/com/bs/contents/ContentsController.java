package com.bs.contents;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.ContentsVO;
import com.bs.models.PaymentVO;
import com.bs.models.UserVO;




@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	private ContentsService contentsService;
	
	/***
	 * 해당 카테고리(뉴스,등등)에 대한 컨텐츠 리스트를 가져옴
	 * #{category_code} : 컨텐츠 카테고리 코드 (NEWS)
	 * 	 
	 ***/
	@RequestMapping("/getContentsList")
	public ModelAndView getContentsList(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		List<ContentsVO> result = contentsService.getContentsList(contentsVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/***
	 * 컨텐츠 디테일 정보 가져옴.컨텐츠 리스트에서 하나를 선택했을때 해당하는 컨텐츠 아이디로 컨텐츠 정보 가져옴 
	 * #{contents_id} : 컨텐츠 아이디
	 * 	 
	 ***/
	@RequestMapping("/getContents")
	public ModelAndView getContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ContentsVO result = contentsService.getContents(contentsVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
//	@RequestMapping("/getCategoryList")
//	public ModelAndView getCategoryList(ContentsVO contentsVO,HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//		List<ContentsVO> result = contentsService.getCategoryList(contentsVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	
//	}
	
	
	
	/***
	 * 컨텐츠 생성
	 * #{title} : 제목
	 * #{contents} : 컨텐츠 내용
	 * #{user_id} : 작성자 아이디
	 * #{category_code} : 카테고리 코드 (NEWS 이런형태)
	 * #{is_enable} : Y / N ,,,Y인것만 실제로 노출됨 
	 ***/
	@RequestMapping("/insertContents")
	public ModelAndView insertContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null && userVO.getLevel().equals("admin")){
			result = contentsService.insertContents(contentsVO);
		}
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
		
	
	/***
	 * 컨텐츠 수정
	 * #{contents_id} : 수정할 컨텐츠 아이디
	 * #{title} : 제목
	 * #{contents} : 컨텐츠 내용
	 * #{category_code} : 카테고리 코드 (NEWS 이런형태)
	 * #{is_enable} : Y / N ,,,Y인것만 실제로 노출됨 
	 ***/
	@RequestMapping("/updateContents")
	public ModelAndView updateContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null && userVO.getLevel().equals("admin")){
			result = contentsService.updateContents(contentsVO);
		}
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
	
	/***
	 * 컨텐츠 삭제
	 * #{contents_id} : 삭제할 컨텐츠 아이디
	 ***/
	@RequestMapping("/deleteContents")
	public ModelAndView deleteContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null && userVO.getLevel().equals("admin")){
			result = contentsService.deleteContents(contentsVO);
		}
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
}


 