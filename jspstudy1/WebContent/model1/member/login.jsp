<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%--
	1. id�� �ش��ϴ� ������ db���� ��ȸ
	2. ������ �����ϸ� ��й�ȣ ����
		-> db�� ��й�ȣ�� �Էµ� ��й�ȣ�� Ȯ��
		�´� ��� : session �α��� ���� ���. Ȯ�� �޼��� ���
		=> main.jsp   
		��й�ȣ�� Ʋ����� : '��й�ȣ�� Ʋ���ϴ�' �޼��� ���
		=> login.jsp
	   id�� ������ ȭ�鿡 '���̵� Ȯ���ϼ���' �޼������
	   => loginForm.jsp�� �̵�
 --%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//MemberDao Ŭ���� : Model ��� Ŭ����
	// Model : dbms�� �����ִ� ����� ���� Ŭ����
	Member mem = new MemberDao().selectOne(id); //StringŸ�� �Ű����� �ϳ�
	if(mem != null){ //id�� ����
		if(pass.equals(mem.getPass())){ //��й�ȣ�� �´� ���
		//	�����Է��Ѻ�й�ȣ  mem���ִ� ��й�ȣ
			session.setAttribute("login",id); //�α��� ���� ���
%>
			<script type="text/javascript">
			alert("<%=mem.getName()%>���� �α��� �ϼ̽��ϴ�.");
			location.href='main.jsp'; //���������� �̵�
			</script>
<%		}else{ //��й�ȣ�� Ʋ����� %>
			<script type="text/javascript">
				alert("��й�ȣ�� Ʋ���ϴ�.");
				location.href='loginForm.jsp';
			</script>
<%		}
	}else{ //id ���� ��� %>
		<script type="text/javascript">
	 		alert('���̵� Ȯ���ϼ���');
	 		location.href='loginForm.jsp';
		</script>		
<%	}
%>
</body>
</html>