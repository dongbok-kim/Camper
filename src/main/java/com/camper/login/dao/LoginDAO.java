package com.camper.login.dao;

import com.camper.login.dto.LoginDTO;

public interface LoginDAO {

	String doubleCheckId(String chkId);
	
	String doubleCheckEmail(String chkEmail);

	String doubleCheckNickname(String chkNickname);

	int join(LoginDTO dto);

	String login(String id);

	String idFind(String name, String email);

	String pwFind(String mb_id, String mb_email);

	

}
