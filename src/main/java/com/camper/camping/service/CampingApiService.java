package com.camper.camping.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.camping.dao.CampingApiDAO;
import com.camper.camping.dto.CampingApiDTO;

@Service
public class CampingApiService {

	@Autowired
	CampingApiDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String setCampingApi() throws Exception {
		//try {
	          StringBuilder urlBuilder = new StringBuilder("https://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
	          urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "hZXUq%2BKTXAvCwumYJGHXYx7VT4UFl8QkVYtg03cDfMxqMd7YolwCw4cX3y76PG%2Bc3X2t5xOnY%2F3uCvbbU5jNwA%3D%3D"); /*Service Key*/
	          urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	          urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*페이지 번호*/
	          urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
	          urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	          urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	          URL url = new URL(urlBuilder.toString());
	          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	          conn.setRequestMethod("GET");
	          conn.setRequestProperty("Content-type", "application/json");
	          BufferedReader bfReader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
	          
	          //JSON return
	          //logger.info("" + new JSONObject(bfReader.readLine()));
	          //logger.info("" + new JSONObject(bfReader.readLine()));
	          
	          JSONObject jsonObj = (JSONObject) new JSONObject(bfReader.readLine()).getJSONObject("response").getJSONObject("body").get("items");
	          //logger.info("jsonObj : "+jsonObj);
	          JSONArray jsonArr = jsonObj.getJSONArray("item");
	          logger.info("length" + jsonArr.length());
	          
	          //데이터 넣기 전 api테이블 비우는 작업
	          dao.apiDel(jsonArr);
	          //데이터 꺼내기 위한 작업
	          for (int i = 0; i < jsonArr.length(); i++) {
	             //jsonArr.getJSONObject(i).get("contentId");
	             // json contentId
	        	 //String contentIds = (String) jsonArr.getJSONObject(i).get("test");
	        	 
	        	 CampingApiDTO dto = new CampingApiDTO();
	        	 
	        	 //캠핑장 ID
	        	 logger.info("contentId : " + jsonArr.getJSONObject(i).get("contentId").toString());
	        	 int contentId = Integer.valueOf((String) jsonArr.getJSONObject(i).get("contentId"));
	        	 dto.setCa_idx(contentId);
	        	 
	        	 //캠핑장 이름
	        	 logger.info("facltNm : " + jsonArr.getJSONObject(i).get("facltNm").toString());
	        	 String facltNm = (String) jsonArr.getJSONObject(i).get("facltNm");
	        	 dto.setCa_name(facltNm);
	        	 
	        	 //한줄소개
	        	 logger.info("lineIntro : " + jsonArr.getJSONObject(i).get("lineIntro").toString());
	        	 String lineIntro = (String) jsonArr.getJSONObject(i).get("lineIntro");
	        	 dto.setCa_intro(lineIntro);
	        	 
	        	 //운영상태, 관리상태
	        	 logger.info("manageSttus : " + jsonArr.getJSONObject(i).get("manageSttus").toString());
	        	 String manageSttus = (String) jsonArr.getJSONObject(i).get("manageSttus");
	        	 dto.setCa_manage_status(manageSttus);
	        	 
	        	 //업종
	        	 logger.info("induty : " + jsonArr.getJSONObject(i).get("induty").toString());
	        	 String induty = (String) jsonArr.getJSONObject(i).get("induty");
	        	 dto.setCa_induty(induty);
	        	 
	        	 //시/도
	        	 logger.info("doNm : " + jsonArr.getJSONObject(i).get("doNm").toString());
	        	 String doNm = (String) jsonArr.getJSONObject(i).get("doNm");
	        	 
	        	 //시/도 커스텀
	        	 if (doNm.equals("경상남도")) {
						doNm = "경남";
						logger.info("변경된 doNm : " + doNm);
	        	 }
	        	 else if (doNm.equals("경상북도")) {
						doNm = "경북";
						logger.info("변경된 doNm : " + doNm);
	        	 }
	        	 else if (doNm.equals("전라남도")) {
						doNm = "전남";
						logger.info("변경된 doNm : " + doNm);
	        	 }
	        	 else if (doNm.equals("전라북도")) {
						doNm = "전북";
						logger.info("변경된 doNm : " + doNm);
	        	 }
	        	 else if (doNm.equals("충청남도")) {
						doNm = "충남";
						logger.info("변경된 doNm : " + doNm);
	        	 }
	        	 else if (doNm.equals("충청북도")) {
						doNm = "충북";
						logger.info("변경된 doNm : " + doNm);
	        	 } 
	        	 else {
	        		 doNm = doNm.substring(0, 2);
	        		 logger.info("변경된 doNm : " + doNm);
	        	 }
	        	 dto.setCa_sido(doNm);
	        	 
	        	 //시/군/구
	        	 logger.info("sigunguNm : " + jsonArr.getJSONObject(i).get("sigunguNm").toString());
	        	 String sigunguNm = (String) jsonArr.getJSONObject(i).get("sigunguNm");
	        	 dto.setCa_sigungu(sigunguNm);
	        	 
	        	 //우편번호
	        	 logger.info("zipcode : " + jsonArr.getJSONObject(i).get("zipcode").toString());
	        	 String zipcode = (String) jsonArr.getJSONObject(i).get("zipcode");
	        	 dto.setCa_postcode(zipcode);
	        	 
	        	 //기본주소
	        	 logger.info("addr1 : " + jsonArr.getJSONObject(i).get("addr1").toString());
	        	 String addr1 = (String) jsonArr.getJSONObject(i).get("addr1");
	        	 dto.setCa_addr_default(addr1);
	        	 
	        	 //상세주소
	        	 logger.info("addr2 : " + jsonArr.getJSONObject(i).get("addr2").toString());
	        	 String addr2 = (String) jsonArr.getJSONObject(i).get("addr2");
	        	 dto.setCa_addr_detail(addr2);
	        	 
	        	 //경도
	        	 logger.info("mapX : " + jsonArr.getJSONObject(i).get("mapX").toString());
	        	 double mapX = Double.valueOf((String) jsonArr.getJSONObject(i).get("mapX"));
	        	 dto.setCa_mapX(mapX);
	        	 
	        	 //위도
	        	 logger.info("mapY : " + jsonArr.getJSONObject(i).get("mapY").toString());
	        	 double mapY = Double.valueOf((String) jsonArr.getJSONObject(i).get("mapY"));
	        	 dto.setCa_mapY(mapY);
	        	 
	        	 //전화
	        	 logger.info("tel : " + jsonArr.getJSONObject(i).get("tel").toString());
	        	 String tel = (String) jsonArr.getJSONObject(i).get("tel");
	        	 dto.setCa_tel(tel);
	        	 
	        	 //운영계정
	        	 logger.info("operPdCl : " + jsonArr.getJSONObject(i).get("operPdCl").toString());
	        	 String operPdCl = (String) jsonArr.getJSONObject(i).get("operPdCl");
	        	 dto.setCa_oper_period(operPdCl);
	        	 
	        	 //운영일
	        	 logger.info("operDeCl : " + jsonArr.getJSONObject(i).get("operDeCl").toString());
	        	 String operDeCl = (String) jsonArr.getJSONObject(i).get("operDeCl");
	        	 dto.setCa_oper_date(operDeCl);
	        	 
	        	 //화로대
	        	 logger.info("brazierCl : " + jsonArr.getJSONObject(i).get("brazierCl").toString());
	        	 String brazierCl = (String) jsonArr.getJSONObject(i).get("brazierCl");
	        	 dto.setCa_fire_cnt(brazierCl);
	        	 
	        	 //부대시설
	        	 logger.info("sbrsCl : " + jsonArr.getJSONObject(i).get("sbrsCl").toString());
	        	 String sbrsCl = (String) jsonArr.getJSONObject(i).get("sbrsCl");
	        	 dto.setCa_sub_facility(sbrsCl);
	        	 
	        	 //주변이용가능시설
	        	 logger.info("posblFcltyCl : " + jsonArr.getJSONObject(i).get("posblFcltyCl").toString());
	        	 String posblFcltyCl = (String) jsonArr.getJSONObject(i).get("posblFcltyCl");
	        	 dto.setCa_possibilty(posblFcltyCl);
	        	 
	        	 //캠핑장환경
	        	 logger.info("lctCl : " + jsonArr.getJSONObject(i).get("lctCl").toString());
	        	 String lctCl = (String) jsonArr.getJSONObject(i).get("lctCl");
	        	 dto.setCa_environment(lctCl);
	        	 
	        	 //테마환경
	        	 logger.info("themaEnvrnCl : " + jsonArr.getJSONObject(i).get("themaEnvrnCl").toString());
	        	 String themaEnvrnCl = (String) jsonArr.getJSONObject(i).get("themaEnvrnCl");
	        	 dto.setCa_theme(themaEnvrnCl);
	        	 
	        	 //캠핑장비대여
	        	 logger.info("eqpmnLendCl : " + jsonArr.getJSONObject(i).get("eqpmnLendCl").toString());
	        	 String eqpmnLendCl = (String) jsonArr.getJSONObject(i).get("eqpmnLendCl");
	        	 dto.setCa_tool(eqpmnLendCl);
	        	 
	        	 //애완동물출입
	        	 logger.info("animalCmgCl : " + jsonArr.getJSONObject(i).get("animalCmgCl").toString());
	        	 String animalCmgCl = (String) jsonArr.getJSONObject(i).get("animalCmgCl");
	        	 dto.setCa_pet(animalCmgCl);
	        	 
	        	 //대표이미지
	        	 logger.info("firstImageUrl : " + jsonArr.getJSONObject(i).get("firstImageUrl").toString());
	        	 String firstImageUrl = (String) jsonArr.getJSONObject(i).get("firstImageUrl");
	        	 dto.setCa_img(firstImageUrl);
     	 
	        	 //등록일
	        	 //logger.info("createdtime : " + (String) jsonArr.getJSONObject(i).get("createdtime") + ".00");
	             Timestamp createdtime = Timestamp.valueOf((String) jsonArr.getJSONObject(i).get("createdtime"));
	        	 dto.setCa_create_date(createdtime);
	        	 logger.info("자 보자:"+createdtime);
 
	        	 //수정일
	        	 logger.info("modifiedtime : " + jsonArr.getJSONObject(i).get("modifiedtime").toString());
	        	 Timestamp modifiedtime = Timestamp.valueOf((String) jsonArr.getJSONObject(i).get("modifiedtime"));
	        	 dto.setCa_modified_date(modifiedtime);
	        	
	        	 dao.setCampingApi(dto);
	        	 
	        	 
	        	 //dto.setCa_idx(contentId);
	        	 
	             //전체결과수 알아내고, 
	          }
	          bfReader.close();
	          conn.disconnect();
	          
	          ArrayList<CampingApiDTO> chk = dao.unionSelect();//추가,삭제 -- 추가,삭제 여부와 idx 만 가져온다
	          logger.info("chk? : " + chk);
	          ArrayList<Integer> addList = new ArrayList<Integer>(); //추가 빈 arraylist
	          ArrayList<Integer> delList = new ArrayList<Integer>(); //삭제 빈 arraylist

	          for (CampingApiDTO item : chk) {
	             if (item.getIsStatus().equals("추가")) {
	                addList.add(item.getCa_idx());
	             } else if (item.getIsStatus().equals("삭제")) {
	                delList.add(item.getCa_idx());
	             }
	          }
	          
	          if(addList.size() > 0) {
	        	dao.newCamping(addList);  
	          }
	          
	          if(delList.size() > 0) {
	        	dao.statusChange(delList);
	          }
	          
	          
		return null;
		
	}
	
	
	

}
