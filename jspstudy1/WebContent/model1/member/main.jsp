<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 로그인 후에 보여지는 페이지
		=> 로그인이 안된 경우 => loginForm.jsp 페이지 이동하기
--%>
<%
	//로그인 여부 가져오기
	String login = (String)session.getAttribute("login");
	if(login == null || login.trim().equals("")){ //로그인 안함
		response.sendRedirect("loginForm.jsp"); //재요청
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
</head>
<body>
	<h3><%=login %>로 로그인 되었습니다.</h3>
	<h3><a href="logout.jsp">로그아웃</a></h3>
	<h3><a href="info.jsp?id=<%=login %>">회원정보보기</a></h3>
	<%
		if(login.equals("admin")) {%> <%-- 관리자로 로그인 --%>
		<h3><a href="list.jsp">회원목록보기</a></h3>
	<%	}
	}%>
</body>
</html>