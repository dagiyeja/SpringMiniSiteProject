package com.sist.databoard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
// JSP (��û) => board_content.do 
// DispatcherServlet ==> DataBoardController
// ����Ŭ�� �ִ� ������ ===> DataBoardController 
// Model ==> JSP(���)
@Service
public class DataBoardService {
	@Autowired
    private DataBoardMapper bMapper;
	@Autowired
    private DataReplyMapper rMapper;
	
	public List<DataBoardVO> databoardListData(Map map)
	{
		return bMapper.databoardListData(map);
	}
	public void databoardInsert(DataBoardVO vo)
	{
		bMapper.databoardInsert(vo);
	}
	// ��������
	public int databoardTotalPage()
	{
		return bMapper.databoardTotalPage();
	}
	// ���뺸��
	public DataBoardVO databoardContentData(int no)
	{
		bMapper.databoardHitIncrement(no);
		return bMapper.databoardContentData(no);
	}
	
	public DataBoardVO databoardUpdateData(int no)
	{
		return bMapper.databoardContentData(no);
	}
	
	public DataBoardVO databoardGetFileInfo(int no)
	{
		return bMapper.databoardGetFileInfo(no);
	}
	
	public String databoardGetPwd(int no)
	{
		return bMapper.databoardGetPwd(no);
	}
	
	public void databoardUpdate(DataBoardVO vo)
	{
		bMapper.databoardUpdate(vo);
	}
	
	public int replyCount(int bno)
	{
		return rMapper.replyCount(bno);
	}
	
	public List<DataReplyVO> replyListData(int bno)
	{
		return rMapper.replyListData(bno);
	}
	public void replyNewInsert(DataReplyVO vo)
	{
		rMapper.replyNewInsert(vo);
	}
	public void replyUpdate(DataReplyVO vo)
	{
		rMapper.replyUpdate(vo);
	}
	public void replyReInsert(int root,DataReplyVO vo)
	{
		DataReplyVO pvo=rMapper.replyParentInfoData(root);
		rMapper.replyStepIncrement(pvo);
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(root);
		rMapper.replyReInsert(vo);
		rMapper.replyDepthIncrement(root);
		
	}
	public void replyDelete(int no)
	{
		DataReplyVO vo=rMapper.replyGetDepthData(no);
		if(vo.getDepth()==0)
		{
			rMapper.replyDelete(no);
		}
		else
		{
			rMapper.replyMsgUpdate(no);
		}
		rMapper.replyDepthDecrement(vo.getRoot());
		
	}
	public void boardDelete(int no)
	{
		rMapper.replyAllDelete(no);
		bMapper.dataBoardDelete(no);
	}
}







