package com.camper.lib.dao;

import java.util.HashMap;

public interface CommonDAO {

	void campingLikeDelete(String idx, String loginId);

	void blindSelf(String idx, String loginId);

	void blockDelete(String idx, String loginId);

	void blind(HashMap<String, String> params);

}
