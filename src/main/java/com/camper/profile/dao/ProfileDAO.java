package com.camper.profile.dao;

import java.util.ArrayList;

import com.camper.profile.dto.ProfileDTO;

public interface ProfileDAO {

	

	

	ProfileDTO profileView(String mb_id);



	void MemberBlock(String mb_id, String loginId);



	void MemberBlockDelete(String mb_id, String loginId);

}
