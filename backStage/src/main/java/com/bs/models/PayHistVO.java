package com.bs.models;

public class PayHistVO{
	private String result_code            ;
	private String result_msg             ;
	private String auth_date              ;
	private String auth_code              ;
	private String buyer_name             ;
	private String mall_user_id            ;
	private String pay_method             ;
	private String mid                   ;
	private String tid                   ;
	private String moid                  ;
	private String amt                   ;
	private String goods_name             ;
	private String card_code              ;
	private String card_name              ;
	private String card_quota             ;
	private String bank_code              ;
	private String bank_name              ;
	private String rcpt_type              ;
	private String rcpt_auth_code          ;
	private String rcpt_tid               ;
	private String carrier               ;
	private String dst_addr               ;
	private String vbank_bank_code         ;
	private String vbank_bank_name         ;
	private String vbank_num              ;
	private String vbank_exp_date          ;
	
	
	
	
	
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}
	public String getResult_msg() {
		return result_msg;
	}
	public void setResult_msg(String result_msg) {
		this.result_msg = result_msg;
	}
	public String getAuth_date() {
		return auth_date;
	}
	public void setAuth_date(String auth_date) {
		this.auth_date = auth_date;
	}
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getMall_user_id() {
		return mall_user_id;
	}
	public void setMall_user_id(String mall_user_id) {
		this.mall_user_id = mall_user_id;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getMoid() {
		return moid;
	}
	public void setMoid(String moid) {
		this.moid = moid;
	}
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getCard_code() {
		return card_code;
	}
	public void setCard_code(String card_code) {
		this.card_code = card_code;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_quota() {
		return card_quota;
	}
	public void setCard_quota(String card_quota) {
		this.card_quota = card_quota;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getRcpt_type() {
		return rcpt_type;
	}
	public void setRcpt_type(String rcpt_type) {
		this.rcpt_type = rcpt_type;
	}
	public String getRcpt_auth_code() {
		return rcpt_auth_code;
	}
	public void setRcpt_auth_code(String rcpt_auth_code) {
		this.rcpt_auth_code = rcpt_auth_code;
	}
	public String getRcpt_tid() {
		return rcpt_tid;
	}
	public void setRcpt_tid(String rcpt_tid) {
		this.rcpt_tid = rcpt_tid;
	}
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getDst_addr() {
		return dst_addr;
	}
	public void setDst_addr(String dst_addr) {
		this.dst_addr = dst_addr;
	}
	public String getVbank_bank_code() {
		return vbank_bank_code;
	}
	public void setVbank_bank_code(String vbank_bank_code) {
		this.vbank_bank_code = vbank_bank_code;
	}
	public String getVbank_bank_name() {
		return vbank_bank_name;
	}
	public void setVbank_bank_name(String vbank_bank_name) {
		this.vbank_bank_name = vbank_bank_name;
	}
	public String getVbank_num() {
		return vbank_num;
	}
	public void setVbank_num(String vbank_num) {
		this.vbank_num = vbank_num;
	}
	public String getVbank_exp_date() {
		return vbank_exp_date;
	}
	public void setVbank_exp_date(String vbank_exp_date) {
		this.vbank_exp_date = vbank_exp_date;
	}
	
	
	
	
	
	
	

	
}

//CREATE TABLE PAY_HIST(
//RESULT_CODE        VARCHAR(100)
//,RESULT_MSG        VARCHAR(100)
//,AUTH_DATE         VARCHAR(100)
//,AUTH_CODE         VARCHAR(100)
//,BUYER_NAME        VARCHAR(100)
//,MALL_USER_ID      VARCHAR(100)
//,PAY_METHOD        VARCHAR(100)
//,MID               VARCHAR(100)
//,TID               VARCHAR(100)
//,MOID              VARCHAR(100)
//,AMT               VARCHAR(100)
//,GOODS_NAME        VARCHAR(100)
//,CARD_CODE         VARCHAR(100)
//,CARD_NAME         VARCHAR(100)
//,CARD_QUOTA        VARCHAR(100)
//,BANK_CODE         VARCHAR(100)
//,BANK_NAME         VARCHAR(100)
//,RCPT_TYPE         VARCHAR(100)
//,RCPT_AUTH_CODE    VARCHAR(100)
//,RCPT_TID          VARCHAR(100)
//,CARRIER           VARCHAR(100)
//,DST_ADDR          VARCHAR(100)
//,VBANK_BANK_CODE   VARCHAR(100)
//,VBANK_BANK_NAME   VARCHAR(100)
//,VBANK_NUM         VARCHAR(100)
//,VBANK_EXP_DATE    VARCHAR(100)
//,PRIMARY KEY (TID)
//)

//result_code      
//result_msg       
//auth_date        
//auth_code        
//buyer_name       
//mall_user_id     
//pay_method       
//mid              
//tid              
//moid             
//amt              
//goods_name       
//card_code        
//card_name        
//card_quota       
//bank_code        
//bank_name        
//rcpt_type        
//rcpt_auth_code   
//rcpt_tid         
//carrier          
//dst_addr         
//vbank_bank_code  
//vbank_bank_name  
//vbank_num        
//vbank_exp_date   



//String resultCode    
//String resultMsg     
//String authDate      
//String authCode      
//String buyerName     
//String mallUserID    
//String payMethod     
//String mid           
//String tid           
//String moid          
//String amt           
//String goodsName     
//String cardCode      
//String cardName      
//String cardQuota     
//String bankCode      
//String bankName      
//String rcptType      
//String rcptAuthCode  
//String rcptTID       
//String carrier       
//String dstAddr       
//String vbankBankCode 
//String vbankBankName 
//String vbankNum      
//String vbankExpDate  