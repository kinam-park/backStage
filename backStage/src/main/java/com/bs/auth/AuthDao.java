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
	
	
	public UserVO checkLogin(UserVO userVO) {
        return (UserVO)sqlSession.selectOne("com.bs.sql.auth.checkLogin",userVO);
    }
	
	
	public int insertUser(UserVO userVO) {
        return sqlSession.insert("com.bs.sql.auth.insertUser",userVO);
    }
	
	
	public int updateUser(UserVO userVO) {
        return sqlSession.update("com.bs.sql.auth.updateUser",userVO);
    }
	
	
	public int deleteUser(UserVO userVO) {
        return sqlSession.delete("com.bs.sql.auth.deleteUser",userVO);
    }
	
    
}