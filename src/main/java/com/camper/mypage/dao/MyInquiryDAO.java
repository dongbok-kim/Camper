package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyInquiryDTO;

public interface MyInquiryDAO {

	ArrayList<MyInquiryDTO> myInquiryList(String temporaryId);

	void inquiryWrite(HashMap<String, String> params);

	MyInquiryDTO inquiryDetail(String idx);

	void myInquiryDelete(String idx, String loginId);

	MyInquiryDTO myInquiryUpdateForm(String idx, String loginId);

	void myInquiryUpdate(HashMap<String, String> params);

}
