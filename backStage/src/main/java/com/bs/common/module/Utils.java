package com.bs.common.module;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils{
	public Utils(){
		
	}
	
	public static String exportImgSrc(String contents){
		if(contents == null){return null;}
		
		String src = null;
		Pattern pattern  =  Pattern.compile("(?i)<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Matcher match = pattern.matcher(contents);
		if(match.find()){ 
		    src = match.group(1); 
		}
		return src;
		
	}
	
	
	
}