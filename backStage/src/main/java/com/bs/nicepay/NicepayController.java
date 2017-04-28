package com.bs.nicepay;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.PaymentVO;

@Controller
@RequestMapping("/nicepay")
public class NicepayController {
	
	@RequestMapping("/payRequest")
	public ModelAndView nicePayRequest(PaymentVO paymentVO,HttpSession session) {
		session.setAttribute("paymentInfo", paymentVO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("nicepay/payRequest");
		return modelAndView;
	}
	
	@RequestMapping("/payResult")
	public ModelAndView nicePayResult(PaymentVO paymentVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("nicepay/payResult");
		return modelAndView;
	}
	
	@RequestMapping("/niceCancelRequest")
	public ModelAndView niceCancelRequest(PaymentVO paymentVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("nicepay/niceCancelRequest");
		return modelAndView;
	}
	
	@RequestMapping("/niceCancelResult")
	public ModelAndView niceCancelResult(PaymentVO paymentVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("nicepay/niceCancelResult");
		return modelAndView;
	}	
}