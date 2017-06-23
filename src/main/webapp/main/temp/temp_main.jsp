<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:["iframe"]
});
$(function(){
	$('#btn').click(function(){
		//window.open("temp_input.jsp","ti","width=300,height=300");
		Shadowbox.open({
			content:"temp_input.jsp",
			player:"iframe",
			title:"ID중복체크",
			width:300,
			height:300
		});
	});
});
</script>
</head>
<body>
  <input type="button" value="ID체크" id="btn">
</body>
</html>



