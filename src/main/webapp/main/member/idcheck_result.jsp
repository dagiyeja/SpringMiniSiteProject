<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/table.css">
<script type="text/javascript">
$(function(){
	$('#okBtn').click(function(){
		parent.join_frm.id.value=$('#id').val();
		parent.Shadowbox.close();
	});
});
</script>
</head>
<body>
  <center>
   <table id="table_content" width=300>
    <c:if test="${count==0 }">
     <tr>
      <td align=center>
       <font color=yellow>
        ${id }는(은) 사용가능합니다
       </font>
      </td>
     </tr>
     <tr>
      <td align=center>
       <input type=button value="확인" id="okBtn">
      </td>
     </tr>
    </c:if>
    <c:if test="${count!=0 }">
      <tr>
      <td align=center>
       <font color=blue>
        ${id }는(은) 이미 사용중입니다
       </font>
      </td>
     </tr>
    </c:if>
   </table>
  </center>
</body>
</html>



