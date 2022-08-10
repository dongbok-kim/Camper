package com.camper.login.dao;

import com.camper.login.dto.LoginDTO;

public interface LoginDAO {

	String doubleCheckId(String chkId);
	
	String doubleCheckEmail(String chkEmail);

	String doubleCheckNickname(String chkNickname);

	int join(LoginDTO dto);

}
