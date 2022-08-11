package com.camper.mypage.dao;

import java.util.HashMap;

import com.camper.mypage.dto.MyReviewDTO;

public interface MyReviewDAO {

	MyReviewDTO campingReviewForm(String idx);

	String nickname(String loginId);

	void campingReviewWrite(HashMap<String, String> params);

}
