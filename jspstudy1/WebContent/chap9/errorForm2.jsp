<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	���1 : <%=100/10 %>
	���2 : <%=Integer.parseInt("ȫ�浿") %> <%-- NumberFormatException�� 500error�� �浹 --%>
	<%--
		error ������ ó�� �켱����
		1. �ش� ���������� ���������� ����
			<%@ page errorPage="...jsp" %>
		2. web.xml�� ������ ���� Ŭ���� ���� ������ �κ�
			���� Ŭ���� ������ ��Ű������ �����ؾ��Ѵ�.
			<exception-type>...NumberFormatException</exception-type>
		3. web.xml�� ������ ���� �ڵ庰�� ����
			<error-code>500</error-code>
		4. ��Ĺ(�������̳�)���� �⺻���� �����ϴ� ���������� 
	 --%>
</body>
</html>