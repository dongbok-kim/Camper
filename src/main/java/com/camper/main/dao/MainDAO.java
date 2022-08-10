package com.camper.main.dao;

import java.util.ArrayList;

import com.camper.main.dto.MainDTO;

public interface MainDAO {

	ArrayList<MainDTO> list();

	ArrayList<MainDTO> crew();

}
