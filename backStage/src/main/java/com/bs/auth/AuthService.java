package com.bs.auth;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.models.UserVO;

@Service
public class AuthService {
	@Autowired
	private AuthDao authDao;
	
	public UserVO getTest(UserVO userVO) {
        return authDao.getTest(userVO);
    }
	
    
}