package com.sist.food.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import java.util.*;
// 서울특별시 동대문구 신설동 76-35
/*ㅊㄴ
 *    형태소 분석
 *    몬테칼로
 *    퍼지
 *   
 */
public interface FoodMapper {
  // 중복없는 구 찾기 rs.getString("gu") ==> setGu(rs.getString("gu"))
  @Select("SELECT DISTINCT SUBSTR(addr,INSTR(addr,' ',1,1)+1, "
		 +"LENGTH(INSTR(addr,' ',1,2))+1) as gu "
		 +"FROM food "
		 +"WHERE kind=#{kind} ORDER BY gu ASC")
  public List<String> reserveLocData(String kind);
  @Select("SELECT no,name,tel,addr,image FROM food "
		 +"WHERE addr LIKE '%'||#{addr}||'%' AND kind=#{kind}")
  public List<FoodReserveVO> reserveListData(Map map);
  @Select("SELECT res_day FROM food "
		 +"WHERE no=#{no}")
  public String reserveDayData(int no);
  @Select("SELECT rd_time FROM reserve_day "
		  +"WHERE rd=#{rd}")
  public String reserveTimeData(int rd);
  @Select("SELECT rt_time FROM reserve_time "
		 +"WHERE rt=#{rt} AND rt_time>TO_CHAR(SYSDATE,'HH24:MI')")
  public String reserveRealTime(int rt);
  
  //예약
  @SelectKey(keyProperty="res_no",resultType=int.class,
		    before=true,
		    statement="SELECT NVL(MAX(res_no)+1,1) as res_no FROM foodres")
  @Insert("INSERT INTO foodres(res_no,house_no,id,res_date,res_time,res_inwon) VALUES("
		 +"#{res_no},#{house_no},#{id},"
		 +"#{res_date},#{res_time},#{res_inwon})")
  public void foodResInsert(FoodResVO vo);
  // <resultMap>
  //  <result property="res_no",column="res_no">
  @Results(
		  {
		    @Result(property="res_no",column="res_no"),
		    // setRes_no(rs.getInt("res_no"))
		    @Result(property="house_no",column="house_no"),
		    @Result(property="id",column="id"),
		    @Result(property="res_date",column="res_date"),
		    @Result(property="res_time",column="res_time"),
		    @Result(property="res_inwon",column="res_inwon"),
		    @Result(property="res_state",column="res_state"),
		    @Result(property="regdate",column="regdate"),
		    @Result(property="fvo.name",column="name"),
		    // fvo.setName(rs.getString("name"))
		    @Result(property="fvo.addr",column="addr"),
		    @Result(property="fvo.image",column="image"),
		    @Result(property="fvo.tel",column="tel")
		  }
         )
  @Select("SELECT res_no,house_no,id,res_date,"
		 +"res_time,res_inwon,res_state,regdate,"
		 +"name,addr,image,tel "
		 +"FROM foodres,food "
		 +"WHERE id=#{id} AND house_no=no")
  public List<FoodResVO> foodMyPage(String id);
  
  @Results(
		  {
		    @Result(property="res_no",column="res_no"),
		    // setRes_no(rs.getInt("res_no"))
		    @Result(property="house_no",column="house_no"),
		    @Result(property="id",column="id"),
		    @Result(property="res_date",column="res_date"),
		    @Result(property="res_time",column="res_time"),
		    @Result(property="res_inwon",column="res_inwon"),
		    @Result(property="res_state",column="res_state"),
		    @Result(property="regdate",column="regdate"),
		    @Result(property="fvo.name",column="name"),
		    // fvo.setName(rs.getString("name"))
		    @Result(property="fvo.addr",column="addr"),
		    @Result(property="fvo.image",column="image"),
		    @Result(property="fvo.tel",column="tel")
		  }
         )
  @Select("SELECT res_no,house_no,id,res_date,"
		 +"res_time,res_inwon,res_state,regdate,"
		 +"name,addr,image,tel "
		 +"FROM foodres,food "
		 +"WHERE house_no=no")
  public List<FoodResVO> foodAdminPage();
   
  @Update("UPDATE foodres SET "
		  +"res_state='y' "
		  +"WHERE res_no=#{res_no}")
  public void resStateChange(int res_no);
}















