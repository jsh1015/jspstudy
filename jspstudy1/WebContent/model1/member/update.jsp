<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. ��� �Ķ���� Member ��ü�� ����
	2. �Էµ� ��й�ȣ��, db�� ����� ��й�ȣ�� ���� ������
		"��й�ȣ�� Ʋ�Ƚ��ϴ�." �޼��� �����, updateForm.jsp �������� �̵�
	3. ��й�ȣ �´� ��� 1���� ������ db�� �����ϱ�
		int MemberDao.update(Member )
		����� 0���� ũ�� �������� �޼��� ����ϰ�, info.jsp �������� �̵�
			 0���� ������ �������� �޼��� ����ϰ�, main.jsp�� ������ �̵�
 --%>
 	<% request.setCharacterEncoding("euc-kr"); %>
 	<%-- Member m = new Member(); --%>
	<jsp:useBean id="m" class="model.Member" /> <%-- 1. ��� �Ķ���� Member ��ü�� ���� --%>
	<%-- m.setId(request.getParameter("id"))  ��簪���� m�� ���
		....
	 --%>
	<jsp:setProperty name="m" property="*" />
<%
	String login = (String)session.getAttribute("login");
	MemberDao dao = new MemberDao();
	Member dbmem = dao.selectOne(m.getId()); //������ id������ ����
	String msg = null;
	String url = null;
	if(!login.equals("admin") && !dbmem.getPass().equals(m.getPass())){ //��й�ȣ
			//login�� admin������ ���� �����ؾ���
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url="updateForm.jsp?id="+ m.getId();
	}else{ 
		int result = dao.update(m);
		if(result > 0){ 
			msg = "��������";
			url= "info.jsp?id="+m.getId();
		}else{
			msg = "��������";
			url="main.jsp";
		}
	}
	%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>