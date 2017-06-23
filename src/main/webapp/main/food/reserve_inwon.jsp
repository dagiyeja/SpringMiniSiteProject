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
		$('#r_inwon').text("성인:"+s+"명,아동:"+b+"명");
		$('#reserve_btn').show();
	});
});
</script>
</head>
<body>
  <center>
   <table id="table_content" width="275">
     <tr>
      <td>성인:
        <select name="s" id="s">
          <c:forEach var="i" begin="1" end="10">
           <option value="${i}">${i}명</option>
          </c:forEach>
        </select>
      </td>
      <td>아동:
         <select name="b" id="b">
          <c:forEach var="i" begin="1" end="10">
           <option value="${i}">${i}명</option>
          </c:forEach>
        </select>
      </td>
      <td align=center><input type=button id="inwonBtn" value="확인"></td>
     </tr>
   </table>
  </center>
</body>
</html>



