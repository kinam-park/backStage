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
	
	public List<UserVO> checkValidate(UserVO userVO) {
        return (List<UserVO>)sqlSession.selectList("com.bs.sql.auth.checkValidate",userVO);
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


//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('2015 sale','2015 SALE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('2016 complete bike','2016 COMPLETE BIKE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('frame&fork','FRAME&FORK');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('headset','HEADSET');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('brake','BRAKE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('wheelset','WHEELSET');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('tire&tube','TIRE&TUBE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('rim&hub','RIM&HUB');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('crank','CRANK');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('bb','BB');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('seatpost','SEATPOST');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('stem','STEM');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('handle','HANDLE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('saddle','SADDLE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('chain','CHAIN');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('cog','COG');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('pedal','PEDAL');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('strap&toeclip','STRAP&TOECLIP');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('bartape','BARTAPE');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('grip','GRIP');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('tool','TOOL');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('oil&cleaner','OIL&CLEANER');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('pump','PUMP');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('light','LIGHT');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('lock','LOCK');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('custom order','CUSTOM ORDER');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('helmet','HELMET');
//INSERT INTO CATEGORY(CATEGORY_CODE,CATEGORY_NAME) VALUES('glove','GLOVE');

