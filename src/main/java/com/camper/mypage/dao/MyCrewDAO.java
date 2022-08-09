package com.camper.mypage.dao;

import java.util.ArrayList;

import com.camper.mypage.dto.MyCrewDTO;

public interface MyCrewDAO {

	ArrayList<MyCrewDTO> myCrewList(String temporaryId);

}
