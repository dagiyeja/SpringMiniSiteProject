package com.sist.member.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
@Repository
public class MemberDAO {
   @Autowired
   private MemberMapper mMapper;
   public List<ZipcodeVO> zipcodeListData(String dong)
   {
	   return mMapper.zicodeListData(dong);
   }
   public int memberIdcheck(String id)
   {
	   return mMapper.memberIdcheck(id);
   }
   public void memberInsert(MemberVO vo)
   {
	   mMapper.memberInsert(vo);
   }
   
   public String memberGetPwd(String id)
   {
	   return mMapper.memberGetPwd(id);
   }
  
   public MemberVO memberInfoData(String id)
   {
	   return mMapper.memberInfoData(id);
   }
}
