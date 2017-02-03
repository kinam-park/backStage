package com.bs.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.models.CartVO;
import com.bs.models.ShopVO;
import com.bs.shop.ShopDao;
 


@Service
public class CartService{
	@Autowired
	private CartDao cartDao;
	@Autowired
	private ShopDao shopDao;
	
	public List<CartVO> getCartList(CartVO cartVO){
		return cartDao.getCartList(cartVO);
	}
	
	

	public boolean insertCart(CartVO cartVO){
		ShopVO shopVO = new ShopVO();
		shopVO.setShop_id(cartVO.getShop_id());
		
		shopVO = shopDao.getShop(shopVO);
		if(shopVO == null) return false;
		
		int price = Integer.valueOf(shopVO.getPrice()).intValue();
		int stock = Integer.valueOf(cartVO.getStock()).intValue();
		cartVO.setPrice(String.valueOf(price*stock));
		
		int cnt = cartDao.insertCart(cartVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	
	
	public boolean updateCart(CartVO cartVO){
		ShopVO shopVO = new ShopVO();
		shopVO.setShop_id(cartVO.getShop_id());
		
		shopVO = shopDao.getShop(shopVO);
		if(shopVO == null) return false;
		
		int price = Integer.valueOf(shopVO.getPrice()).intValue();
		int stock = Integer.valueOf(cartVO.getStock()).intValue();
		cartVO.setPrice(String.valueOf(price*stock));
		
		int cnt = cartDao.updateCart(cartVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	public boolean deleteCart(CartVO cartVO){
		int cnt = cartDao.deleteCart(cartVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
    
}