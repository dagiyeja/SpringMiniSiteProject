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
<script type="text/javascript">
$(function(){
	$('#inwonBtn').click(function(){
		var s=$('#s').val();
		var b=$('#b').val();
		$('#r_inwon').text("����:"+s+"��,�Ƶ�:"+b+"��");
		$('#reserve_btn').show();
	});
});
</script>
</head>
<body>
  <center>
   <table id="table_content" width="275">
     <tr>
      <td>����:
        <select name="s" id="s">
          <c:forEach var="i" begin="1" end="10">
           <option value="${i}">${i}��</option>
          </c:forEach>
        </select>
      </td>
      <td>�Ƶ�:
         <select name="b" id="b">
          <c:forEach var="i" begin="1" end="10">
           <option value="${i}">${i}��</option>
          </c:forEach>
        </select>
      </td>
      <td align=center><input type=button id="inwonBtn" value="Ȯ��"></td>
     </tr>
   </table>
  </center>
</body>
</html>



