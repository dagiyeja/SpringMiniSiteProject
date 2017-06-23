package com.sist.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import java.util.*;
public interface MemberMapper {
  @Select("SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') as bunji "
		 +"FROM zipcode "
		 +"WHERE dong LIKE '%'||#{dong}||'%'")
  // rs.getString("NVL(bunji,' ')")
  public List<ZipcodeVO> zicodeListData(String dong);
  @Select("SELECT COUNT(*) FROM member "
		 +"WHERE id=#{id}")
  public int memberIdcheck(String id);
  // 저장 
  @Insert("INSERT INTO member VALUES("
		 +"#{id},#{pwd},#{name},#{sex},#{bday},"
		 +"#{email},#{post},#{addr1},#{addr2},"
		 +"#{tel},'n')")
  public void memberInsert(MemberVO vo);
  // 로그인 
  @Select("SELECT pwd FROM member "
		 +"WHERE id=#{id}")
  public String memberGetPwd(String id);
  @Select("SELECT id,name,email,admin FROM member "
		 +"WHERE id=#{id}")
  public MemberVO memberInfoData(String id);
}




