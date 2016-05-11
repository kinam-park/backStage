package com.bs.models;
 
public class UserVO {
	/** user **/
	private String userId;
	private String roleId;
	private String email;
	private String password;
	private String name;
	private String company;
	private String phone1;
	private String phone2;
	private String stopCondition;
	private String notificationId;
	private String notificationEmail;
	private String lastLoginAt;
	private String createdAt;
	private String createdAtYmd;
	private String timestampLastLogin;
	private String timestampCreated;
	private String expirationDate;
	
	
	/** role_policy **/
	private String roleName;
	private String code;
	private String availableService;
	private int keywordLimit;
	
	private String kId;
	
	
	
	
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	public int getKeywordLimit() {
		return keywordLimit;
	}
	public void setKeywordLimit(int keywordLimit) {
		this.keywordLimit = keywordLimit;
	}
	public String getkId() {
		return kId;
	}
	public void setkId(String kId) {
		this.kId = kId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAvailableService() {
		return availableService;
	}
	public void setAvailableService(String availableService) {
		this.availableService = availableService;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getStopCondition() {
		return stopCondition;
	}
	public void setStopCondition(String stopCondition) {
		this.stopCondition = stopCondition;
	}
	public String getNotificationId() {
		return notificationId;
	}
	public void setNotificationId(String notificationId) {
		this.notificationId = notificationId;
	}
	public String getNotificationEmail() {
		return notificationEmail;
	}
	public void setNotificationEmail(String notificationEmail) {
		this.notificationEmail = notificationEmail;
	}
	public String getLastLoginAt() {
		return lastLoginAt;
	}
	public void setLastLoginAt(String lastLoginAt) {
		this.lastLoginAt = lastLoginAt;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getCreatedAtYmd() {
		return createdAtYmd;
	}
	public void setCreatedAtYmd(String createdAtYmd) {
		this.createdAtYmd = createdAtYmd;
	}
	public String getTimestampLastLogin() {
		return timestampLastLogin;
	}
	public void setTimestampLastLogin(String timestampLastLogin) {
		this.timestampLastLogin = timestampLastLogin;
	}
	public String getTimestampCreated() {
		return timestampCreated;
	}
	public void setTimestampCreated(String timestampCreated) {
		this.timestampCreated = timestampCreated;
	}

}
