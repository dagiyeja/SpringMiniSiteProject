package com.sist.databoard.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
public interface DataReplyMapper {
  @Select("SELECT COUNT(*) FROM dataReply "
		 +"WHERE bno=#{bno}")
  public int replyCount(int bno);
  @Select("SELECT no,bno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as strDay,group_tab "
		 +"FROM dataReply WHERE bno=#{bno} ORDER BY group_id DESC,group_step ASC")
  public List<DataReplyVO> replyListData(int bno);
  @Insert("INSERT INTO dataReply VALUES("
		 +"dr_no_seq.nextval,#{bno},#{id},#{name},"
		 +"#{msg},SYSDATE,(SELECT NVL(MAX(group_id)+1,1) FROM dataReply),"
		 +"0,0,0,0)")
  public void replyNewInsert(DataReplyVO vo);
  @Update("UPDATE dataReply SET "
		 +"msg=#{msg} "
		 +"WHERE no=#{no}")
  public void replyUpdate(DataReplyVO vo);
  // 댓글 => 댓글
  @Select("SELECT group_id,group_step,group_tab "
		 +"FROM dataReply "
		 +"WHERE no=#{no}")
  public DataReplyVO replyParentInfoData(int no);
  
  @Update("UPDATE dataReply SET "
		 +"group_step=group_step+1 "
		 +"WHERE group_id=#{group_id} "
		 +"AND group_step>#{group_step}")
  public void replyStepIncrement(DataReplyVO vo);
  /*                     gi  gs  gt
   *   AAAA              1    0   0
   *     
   *     ->BBBB          1    2   1    0
   *       
   *       
   *       
   *      
   *       
   *       
   *   EEEEE            
   *     
   */
  @Insert("INSERT INTO dataReply VALUES("
			 +"dr_no_seq.nextval,#{bno},#{id},#{name},"
			 +"#{msg},SYSDATE,#{group_id},"
			 +"#{group_step},#{group_tab},#{root},0)")
  public void replyReInsert(DataReplyVO vo);
  
  @Update("UPDATE dataReply SET "
		 +"depth=depth+1 "
		 +"WHERE no=#{no}")
  public void replyDepthIncrement(int no);
  
  // 삭제
  @Select("SELECT depth,root FROM dataReply "
		 +"WHERE no=#{no}")
  public DataReplyVO replyGetDepthData(int no);
  @Delete("DELETE FROM dataReply "
		 +"WHERE no=#{no}")
  public void replyDelete(int no);
  @Update("UPDATE dataReply SET "
		 +"msg='관리자가 삭제한 댓글입니다' "
		 +"WHERE no=#{no}")
  public void replyMsgUpdate(int no);
  
  @Update("UPDATE dataReply SET "
			 +"depth=depth-1 "
			 +"WHERE no=#{no}")
  public void replyDepthDecrement(int no);
  /*                    gi   gs   gt   root
   *  1  AAAAA            1   0     0    0
   *  2   -> BBBBBB       1   1     1    1
   *  3    -> CCCCCCC     1   2     2    2
   *         ->           1   3     3    3
   *  4   -> DDDDD        1   3     1    1
   *  5    -> FFFFF       1   4     2    4
   *        
   *  6 FFFFFF            2   0     0    0
   */
  @Delete("DELETE FROM dataReply "
		 +"WHERE bno=#{bno}")
  public void replyAllDelete(int bno);
  
}















