package com.bs.contents;
 
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.models.ContentsVO;



@Repository
public class ContentsDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ContentsVO> getContentsList(ContentsVO contentsVO) {
        return (List<ContentsVO>)sqlSession.selectList("com.bs.sql.contents.getContentsList",contentsVO);
    }
	
	public ContentsVO getContents(ContentsVO contentsVO) {
        return (ContentsVO)sqlSession.selectOne("com.bs.sql.contents.getContents",contentsVO);
    }
	
	public List<ContentsVO> getCategoryList(ContentsVO contentsVO) {
        return (List<ContentsVO>)sqlSession.selectList("com.bs.sql.contents.getCategoryList",contentsVO);
    }
	
	public int insertContents(ContentsVO contentsVO) {
        return sqlSession.insert("com.bs.sql.contents.insertContents",contentsVO);
    }
	
	public int updateContents(ContentsVO contentsVO) {
        return sqlSession.update("com.bs.sql.contents.updateContents",contentsVO);
    }
	
	public int deleteContents(ContentsVO contentsVO) {
        return sqlSession.delete("com.bs.sql.contents.deleteContents",contentsVO);
    }
	
	
}