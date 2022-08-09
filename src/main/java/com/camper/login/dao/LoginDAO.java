package com.camper.login.dao;

public interface LoginDAO {

	String doubleCheckId(String chkId);
	
	String doubleCheckEmail(String chkEmail);

	String doubleCheckNickname(String chkNickname);

}
