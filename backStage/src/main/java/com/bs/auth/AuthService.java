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
	
	public UserVO checkLogin(UserVO userVO){
		return authDao.checkLogin(userVO);	
	}
	
	public boolean checkValidate(UserVO userVO){
		boolean is = false;
		List<UserVO> list =  authDao.checkValidate(userVO);
		if(list.size() == 0){
			is = true;
		}else{
			is = false;
		}
		return is;
	}
	
	
	public boolean insertUser(UserVO userVO){
		int cnt = authDao.insertUser(userVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	public  boolean updateUser(UserVO userVO){
		int cnt = authDao.updateUser(userVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
		
	}
	
	public  boolean deleteUser(UserVO userVO){
		int cnt = authDao.deleteUser(userVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
		
	}
    
}