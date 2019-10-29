<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. �α׾ƿ� ���� : "�α����ϼ���" �޼������, loginForm.jsp �������̵�
	2. �α��� ����
		��ȿ������
		- �����ڰ� �ƴϰ�, id�� login�� �ٸ� ���
			"���� Ż�� �����մϴ�." �޼������, main.jsp �̵�
		- id�� ������ ���̵��� ���
			"�����ڴ� Ż�� �Ұ����մϴ�." list.jsp �������̵�
		- �Ϲݻ����
			1) ���̵�,��й�ȣ ������ �Ķ���ͷ� ����
			2) ��й�ȣ ����ġ =>�Էµ� ��ȣ�� db�� ����� ��й�ȣ ���� 
				"��й�ȣ�� Ʋ���ϴ�." deleteForm.jsp �� �̵�
		- ������
			1) ���̵� ������ �Ķ���ͷ� ����
	3. �����ڷ� �α��� �Ǿ��ְų�, ��й�ȣ ��ġ�ϴ� ��� MemberDao.delete()
		�������� : �Ϲݻ���� : �޼��� ���, �α׾ƿ� ��, loginForm.jsp�� �̵�
				������ : Ż��޼��� ���. list.jsp ������ �̵�
		�������� : �Ϲݻ���� : �������� �޼��� ���. info.jsp ������ �̵�
				������ : �������� �޼��� ���. list.jsp�� �̵�
--%>
<%
	String login = (String)session.getAttribute("login");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String msg = null;
	String url = null;
	if(login==null || login.trim().equals("")){ //�α׾ƿ�����
		msg = "�α����ϼ���";
		url = "loginForm.jsp";
	}else if(id.equals("admin")){ //�α��� �ߴµ� �����Ϸ��� ���̵� admin�϶�
			msg = "�����ڴ� Ż�� �Ұ����մϴ�.";
			url = "list.jsp";
	}else if(!login.equals("admin") && !login.equals(id)){ 
			//admin���� ���°� �ƴϰ� login�� id�� �ٸ���
			msg = "���� Ż�� �����մϴ�.";
			url = "main.jsp";
	}else{ //������ �α��ε� ����
		MemberDao dao = new MemberDao();
		Member m = dao.selectOne(id);
		if(login.equals("admin") || pass.equals(m.getPass())){
			//�������̰ų�, ��й�ȣ�� ��ġ������ ****������ �ٲ�� �ȵ�
			int result = dao.delete(id);
			if(result > 0){
				if(login.equals("admin")){
					msg = id + "����� ���� Ż�� �Ϸ�";
					url = "list.jsp";
				}else{
					msg = id + "���� ȸ��Ż�� �Ϸ�Ǿ����ϴ�.";
					url = "loginForm.jsp";
					session.invalidate(); //session����
				}
			}else{
				msg = id + "���� Ż�� ���� �߻�";
				if(login.equals("admin")){
					url = "list.jsp";
				}else{
					url = "info.jsp?id=" + id;
				}
			}
		}else{
			msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
			url ="deleteForm.jsp?id=" +id;
		}
	}
%>
<script>
	alert("<%=msg %>")
	location.href="<%=url %>"
</script>
