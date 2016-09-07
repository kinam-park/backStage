package com.bs.contents;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.common.module.Utils;
import com.bs.models.ContentsVO;
 


@Service
public class ContentsService{
	@Autowired
	private ContentsDao contentsDao;
	
	public List<ContentsVO> getContentsList(ContentsVO contentsVO){
		return contentsDao.getContentsList(contentsVO);
	}
	
	public ContentsVO getContents(ContentsVO contentsVO){
		return contentsDao.getContents(contentsVO);
	}
	
//	public List<ContentsVO> getCategoryList(ContentsVO contentsVO){
//		return contentsDao.getCategoryList(contentsVO);
//	}
	
	public boolean insertContents(ContentsVO contentsVO){
		String contents = contentsVO.getContents();
		String mainImg = Utils.exportImgSrc(contents);
		contentsVO.setMain_img(mainImg);
		
		
		int cnt = contentsDao.insertContents(contentsVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	public boolean updateContents(ContentsVO contentsVO){
		int cnt = contentsDao.updateContents(contentsVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	public boolean deleteContents(ContentsVO contentsVO){
		int cnt = contentsDao.deleteContents(contentsVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
    
}