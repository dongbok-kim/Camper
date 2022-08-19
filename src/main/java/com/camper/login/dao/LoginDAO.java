package com.camper.login.dao;

import com.camper.login.dto.LoginDTO;

public interface LoginDAO {

	String doubleCheckId(String chkId);
	
	String doubleCheckEmail(String chkEmail);

	String doubleCheckNickname(String chkNickname);

	int join(LoginDTO dto);

	String login(String id);

	String idFind(String name, String email);

	int pwFind(String mb_id, String mb_email);

	String mbgrade(String id);

	String mbstatus(String id);

	void updateMbStatus();

	String idFindStatus(String name, String email);

	String pwFindstatus(String mb_id, String mb_email);

	void pwRework(String mb_id, String encode);

	

}
