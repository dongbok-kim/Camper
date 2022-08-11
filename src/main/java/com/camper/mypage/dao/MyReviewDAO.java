package com.camper.mypage.dao;

import com.camper.mypage.dto.MyReviewDTO;

public interface MyReviewDAO {

	MyReviewDTO campingReviewForm(String idx);

	String nickname(String loginId);

}
