<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣã��</title>
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String pass = new MemberDao().pwselect(id, email, tel);
	if(pass==null||pass.equals("")){ %>
		<script>
		alert("������ �´� ��й�ȣ�� ã�� �� �����ϴ�.")
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
	��й�ȣ <%=sendpw %><br>
	<input type="button" value="�ݱ�" onclick="self.close()">
</body>
</html>
<%}%>