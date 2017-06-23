<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
  <center>
   <table id="table_content" width="800">
     <tr>
      <th>예약번호</th>
      <th>업체명</th>
      <th>주소</th>
      <th>전화</th>
      <th>예약일</th>
      <th>예약시간</th>
      <th>인원</th>
      <th>예약상황</th>
     </tr>
     <c:forEach var="vo" items="${list }">
      <tr>
	      <td>${vo.res_no }</td>
	      <td>${vo.fvo.name }</td>
	      <td>${vo.fvo.addr }</td>
	      <td>${vo.fvo.tel }</td>
	      <td>${vo.res_date }</td>
	      <td>${vo.res_time }</td>
	      <td>${vo.res_inwon }</td>
	      <td>${vo.res_state=='y'?"예약완료":"예약대기" }</td>
     </tr>
     </c:forEach>
   </table>
  </center>
</body>
</html>