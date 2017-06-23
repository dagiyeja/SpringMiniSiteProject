<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// $('태그명') , $('ID'),$('class명'),$(내장객체) : SELECTOR
	/*
	        내장 객체  ==> 계층형
	        window 
	          |
	       docuement
	          |
	         form , location,history...
	         $('#h5')
	*/
	$('.h2').css("color","red");
	$('#h5').css("color","yellow");
	/* $('h2').click(function(){
		var data=$(this).html();
		alert(data);
	}); */
	$('h2').hover(function(){
		$(this).css("opacity",0.3);
	},function(){
		$(this).css("opacity",1);
	});
});
</script>
</head>
<body>
   <h2 class="h2"><span>Hello Jquery1</span></h2>
   <h2 class="h2">Hello Jquery2</h2>
   <h2 class="h3">Hello Jquery3</h2>
   <h2 class="h4">Hello Jquery4</h2>
   <h2 id="h5">Hello Jquery5</h2>
</body>
</html>



