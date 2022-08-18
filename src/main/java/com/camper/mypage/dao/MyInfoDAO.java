package com.camper.mypage.dao;

import com.camper.mypage.dto.MyInfoDTO;

public interface MyInfoDAO {

	MyInfoDTO myInfo(String mb_id);

	String login(String mb_id);

	void secession(String mb_id);

	String doubleCheckEmail(String chkEmail);

	String doubleCheckNickname(String chkNickname);

	void myInfoUpdate(String mb_id, String mb_nickname, String mb_email, String mb_postcode,
			String mb_addr_default, String mb_addr_detail, String ma_idx, String mb_sido, String mb_sigungu,  String mb_newpassword );

	void myInfoUpdateTwo(String mb_id, String mb_nickname, String mb_email, String mb_postcode, String mb_addr_default,
			String mb_addr_detail, String ma_idx, String mb_sido, String mb_sigungu);

	MyInfoDTO myInfoTitle(String mb_id);

	int myInfoStop(String mb_id);


}
