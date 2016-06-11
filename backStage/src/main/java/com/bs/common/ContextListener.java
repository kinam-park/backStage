package com.bs.common;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



public class ContextListener 
               implements ServletContextListener{
	
	//@Autowired AuthDao authDao;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("ServletContextListener destroyed");
		
		 
	}

        //Run this before web application is started
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("ServletContextListener started");	
		
		
//		AutowireCapableBeanFactory a = WebApplicationContextUtils
//        .getRequiredWebApplicationContext(arg0.getServletContext())
//        .getAutowireCapableBeanFactory();
//		
//		a.autowireBean(this);
		
		WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
		System.out.println(springContext.getBeanDefinitionCount());	
		
			
		
		//AuthService authService = (AuthService)springContext.getBean("AuthService");
		
		
//		UserVO userVO = new UserVO(); 
//		userVO = authDao.getTest(userVO);
//		
		
	}
}