<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css">
<link rel="stylesheet" type="text/css" href="style/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
});
$(function(){
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:"postfind.do",
			player:'iframe',
			title:'우편번호 검색',
			width:450,
			height:400
		});
	});
	$('#idcheckBtn').click(function(){
		Shadowbox.open({
			content:"idcheck.do",
			player:'iframe',
			title:'아이디중복체크',
			width:330,
			height:150
		});
	});
});
</script>
</head>
<body>
   <center>
     <h3>회원가입</h3>
     <form method=post action="join_ok.do" name="join_frm">
     <table border=1 width=700 cellpadding="0" cellspacing="0"
      bordercolor="black">
       <tr>
        <td>
         <table id="table_content" width=700>
          <tr>
           <th width=20% align=right>ID</th>
           <td width=80% align=left>
            <input type=text name=id size=12 required>
            <input type=button value="ID중복체크" id="idcheckBtn">
           </td>
          </tr>
          <tr>
           <th width=20% align=right>비밀번호</th>
           <td width=80% align=left>
            <input type=password name=pwd size=12 required>
            &nbsp;재입력<input type=password name=pwd2 size=12>
           </td>
          </tr>
          <tr>
           <th width=20% align=right>이름</th>
           <td width=80% align=left>
            <input type=text name=name size=12 required>
           </td>
          </tr>
          <tr>
           <th width=20% align=right>성별</th>
           <td width=80% align=left>
            <input type=radio name=sex value=남자 checked>남자
            <input type=radio name=sex value=여자>여자
           </td>
          </tr>
          <tr>
           <th width=20% align=right>생년월일</th>
           <td width=80% align=left>
            <input type=date name=bday size=20>
           </td>
          </tr>
          <tr>
           <th width=20% align=right>이메일</th>
           <td width=80% align=left>
            <input type=text name=email size=50 required>
           </td>
          </tr>
          <tr>
           <th width=20% align=right>우편번호</th>
           <td width=80% align=left>
            <input type=text name=post1 size=7 readonly required>-
            <input type=text name=post2 size=7 readonly required>
            <input type=button value="우편번호검색" id="postBtn">
           </td>
          </tr>
          <tr>
           <th width=20% align=right>주소</th>
           <td width=80% align=left>
            <input type=text name=addr1 size=50 readonly required>
           </td>
          </tr>
          <tr>
           <th width=20% align=right>상세주소</th>
           <td width=80% align=left>
            <input type=text name=addr2 size=50>
           </td>
          </tr>
          <tr>
           <th width=20% align=right>전화번호</th>
           <td width=80% align=left>
            <select name=tel1>
             <option>010</option>
             <option>011</option>
             <option>017</option>
            </select>
            <input type=text name=tel2 size=20>
           </td>
          </tr>
          <tr>
           <td colspan="2" align="center">
            <input type=submit value="가입">
            <input type=button value="취소" onclick="javascript:history.back()">
           </td>
          </tr>
         </table>
        </td>
       </tr>
     </table>
     </form>
   </center>
</body>
</html>







