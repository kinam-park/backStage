package com.bs.cart;
 
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.models.CartVO;



@Repository
public class CartDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartVO> getCartList(CartVO cartVO) {
        return (List<CartVO>)sqlSession.selectList("com.bs.sql.cart.getCartList",cartVO);
    }	
	
	
	public List<CartVO> getSelectedCartList(CartVO cartVO) {
        return (List<CartVO>)sqlSession.selectList("com.bs.sql.cart.getSelectedCartList",cartVO);
    }
	
	
	public int insertCart(CartVO cartVO) {
        return sqlSession.insert("com.bs.sql.cart.insertCart",cartVO);
    }
	
	public int updateCart(CartVO cartVO) {
        return sqlSession.update("com.bs.sql.cart.updateCart",cartVO);
    }
	
	public int deleteCart(CartVO cartVO) {
        return sqlSession.delete("com.bs.sql.cart.deleteCart",cartVO);
    }
	
	
}