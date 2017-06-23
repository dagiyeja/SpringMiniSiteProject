package com.sist.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.member.dao.MemberDAO;
import com.sist.member.dao.MemberVO;
import com.sist.member.dao.ZipcodeVO;
/*
 *   XML 
 *   Annotation
 *   MVC
 *   ORM
 *   DI
 *   AOP
 */
@Controller
public class MemberController {
   @Autowired
   private MemberDAO dao;
   @RequestMapping("main/join.do")
   public String member_join(Model model)
   {
	   model.addAttribute("main_jsp", "member/join.jsp");
	   return "main/main";
   }
   @RequestMapping("main/join_ok.do")
   public String member_join_ok(MemberVO vo,Model model)
   {
	   vo.setPost(vo.getPost1()+"-"+vo.getPost2());
	   vo.setTel(vo.getTel1()+"-"+vo.getTel2());
	   dao.memberInsert(vo);
	   model.addAttribute("main_jsp", "member/join_ok.jsp");
	   return "main/main";
   }
   @RequestMapping("main/postfind.do")
   public String member_postfind()
   {
	   return "main/member/postfind";
   }
   @RequestMapping("main/postfind_result.do")
   public String member_postfind_result(String dong,Model model)
   {
	   System.out.println("dong="+dong);
	   List<ZipcodeVO> list=dao.zipcodeListData(dong);
	   model.addAttribute("list", list);
	   model.addAttribute("count", list.size());
	   return "main/member/postfind_result";
   }
   @RequestMapping("main/idcheck.do")
   public String member_idcheck()
   {
	   return "main/member/idcheck";
   }
   @RequestMapping("main/idcheck_result.do")
   public String member_idcheck_result(String id,Model model)
   {
	   int count=dao.memberIdcheck(id);
	   model.addAttribute("count", count);
	   model.addAttribute("id", id);
	   return "main/member/idcheck_result";
   }
   
   @RequestMapping("main/login.do")
   public String member_login(String id,String pwd,HttpSession session,Model model)
   {
	   int count=dao.memberIdcheck(id);
	   String res="";
	   if(count==0)
	   {
		   res="NOID";
	   }
	   else
	   {
		   String db_pwd=dao.memberGetPwd(id);
		   if(pwd.equals(db_pwd))
		   {
			   res="OK";
			   MemberVO vo=dao.memberInfoData(id);
			   session.setAttribute("id", vo.getId());
			   session.setAttribute("name", vo.getName());
			   session.setAttribute("admin", vo.getAdmin());
			   //session.setMaxInactiveInterval(1800);
			   
			   /*
			    *   request.getSession()
			    *   
			    *   session : ������ ������� �Ϲ� ������ ���� 
			    *   ���� 
			    *     session.setAttribute()
			    *   �� ������ ���� ��� 
			    *     session.getAttribute()
			    *   ���� 
			    *     session.removeAttribute()
			    *             invalidate()
			    *   �Ⱓ ���� 
			    *      setMaxInactiveInterval
			    *   session ==> �������� 1���� ���� 
			    */
		   }
		   else
		   {
			   res="NOPWD";
		   }
	   }
	   model.addAttribute("res", res);
	   return "main/member/login";
   }
   @RequestMapping("main/logout.do")
   public String member_logout(HttpSession session)
   {
	   /*
	    *   1) ��ü  invalidate
	    *   2) �κ�(��ٱ���) removeAttribute(key)
	    */
	   session.invalidate();
	   return "redirect:/main/main.do";
   }
   
}







