package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyReviewDTO;

public interface MyReviewDAO {

	MyReviewDTO reviewForm(String idx);

	String nickname(String loginId);

	void campingReviewWrite(HashMap<String, String> params);

	ArrayList<MyReviewDTO> crewList(String idx, String loginId);

	ArrayList<MyReviewDTO> campingReviewList(String loginId);

	void campingReviewDelete(String idx, String loginId);

	ArrayList<MyReviewDTO> crewReviewR(String loginId);

	ArrayList<MyReviewDTO> crewReviewW(String loginId);

}
