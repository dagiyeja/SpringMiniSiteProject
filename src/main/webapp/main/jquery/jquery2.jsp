<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i=0;
$(function(){
	$('#addBtn').click(function(){
		$('#tab').append('<tr id=f'+i+'>'
			+'<td width=20%>파일'+(i+1)+'</td>'
			+'<td width=80%>'
			+'<input type=file size=15>'
			+'</td></tr>');
		i=i+1;
	});
    $('#removeBtn').click(function(){
		$('#f'+(i-1)).remove();
		i=i-1;
	});
});
</script>
</head>
<body>
  <center>
    <table border=1 width=200>
     <tr>
      <td align=right>
       <input type=button value="추가" id="addBtn">
       <input type=button value="추가" id="removeBtn">
      </td>
     </tr>
    </table>
    <table border=1 width=200 id="tab">
     
    </table>
  </center>
</body>
</html>


