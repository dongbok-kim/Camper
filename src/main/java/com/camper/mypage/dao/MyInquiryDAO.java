package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import com.camper.mypage.dto.MyInquiryDTO;

public interface MyInquiryDAO {

	void inquiryWrite(HashMap<String, String> params);

	MyInquiryDTO inquiryDetail(String idx);

	void myInquiryDelete(String idx, String loginId);

	MyInquiryDTO myInquiryUpdateForm(String idx);

	void myInquiryUpdate(HashMap<String, String> params);

	ArrayList<MyInquiryDTO> myInquiryList(HashMap<String, Object> params);

	int total(HashMap<String, Object> params);

	MyInquiryDTO inquiryAnswer(String idx);

	MyInquiryDTO writeSuccess(String loginId);

	ModelAndView inquirySearch(HashMap<String, String> params);

}
