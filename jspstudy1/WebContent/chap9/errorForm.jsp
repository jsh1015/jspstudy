<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page errorPage="error.jsp" %> 
<%-- 현재페이지에서 (예외)오류발생시 바로 오류메세지를 보내는게아니라 error.jsp로 이동하라. --%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>예외 발생 페이지</title>
</head>
<body>
	<%=request.getParameter("name").trim() %> <%--NullPointexception < error.jsp --%> 
	<%--null값에.trim()을 할 수 없음 (에러강제발생)--%>
</body>
</html>