<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. �α׾ƿ������� ���. �α����ϼ���. �޼��� ���.
		�ٸ�������� ��й�ȣ ���� �Ұ�
		opener �������� loginForm.jsp ���������̵�. opener.location
		���������� �ݱ�
	2. pass,rpass1 �Ķ���� �� ����
	3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����
		��й�ȣ ���� �޼��� ���. passwordForm.jsp ������ �̵�
	4. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
		��й�ȣ ����
		opener �������� updateForm.jsp ������ �̵�.
		���������� �ݱ�
 --%>
<%
	String login = (String)session.getAttribute("login");	//2.
	String rpass = request.getParameter("rpass1"); //���� ��й�ȣ
	String msg = null;
	String url = null;
	MemberDao dao = new MemberDao(); 
	Member m = dao.selectOne(login); //id���´� ���� ��������
	if(login==null || login.equals("")){ %>
		<script>		// 1.
			alert("�α��� �ϼ���")
			opener.location.href="loginForm.jsp";
			self.close();
		</script>
<%	}else if(!m.getPass().equals(request.getParameter("p"))){	//3.
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		url = "passwordForm.jsp";
	}else{
		//m.setPass(rpass);
		int result = dao.passupdate(login,rpass);		// 4.
		if(result >0 ){ %>
			<script>
			alert("��й�ȣ ���� �Ϸ�, ��α��� �ϼ���")
			self.close();
			</script>
<%		}else{ %>
			<script>
			alert("��й�ȣ ���� ����")
			self.close();
			</script>
<%		} %>
<%	}
%>
<script>
	alert("<%=msg %>")
	location.href="<%=url %>"
	/*
	if(opener){
		
	}else if(closer){ //closer�� true�� self.close();
		self.close();
	}
	*/
</script>