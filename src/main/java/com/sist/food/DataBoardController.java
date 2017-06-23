package com.sist.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.databoard.dao.DataBoardFileVO;
import com.sist.databoard.dao.DataBoardService;
import com.sist.databoard.dao.DataBoardVO;
import com.sist.databoard.dao.DataReplyVO;

import java.util.*;

import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.*;
@Controller
public class DataBoardController {
   @Autowired
   private DataBoardService service;
   @RequestMapping("main/board_list.do")
   public String board_list(String page,Model model)
   {
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   
	   Map map=new HashMap();
	   int rowSize=10;
	   int start=(rowSize*curpage)-(rowSize-1);
	   // 1=> 1~10  , 2=> 11~20
	   int end=rowSize*curpage;
	   // fromPage=(5*curpage/(5)-(5)) [1][2][3][4][5]
	   map.put("start", start);
	   map.put("end", end);
	   List<DataBoardVO> list=service.databoardListData(map);
	   for(DataBoardVO vo:list)
	   {
		   vo.setReplycount(service.replyCount(vo.getNo()));
	   }
	   model.addAttribute("list", list);
	   // curpage
	   int totalpage=service.databoardTotalPage();
	   // totalpage
	   model.addAttribute("curpage", curpage);
	   model.addAttribute("totalpage", totalpage);
	   model.addAttribute("main_jsp", "board/board_list.jsp");
	   return "main/main";
   }
   @RequestMapping("main/board_insert.do")
   public String board_insert(Model model)
   {
	   model.addAttribute("main_jsp", "board/board_insert.jsp");
	   return "main/main";
   }
   // insert,update(board_content),delete(board_list)
   @RequestMapping("main/board_insert_ok.do")
   public String board_insert_ok(DataBoardVO vo)
   {
	   List<MultipartFile> list=vo.getUpload();
	   if(list==null)
	   {
		   vo.setFilename("");
		   vo.setFilesize("");
		   vo.setFilecount(0);
	   }
	   else
	   {
		   String strName="";
		   String strSize="";
		   // a.jpg,b.jpg
		   for(MultipartFile mf:list)
		   {
			  try
			  {
			   String filename=mf.getOriginalFilename();
			   File file=new File("c:\\upload\\"+filename);
			   mf.transferTo(file);
			   int size=(int)file.length();
			   
			   strName+=filename+",";
			   strSize+=size+",";
			  }catch(Exception ex){}
		   }
		   vo.setFilename(strName.substring(0, strName.lastIndexOf(",")));
		   vo.setFilesize(strSize.substring(0, strSize.lastIndexOf(",")));
		   vo.setFilecount(list.size());
		   
		    
	   }
	   service.databoardInsert(vo);
	   return "redirect:/main/board_list.do";
   }
   @RequestMapping("main/board_content.do")
   public String board_content(int no,int page,Model model)
   {
	   DataBoardVO vo=service.databoardContentData(no);
	   if(vo.getFilecount()>0)
	   {
		   List<DataBoardFileVO> list=
				   new ArrayList<DataBoardFileVO>();
		   String[] fileArr=vo.getFilename().split(",");
		   String[] sizeArr=vo.getFilesize().split(",");
		   for(int i=0;i<fileArr.length;i++)
		   {
			   DataBoardFileVO fvo=
					   new DataBoardFileVO();
			   fvo.setFilename(fileArr[i]);
			   fvo.setFilesize(Long.parseLong(sizeArr[i]));
			   list.add(fvo);
		   }
		   vo.setFileList(list);
	   }
	   List<DataReplyVO> rList=service.replyListData(no);
	   model.addAttribute("rList", rList);
	   model.addAttribute("vo", vo);
	   model.addAttribute("page", page);
	   model.addAttribute("main_jsp", "board/board_content.jsp");
	   return "main/main";
   }
   @RequestMapping("main/board_download.do")
   public void board_download(String fn,HttpServletResponse res)
   {
	   //System.out.println("fn:"+fn);
	   try
	   {
		  res.setHeader("Content-Disposition", "attachment;filename="
				  +URLEncoder.encode(fn,"UTF-8"));
		  File file=new File("c:\\upload\\"+fn);
		  res.setContentLength((int)file.length());
		  
		  BufferedInputStream bis=
				new BufferedInputStream(new FileInputStream(file));
		  BufferedOutputStream bos=
				new BufferedOutputStream(res.getOutputStream());
		  int i=0;
		  byte[] buffer=new byte[1024];
		  while((i=bis.read(buffer, 0, 1024))!=-1)
		  {
			  bos.write(buffer, 0, i);
		  }
		  bis.close();
		  bos.close();
	   }catch(Exception ex){}
   }
   @RequestMapping("main/board_update.do")
   public String board_update(int no,int page,Model model)
   {
	   DataBoardVO vo=service.databoardUpdateData(no);
	   model.addAttribute("vo", vo);
	   model.addAttribute("page", page);
	   model.addAttribute("main_jsp", "board/board_update.jsp");
	   return "main/main";
   }
   @RequestMapping("main/board_update_ok.do")
   @ResponseBody
   public String board_update_ok(DataBoardVO vo,int page)
   {
	   boolean bCheck=false;
	   try
	   {
		   String pwd=service.databoardGetPwd(vo.getNo());
		   if(pwd.equals(vo.getPwd()))
		   {
			   bCheck=true;
			   List<MultipartFile> list=vo.getUpload();
			   DataBoardVO fvo=
					   service.databoardGetFileInfo(vo.getNo());
			   if(list==null)
			   {
				   vo.setFilename(fvo.getFilename());
				   vo.setFilesize(fvo.getFilesize());
				   vo.setFilecount(fvo.getFilecount());
			   }
			   else
			   {
				  if(fvo.getFilecount()>0)
				  {
					 String[] files=fvo.getFilename().split(","); 
					 for(String f:files)
					 {
						 File ff=new File("c:\\upload\\"+f);
						 ff.delete();
					 }
					
				  }
				   String strName="";
				   String strSize="";
				   // a.jpg,b.jpg
				   for(MultipartFile mf:list)
				   {
					  try
					  {
					   String filename=mf.getOriginalFilename();
					   File file=new File("c:\\upload\\"+filename);
					   mf.transferTo(file);
					   int size=(int)file.length();
					   
					   strName+=filename+",";
					   strSize+=size+",";
					  }catch(Exception ex){}
				   }
				   vo.setFilename(strName.substring(0, strName.lastIndexOf(",")));
				   vo.setFilesize(strSize.substring(0, strSize.lastIndexOf(",")));
				   vo.setFilecount(list.size());
				  
			   }
			   
			   service.databoardUpdate(vo);
		   }
		   else
		   {
			   bCheck=false;
		   }
	   }catch(Exception ex){}
	   
	   String send="";
	   // board_update_ok.jsp
	   if(bCheck==true)
	   {
		   send="<script>"
			   +"location.href=\"board_content.do?no="+vo.getNo()+"&page="+page+"\";"
			   +"</script>";
	   }
	   else
	   {
		   send="<script>"
			   +"alert(\"비밀번호가 틀립니다\");"
			   +"history.back();"
			   +"</script>";
	   }
	   return send;
   }
   @RequestMapping("main/board_delete.do")
   public String board_delete(int no,int page,Model model)
   {
	   model.addAttribute("no", no);
	   model.addAttribute("page", page);
	   return "main/board/board_delete";
   }
   @RequestMapping("main/board_delete_ok.do")
   public String board_delete_ok(int no,int page,String pwd,Model model)
   {
	   int res=0;
	   String db_pwd=service.databoardGetPwd(no);
	   if(db_pwd.equals(pwd))
	   {
		   // 파일 삭제
		   DataBoardVO vo=service.databoardGetFileInfo(no);
		   if(vo.getFilecount()>0)
		   {
			   try
			   {
				   String[] files=vo.getFilename().split(",");
				   for(String f:files)
				   {
					   File file=new File("c:\\upload\\"+f);
					   file.delete();
				   }
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
		   }
		   // 댓글
		   // 게시물 삭제
		   service.boardDelete(no);
		   res=1;
	   }
	   else
	   {
		   res=2;
	   }
	   model.addAttribute("res", res);
	   return "main/board/delete_result";
   }
}











