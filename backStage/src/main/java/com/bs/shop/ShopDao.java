package com.bs.shop;
 
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.models.ShopVO;



@Repository
public class ShopDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ShopVO> getShopList(ShopVO shopVO) {
        return (List<ShopVO>)sqlSession.selectList("com.bs.sql.shop.getShopList",shopVO);
    }
	
	public ShopVO getShop(ShopVO shopVO) {
        return (ShopVO)sqlSession.selectOne("com.bs.sql.shop.getShop",shopVO);
    }
	
//	public List<ShopVO> getCategoryList(ShopVO shopVO) {
//        return (List<ShopVO>)sqlSession.selectList("com.bs.sql.shop.getCategoryList",shopVO);
//    }
	
	public int insertShop(ShopVO shopVO) {
        return sqlSession.insert("com.bs.sql.shop.insertShop",shopVO);
    }
	
	public int updateShop(ShopVO shopVO) {
        return sqlSession.update("com.bs.sql.shop.updateShop",shopVO);
    }
	
	public int deleteShop(ShopVO shopVO) {
        return sqlSession.delete("com.bs.sql.shop.deleteShop",shopVO);
    }
	
	
}