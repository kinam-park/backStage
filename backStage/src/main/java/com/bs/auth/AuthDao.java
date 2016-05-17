package com.bs.auth;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.models.UserVO;
 




@Repository
public class AuthDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserVO> getUserInfo(UserVO userVO) {
        return (List<UserVO>)sqlSession.selectList("com.bs.sql.auth.getUserInfo",userVO);
    }
	
    
}