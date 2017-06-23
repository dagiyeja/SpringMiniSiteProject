<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#select_image img').click(function(){
		var kind=$(this).attr('value');
		//alert(kind);
		$.ajax({
			type:'POST',
			url:"reserve_gu_find.do",
			data:{"kind":kind},
			success:function(response)
			{
				$('#gu_view').html(response);
			}
		});
	});
	$('#rbtn').click(function(){
		var no=$('#r_name').attr("value");
		var day=$('#r_day').text();
		var time=$('#r_time').text();
		var inwon=$('#r_inwon').text();
		var json={"house_no":no,"res_date":day,
				"res_time":time,"res_inwon":inwon};
		$.ajax({
			type:'POST',
			url:"reserve_insert.do",
			data:json,
			success:function(response)
			{
				//location.href="mypage.do?id="+resonse;
				alert(response);
				location.href="mypage.do";
			}
		});
		
	});
});
</script>
</head>
<body>
	        <div id="news_area">
	        <center>
            <table id="table_content" width=850>
             <tr>
              <td align=left>
               <div id="select_image">
               <%--
                  $('img')
                  $('#select_image img')'
                --%>
                <img src="food_image/han.png" value="한식">
                <img src="food_image/chong.png" value="중식">
                <img src="food_image/yang.png" value="양식">
                <img src="food_image/il.png" value="일식">
               </div>
              </td>
             </tr>
            </table>
            <table id="table_content" width=900 height=500>
              <tr>
                <td width=15% height=400 valign="top">
                 <table id="table_content" width=135>
                  <tr>
                   <th>맛집지역</th>
                  </tr>
                 </table>
                 <div id="gu_view"></div>
                </td>
                <td width=35% height=400 valign="top">
                 <table id="table_content" width=315>
                  <tr>
                   <th>맛집목록</th>
                  </tr>
                 </table>
                 <div id="list_view"></div>
                </td>
                <td width=30% height=400 valign="top">
                 <table id="table_content" width=270>
                  <tr>
                   <th>예약일</th>
                  </tr>
                 </table>
                 <div id="reserve_date"></div>
                </td>
                <td rowspan="2" width=20% valign="top">
                  <table id="table_content" width=180>
                  <tr>
                   <th>예약정보</th>
                  </tr>
                 </table>
                 <table id="table_content" width="180">
                   <tr>
                    <td id="r_poster">
                      <img src="#" width=160 height=120 id="rp">
                    </td>
                   </tr>
                   <tr>
                    <td id="r_name" value="">
                                          업체명:
                    </td>
                   </tr>
                   <tr>
                    <td id="r_addr">
                                           주소:
                    </td>
                   </tr>
                   <tr>
                    <td id="r_day">
                                          예약일:
                    </td>
                   </tr>
                   <tr>
                    <td id="r_time">
                                          예약시간:
                    </td>
                   </tr>
                   <tr>
                    <td id="r_inwon">
                                           성인:,아동:
                    </td>
                   </tr>
                   <tr id="reserve_btn" style="display:none">
                    <td align=center>
                      <input type="button"
                        value="예약하기" id="rbtn">
                    </td>
                   </tr>
                 </table>
                </td>
              </tr>
              <tr>
                <td colspan="2" height=100 valign="top">
                  <table id="table_content" width=450>
                  <tr>
                   <th>시간정보</th>
                  </tr>
                 </table>
                 <div id="time_view"></div>
                </td>
                <td width=30% height=100 valign="top">
                  <table id="table_content" width=270>
                  <tr>
                   <th>인원정보</th>
                  </tr>
                 </table>
                 <div id="inwon_view"></div>
                </td>
              </tr>
            </table>
            </center>
            <div class="clr"></div>
                           
        </div>
</body>
</html>



