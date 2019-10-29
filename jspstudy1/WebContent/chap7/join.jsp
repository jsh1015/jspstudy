<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="join" class="chap7.Member" />
	<jsp:setProperty property="*" name="join"/>
	<%-- join객체에 파라미터값이 전부 저장된 상태 --%>
	
	<table border="1" style="border-collapse;">
		<caption>회원가입 정보</caption>
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty property="id" name="join"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty property="pass" name="join"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="join"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<%--
			<td><%=join.getGender()==1?"남자":"여자" %></td>
			 --%>
			<td><jsp:getProperty property="gender2" name="join"/></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><jsp:getProperty property="age" name="join"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="join"/></td>
		</tr>
	</table>
</body>
</html>