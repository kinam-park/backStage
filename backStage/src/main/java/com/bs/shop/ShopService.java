package com.bs.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.common.module.Utils;
import com.bs.models.ShopVO;
 


@Service
public class ShopService{
	@Autowired
	private ShopDao shopDao;
	
	public List<ShopVO> getShopList(ShopVO shopVO){
		return shopDao.getShopList(shopVO);
	}
	
	public ShopVO getShop(ShopVO shopVO){
		return shopDao.getShop(shopVO);
	}
	

	public boolean insertShop(ShopVO shopVO){
		String contents = shopVO.getContents();
		String mainImg = Utils.exportImgSrc(contents);
		shopVO.setMain_img(mainImg);
		
		
		int cnt = shopDao.insertShop(shopVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	public boolean updateShop(ShopVO shopVO){
		String contents = shopVO.getContents();
		String mainImg = Utils.exportImgSrc(contents);
		shopVO.setMain_img(mainImg);
		
		int cnt = shopDao.updateShop(shopVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	public boolean deleteShop(ShopVO shopVO){
		int cnt = shopDao.deleteShop(shopVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
    
}