package com.camper.mypage.dao;

import com.camper.mypage.dto.MyInfoDTO;

public interface MyInfoDAO {

	MyInfoDTO myInfo(String mb_id);

	String login(String mb_id);

	void secession(String mb_id);

	String doubleCheckEmail(String chkEmail);

	String doubleCheckNickname(String chkNickname);

}
