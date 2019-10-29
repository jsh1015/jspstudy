<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	 request.setCharacterEncoding("euc-kr");
	 String email = request.getParameter("email");
	 String tel = request.getParameter("tel");
	 String id = new MemberDao().idselect(email, tel); 
	 if(id==null ||id.equals("")){ %>
	  <script>
		   alert('정보에 맞는 id를 찾을 수 없습니다.')
		   location.href="idForm.jsp"
	  </script>
	<% }else{
		  String send = id.substring(0,id.length()/2+1);
		  for(int i=id.length()/2+1;i<id.length();i++){
			   send += "*";
		  }
	  %>
<!DOCTYPE html>
<html>
<head>
<title>id찾기</title>
<script>
	 function send(){
		  opener.document.f.id.value="<%=id.substring(0,id.length()/2+1) %>"
		  self.close()
	 }
</script>
</head>
<body>
	<table>
	  <tr><td>ID : <%=send %></td></tr>
	  <tr><td><input type="button" value="아이디전송" onclick="send()"></td></tr>
	</table>
</body>
</html>
<%}%>