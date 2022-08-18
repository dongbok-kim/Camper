package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyTogetherDTO;

public interface MyTogetherDAO {

	ArrayList<MyTogetherDTO> myCrewWriteList(HashMap<String, Object> params);

	void myCrewWriteDelete(String idx, String temporaryId);

	int total(HashMap<String, Object> params);

}
