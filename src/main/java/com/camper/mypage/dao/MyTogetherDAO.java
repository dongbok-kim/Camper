package com.camper.mypage.dao;

import java.util.ArrayList;

import com.camper.mypage.dto.MyTogetherDTO;

public interface MyTogetherDAO {

	ArrayList<MyTogetherDTO> myCrewWriteList(String temporaryId);

	void myCrewWriteDelete(String idx, String temporaryId);

}
