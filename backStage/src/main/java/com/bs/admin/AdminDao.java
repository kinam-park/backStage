package com.bs.admin;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
//	public UserVO getTest(UserVO userVO) {
//        return (UserVO)sqlSession.selectOne("com.xii.sql.auth.getTest",userVO);
//    }
//	
    
}