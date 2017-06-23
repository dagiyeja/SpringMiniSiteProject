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
	$('.res_gu').click(function(){
		var kind=$(this).attr("value");
		var gu=$(this).text();
		// attr("value","aaa") , text() , html() ,val() => getter
		// attr() , text("") , html('') ,val('') => setter
		$.ajax({
			type:'POST',
			url:'reserve_list.do',
			data:{"kind":kind,"addr":gu},
			success:function(response)
			{
				$('#list_view').html(response);
				$('#r_addr').text("주소:"+gu);
			}
		});
	});
});
</script>
</head>
<body>
  <center>
  <div style="overflow-y:auto;height:380px">
   <table id="table_content" width="135">
     <c:forEach var="gu" items="${list }">
       <tr class="dataTr">
        <td><span class="res_gu" value="${kind }">${gu }</span></td>
       </tr>
     </c:forEach>
   </table>
  </div>
  </center>
</body>
</html>


