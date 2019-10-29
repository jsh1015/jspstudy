<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String login = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴 비밀번호 입력 화면</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="id" value='<%=request.getParameter("id") %>'>
		<table>
			<caption>회원 비밀번호 입력</caption>
			<tr><th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr><td colspan="2">
				<input type="submit" value="탈퇴하기"></td></tr>
		</table>
	</form>
</body>
</html>