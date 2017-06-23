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
	$('.res_time').click(function(){
		
		var time=$(this).text();
		$.ajax({
			type:'POST',
			url:'reserve_inwon.do',
			success:function(response)
			{
				$("#inwon_view").html(response);
				$('#r_time').text("예약시간:"+time);
			}
		});
	});
});
</script>
</head>
<body>
  <center>
   <table id="table_content" width="450">
     <tr>
      <c:forEach var="time" items="${list }">
        <td><span class="res_time">${time }</span></td>
      </c:forEach>
     </tr>
   </table>
  </center>
</body>
</html>