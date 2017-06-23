<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *   jquery : javascript라이브러리 (DOMSCRIPT)
     =======
    	 DOM => 태그를 제어하는 프로그램 
    	 1)selector 
 */
$(function(){
	var offset = $(".mytable").offset();
    $('html, body').animate({scrollTop : offset.top}, 100);
	$('.mytable').fadeIn("slow");
  });
</script>
</head>
<body>
   <center>
     <h3>게시판 목록</h3>
     <table id="table_content" width=700>
      <tr>
       <td align=left>
        <a href="board_insert.do">새글</a>
       </td>
      </tr>
     </table>
     <table id="table_content" width=700 class="mytable">
       <tr>
        <th width=10%>번호</th>
        <th width=45%>제목</th>
        <th width=15%>이름</th>
        <th width=20%>작성일</th>
        <th width=10%>조회수</th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr class="dataTr">
          <td width=10% align=center>${vo.no }</td>
          <td width=45%>
           <a href="board_content.do?no=${vo.no }&page=${curpage}">
            ${vo.subject }</a>
            <c:if test="${vo.replycount>0 }">
             (${vo.replycount})
            </c:if>
          </td>
          <td width=15% align=center>${vo.name }</td>
          <td width=20% align=center>
           <fmt:formatDate value="${vo.regdate }" 
            pattern="yyyy-MM-dd"
           />
          </td>
          <td width=10% align=center>${vo.hit }</td>
         </tr>
       </c:forEach>
     </table>
     <table border=0 width=700>
       <tr>
        <td align=left>
        
        </td>
        <td align=right>
        
        </td>
       </tr>
     </table>
   </center>
</body>
</html>






