package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyCrewDTO;

public interface MyCrewDAO {

	ArrayList<MyCrewDTO> myCrewList(HashMap<String, Object> params);

	HashMap<String, String> myCrewTogetherInfo(String idx);

	ArrayList<MyCrewDTO> crewList(String idx);

	void crewUpdate(String string, String idx);

	void crewTogetherUpdate(String idx);

	int total(HashMap<String, Object> params);

}
