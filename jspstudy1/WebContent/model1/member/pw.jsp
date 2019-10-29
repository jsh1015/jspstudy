<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호찾기</title>
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String pass = new MemberDao().pwselect(id, email, tel);
	if(pass==null||pass.equals("")){ %>
		<script>
		alert("정보에 맞는 비밀번호를 찾을 수 없습니다.")
		location.href="pwForm.jsp"
		</script>
	<% }else{
		String sendpw = "" ;
		for(int i=0; i<pass.length()/2; i++){
			sendpw += "*";
		}
		sendpw += pass.substring(pass.length()/2,pass.length());
	%>
</head>
<body>
	비밀번호 <%=sendpw %><br>
	<input type="button" value="닫기" onclick="self.close()">
</body>
</html>
<%}%>