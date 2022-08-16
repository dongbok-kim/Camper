package com.camper.camping.dao;

public interface CampingLikeDAO {

	void campingLike(String loginId, String ca_idx);

	String clIdx(String ca_idx, String loginId);

}
