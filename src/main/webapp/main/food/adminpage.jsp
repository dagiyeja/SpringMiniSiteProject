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
  <form method=post action="adminpage_ok.do">
   <table id="table_content" width="800">
   	<tr>
   		<td align=left>
   		<input type="submit" value="���οϷ�">
   		</td>
   	</tr>
   </table>
   <table id="table_content" width="800">
     <tr>
      <th></th>
      <th>�����ȣ</th>
      <th>��ü��</th>
      <th>�ּ�</th>
      <th>��ȭ</th>
      <th>������</th>
      <th>����ð�</th>
      <th>�ο�</th>
      <th>�����Ȳ</th>
     </tr>
     <c:forEach var="vo" items="${list }">
      <tr>
      	 <td>
      	 	<c:if test="${vo.res_state=='n' }">
      	 		<input type="checkbox" name="res_ck" value="${vo.res_no }">
      	 	</c:if>
      	 </td>
	      <td>${vo.res_no }</td>
	      <td>${vo.fvo.name }</td>
	      <td>${vo.fvo.tel }</td>
	      <td>${vo.res_date }</td>
	      <td>${vo.res_time }</td>
	      <td>${vo.res_inwon }</td>
	      <td>${vo.res_state=='y'?"���οϷ�":"���δ��" }</td>
     </tr>
     </c:forEach>
   </table>
   </form>
  </center>
</body>
</html>