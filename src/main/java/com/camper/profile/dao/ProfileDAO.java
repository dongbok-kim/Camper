package com.camper.profile.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.profile.dto.ProfileDTO;

public interface ProfileDAO {

	

	ProfileDTO profileView(String mb_id);

	void MemberBlock(String mb_id, String loginId);

	void MemberBlockDelete(String mb_id, String loginId);

	String blockCheck(String mb_id, String loginId);

	ArrayList<ProfileDTO> profileTogether(String mb_id);

	ArrayList<ProfileDTO> profileReview(String mb_id);

	int report(HashMap<String, String> params);

	void photoSave(String photo_original, String photo_copy, int rp_idx);

	ProfileDTO myInfo(String loginId);

	ProfileDTO repoInfo(String mb_id);

	String NormalMember(String mb_id);
	
	
	

	int total(HashMap<String, Object> params);

	
	

	ArrayList<ProfileDTO> profileView2(HashMap<String, Object> params);

	int allCount();

	ArrayList<ProfileDTO> profileReview2(HashMap<String, Object> params);

}
