<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page errorPage="error.jsp" %> 
<%-- �������������� (����)�����߻��� �ٷ� �����޼����� �����°Ծƴ϶� error.jsp�� �̵��϶�. --%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>���� �߻� ������</title>
</head>
<body>
	<%=request.getParameter("name").trim() %> <%--NullPointexception < error.jsp --%> 
	<%--null����.trim()�� �� �� ���� (���������߻�)--%>
</body>
</html>