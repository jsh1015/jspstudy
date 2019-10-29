<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. id �Ķ���Ͱ��� ��ȸ�ؿ;���.
	
	��ȿ�� ����
	2. �ݵ�� �α��� �Ǿ��� �־����. �α��� ���� ����.
		�α׾ƿ� ���� : '�α����� �ʿ��մϴ�.', loginForm.jsp�� �̵�
	3. �α��� ����  
		id�� ���� login�� ���� �ٸ� ��� �̸鼭 admin�� �ƴѰ��
			'�������� ��ȸ �����մϴ�.' �޼������. main.jsp �̵�
			
	4. �α��� O
		db���� id���� �ش��ϴ� �����͸� ��ȸ.(selectOne)
	5. ��ȸ�� ������ ȭ�鿡 ����ϱ�
--%>
<%
	String id = request.getParameter("id"); //��ȸ����� ȸ������
	// login ���� : ȸ�������� ��ȸ�ϴ� ����� ����
	String login = (String)session.getAttribute("login");
	if(login == null || login.trim().equals("")){ 	%>
		<script>
			alert("�α����� �ʿ��մϴ�.")
			location.href = "loginForm.jsp";
		</script>	
<%	}else if(!id.equals(login) && !login.equals("admin")){ %>
		<script>
			alert("�������� ��ȸ �����մϴ�.")
			location.href = "main.jsp";
		</script>
<%	}else{ //�������� ��ȸ
			Member info = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��������ȸ</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>ȸ�� ���� ����</caption>
		<tr><td rowspan="6">
			<img src="picture/<%=info.getPicture() %>" width="150" height="180"></td>
			<th>���̵�</th><td><%=info.getId() %></td></tr>
		<tr><th>�̸�</th><td><%=info.getName() %></td></tr>
		<tr><th>����</th><td><%=info.getGender()==1?"��":"��" %></td></tr>
		<tr><th>��ȭ</th><td><%=info.getTel() %></td></tr>
		<tr><th>�̸���</th><td><%=info.getEmail() %></td></tr>
		<tr><td colspan="2"><a href="updateForm.jsp?id=<%=info.getId()%>">[����]</a>
			<% if(!id.equals("admin") && !login.equals("admin")){ //admin�̾ƴѰ�� [Ż��]����%>
				<a href="deleteForm.jsp?id=<%=info.getId()%>">[Ż��]</a>
			<%} %>
			<a href="main.jsp">[������]</a>
		</td></tr>
	</table>
</body>
</html>
	<%}%>