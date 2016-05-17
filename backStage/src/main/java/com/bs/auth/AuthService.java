package com.bs.auth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.models.UserVO;
 



@Service
public class AuthService{
	@Autowired
	private AuthDao authDao;
	
	public List<UserVO> getUserInfo(UserVO userVO){
		return authDao.getUserInfo(userVO);
	}
    
}