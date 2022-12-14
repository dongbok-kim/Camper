package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.MemberAdmDTO;
import com.camper.lib.utils.Criteria;

public interface MemberAdmDAO {
	
	int memberTotal(HashMap<String, Object> params);

	ArrayList<MemberAdmDTO> memberAdmList(HashMap<String, Object> params);

	MemberAdmDTO memberAdmDetail(String mb_id);

	void memberAdmUpdate(String mb_id, String mb_grade);

	MemberAdmDTO memberAdmAge(String mb_id);

	MemberAdmDTO memberAdmTitle(String mb_id);


}
