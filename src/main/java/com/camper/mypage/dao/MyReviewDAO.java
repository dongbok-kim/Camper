package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyReviewDTO;

public interface MyReviewDAO {

	MyReviewDTO reviewForm(String idx);

	String nickname(String loginId);

	void campingReviewWrite(HashMap<String, String> params);

	ArrayList<MyReviewDTO> crewList(String idx, String loginId);

	ArrayList<MyReviewDTO> campingReviewList(HashMap<String, Object> params);

	void campingReviewDelete(String idx, String loginId);

	ArrayList<MyReviewDTO> crewReviewR(HashMap<String, Object> params);

	ArrayList<MyReviewDTO> crewReviewW(HashMap<String, Object> params);

	void crewReview(String assessment, String score, String content, String loginId, String mb_id, String idx);

	void crewReviewDelete(String idx, String loginId);

	void memberUpdate(String mb_id);

	String getId(String idx, String loginId);

	String chk(String idx, String loginId);

	int total(HashMap<String, Object> params);

	int totalR(HashMap<String, Object> params);

	int totalW(HashMap<String, Object> params);

	MyReviewDTO delAble(String idx, String loginId);

}
