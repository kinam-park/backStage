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




@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	private ContentsService contentsService;

	@RequestMapping("/getContentsList")
	public ModelAndView getContentsList(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		List<ContentsVO> result = contentsService.getContentsList(contentsVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
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
	     
	@RequestMapping("/insertContents")
	public ModelAndView insertContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = contentsService.insertContents(contentsVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
		
	@RequestMapping("/updateContents")
	public ModelAndView updateContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = contentsService.updateContents(contentsVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
	
	@RequestMapping("/deleteContents")
	public ModelAndView deleteContents(ContentsVO contentsVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = contentsService.deleteContents(contentsVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
}