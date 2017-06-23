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
	$('.img_click').click(function(){
		var no=$(this).attr("value");
		var d1=$(this).attr("data1");
		var d2=$(this).attr("data2");
		$.ajax({
			type:'POST',
			url:'reserve_date.do',
			data:{"no":no},
			success:function(response)
			{
				$('#reserve_date').html(response);
				$('#cap_no').attr("value",no);
				$('#rp').attr("src",d1);
				$('#r_name').text("업체명:"+d2);
				$('#r_name').attr("value",no);
			}
		});
	});
});
</script>
</head>
<body>
  <center>
  <div style="overflow-y:auto;height:380px">
   <table id="table_content" width="315">
     <c:forEach var="vo" items="${list }">
       <tr>
        <td rowspan="3" align=center width=30%>
         <a href="#" value="${vo.no }" class="img_click" 
          data1="food_image/big_${vo.poster }"
          data2="${vo.name}">
         <img src="food_image/big_${vo.poster }" width=70 height=100></a>
        </td>
        <td colspan="2" align=center>${vo.name }</td>
       </tr>
       <tr>
        <td width=15% align=right>주소</td>
        <td width=55% align=left>${vo.addr }</td>
       </tr>
       <tr>
        <td width=15% align=right>전화</td>
        <td width=55% align=left>${vo.tel }</td>
       </tr>
       <tr>
        <td colspan="3" width=315><hr></td>
       </tr>
     </c:forEach>
   </table>
  </div>
  </center>
</body>
</html>
