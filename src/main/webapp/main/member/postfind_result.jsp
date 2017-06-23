<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function ok(zip,addr)
{
	// 100-111
	parent.join_frm.post1.value=zip.substring(0,3);
	parent.join_frm.post2.value=zip.substring(4,7);
	parent.join_frm.addr1.value=addr;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
   <center>
   <c:if test="${count==0 }">
    <table id="table_content" width=430>
      <tr>
        <td align=center>검색결과가 없습니다</td>
      </tr>
    </table>
   </c:if>
   <c:if test="${count>0 }">
    <table id="table_content" width=430>
      <tr>
        <th width=15%>우편번호</th>
        <th width=85%>주소</th>
      </tr>
      <c:forEach var="vo" items="${list }">
        <tr class="dataTr">
         <td width="15%" align=center>${vo.zipcode }</td>
         <td width="85%" align=left>
          <a href="javascript:ok('${vo.zipcode }','${vo.address }')" class="post">${vo.address }</a>
         </td>
        </tr>
      </c:forEach>
    </table>
   </c:if>
   </center>
</body>
</html>




