package com.camper.profile.dao;

import java.util.ArrayList;

import com.camper.profile.dto.ProfileDTO;

public interface ProfileDAO {

	

	ProfileDTO profileView(String mb_id);

	void MemberBlock(String mb_id, String loginId);

	void MemberBlockDelete(String mb_id, String loginId);

	String blockCheck(String mb_id, String loginId);

	ArrayList<ProfileDTO> profileTogether(String mb_id);

	ArrayList<ProfileDTO> profileReview(String mb_id);

}
