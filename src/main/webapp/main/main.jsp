<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Company Name</title>
<link rel="stylesheet" type="text/css" href="style/style_sheet.css" media="screen" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		$('#log_frm').submit();
	});
    $('#logoutBtn').click(function(){
    	$('#logout_frm').submit();
	});
});
</script>
</head>

<body>

<div id="wrapper"><!--####  wrapper  ###-->

		<div id="top_strip"></div><!--top strip end-->
            
            
        <div id="header"><!--header--> 
        
       		         
       	  		<h1><a href="main.do">쌍용강북교육센터</a></h1>
       	  		<%--
       	  		   session.setAttribute("key","value")
       	  		   => session.getAttribute("key");
       	  		   ${sessionScope.key}
       	  		   
       	  		   request.setAttribute("no","10")
       	  		   ${requestScope.key}
       	  		   ${key}
       	  		 --%>
                <c:if test="${sessionScope.id==null }">
                   <form method="post" action="login.do" id="log_frm">
	                <div style="margin-left: 550px;font-size: 10px;color:white;">
	                 ID:<input type=text name=id size=12 id="id">
	                 &nbsp;
	                 PW:<input type=password name=pwd size=12 id="pwd">
	                 &nbsp;
	                 <input type=button value="로그인" id="loginBtn">
	                </div>
	               </form>
                </c:if>
                <c:if test="${sessionScope.id!=null }">
                   <form method="post" action="logout.do" id="logout_frm">
	                <div style="margin-left: 550px;font-size: 10px;color:white;">
	                 ${sessionScope.name }(${sessionScope.admin=='y'?"관리자":"일반사용자" })
	                                  님 로그인중입니다
	                 &nbsp;
	                 <input type=button value="로그아웃" id="logoutBtn">
	                </div>
	               </form>
                </c:if>
            
        </div><!--header end-->

    
    		      <div id="menu-top"><!--menu top-->
    
                        <div id="top_nav"><!--top nav--> 
                            
                                <ul>
                                   <li><a href="main.do">Home</a></li>
                                   <c:if test="${sessionScope.id==null }">
                                    <li><a href="join.do">회원가입</a></li>
                                   </c:if>
                                   <c:if test="${sessionScope.id!=null }">
                                    <li><a href="join_update.do">회원수정</a></li>
                                   </c:if>
                                   <li><a href="loc.do">지역별 맛집</a></li>
                                   <li><a href="best.do">베스트 맛집</a></li>
                                   <li><a href="board_list.do">커뮤니티</a></li>
                                   <li><a href="news.do">뉴스검색</a></li>
                                   <c:if test="${sessionScope.id!=null}">
                                     <li><a href="reserve.do">예약센터</a></li>
                                   </c:if>
                                   <c:if test="${sessionScope.id!=null}">
                                     <li><a href="mypage.do">마이페이지</a></li>
                                   </c:if>
                                   <c:if test="${sessionScope.id!=null && sessionScope.admin=='y'}">
                                     <li><a href="adminpage.do">예약현황</a></li>
                                   </c:if>
                                 </ul>
                                 
                           </div><!--top nav end--> 
                           
                           
                           <div id="search_area"><!--search box--> 
                           
                                  <form action="" method="get" id="form_search">
                                  
                                       
                                  </form>
                          
                           </div><!--search box end--> 
                           
            
				</div><!--menu top end-->   
        
        
        <div id="banner"><!--banner-->
        
        		 <img src="images/header1.jpg" alt="" width="940" height="280" />
        
  		</div><!--banner end-->
        
        
        <%--content --%>
        <jsp:include page="${main_jsp }"></jsp:include>
        
        <div class="clr"></div>
                  <div id="footer"><!--footer-->
        
        				<div id="footer_nav">
                
                                <ul>
                                   <li><a href="main.do">Home</a></li>
                                   <c:if test="${sessionScope.id==null }">
                                    <li><a href="join.do">회원가입</a></li>
                                   </c:if>
                                   <c:if test="${sessionScope.id!=null }">
                                    <li><a href="join_update.do">회원수정</a></li>
                                   </c:if>
                                   <li><a href="loc.do">지역별 맛집</a></li>
                                   <li><a href="best.do">베스트 맛집</a></li>
                                   <li><a href="board_list.do">커뮤니티</a></li>
                                   <li><a href="news.do">뉴스검색</a></li>
                                   <c:if test="${sessionScope.id!=null}">
                                     <li><a href="reserve.do">예약센터</a></li>
                                   </c:if>
                            
                                   <c:if test="${sessionScope.id!=null && sessionScope.admin=='y'}">
                                     <li><a href="reserve_config.do">예약현황</a></li>
                                   </c:if>
                                 </ul>
                
                		</div>
                        
       			 </div><!--footer end-->

        
        

<div class="clr"></div>
</div><!--####  wrapper  ###-->

</body>
</html>
