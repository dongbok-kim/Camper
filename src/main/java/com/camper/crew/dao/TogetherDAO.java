package com.camper.crew.dao;

import java.util.ArrayList;

import com.camper.crew.dto.TogetherDTO;

public interface TogetherDAO {

	TogetherDTO view(int ct_idx);

	ArrayList<TogetherDTO> list();

	void crewTogetherDelete(String ct_idx);


	

}
