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
	
	@RequestMapping("/collection")
	public ModelAndView collection() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/collection");
		
		return modelAndView;
	}
	@RequestMapping("/onlineStore")
	public ModelAndView onlineStore() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/onlineStore");
		
		return modelAndView;
	}
	@RequestMapping("/news")
	public ModelAndView news() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/news");
		
		return modelAndView;
	}
	
	@RequestMapping("/location")
	public ModelAndView location() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/location");
		
		return modelAndView;
	}
	
	@RequestMapping("/write")
	public ModelAndView write() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/write");
		
		return modelAndView;
	}
	
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/login");
		
		return modelAndView;
	}
	
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/join");
		
		return modelAndView;
	}
	
	@RequestMapping("/myPage")
	public ModelAndView myPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/myPage");
		
		return modelAndView;
	}
	
	@RequestMapping("/detailPage")
	public ModelAndView detailPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/detailPage");
		
		return modelAndView;
	}
	
	@RequestMapping("/storeDetailPage")
	public ModelAndView storeDetailPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/storeDetailPage");
		
		return modelAndView;
	}
	
	@RequestMapping("/writeProduct")
	public ModelAndView writeProduct() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/writeProduct");
		
		return modelAndView;
	}
	
	@RequestMapping("/cartList")
	public ModelAndView cartList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/cartList");
		
		return modelAndView;
	}
	
	@RequestMapping("/orderPage")
	public ModelAndView orderPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page/orderPage");
		return modelAndView;
	}
	
	
}