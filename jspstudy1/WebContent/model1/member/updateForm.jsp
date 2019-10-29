<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. id �Ķ���� ��ȸ
	2. login ���� ��ȸ
		�α��� �ȵȰ�� : "�α��� �ϼ��� " �޼��� ���. loginForm.jsp ������ �̵�
	3. �α��� �� ��� : �α����� admin�� �ƴϸ鼭 �ٸ������ ������ ��ȸ�ϰ��� �� ��  
					"�� ���� ������ �����մϴ�." �޼��� ���, main.jsp ������ �̵�
	4. id�� ������ db���� �о Member ��ü�� ����
	5. Member ��ü�� ȭ�鿡 ���.
--%>
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	
	if(login == null || login.trim().equals("")){ %>
		<script>
			alert("�α��� �ϼ���")
			location.href="loginForm.jsp"
		</script>
<%	}else if(!login.equals("admin") && !login.equals(id)){ %>
		<script>
			alert("�� ���� ������ �����մϴ�.")
			location.href="main.jsp"
		</script>	
<%	}else{
		Member info = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function win_upload(){
		var op = "width=500,height=150,left=50,top=150";
		open("pictureForm.jsp","",op)
	}
	
	function repass(){
		var op = "width=500, height=250, left=50, top=150"
		open("passwordForm.jsp?id=<%=id%>","",op)
	}
	
	function inputcheck(f){
		<% if(!login.equals("admin")) { %>
				if(f.pass.value==""){
					alert("��й�ȣ�� �Է��ϼ���")
					f.pass.focus()
					return false
				}
		<%}%>
	}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="<%=info.getPicture()%>">
	<table>
		<caption>ȸ����������</caption>
		<tr>
			<td rowspan="4" valign="bottom">
				<img src="picture/<%=info.getPicture() %>" width="100" height="120" id="pic"><br>
				<font size="1">
					<a href="javascript:win_upload()">��������</a>
				</font>
			</td>
			<th>���̵�</th><td><input type="text" name="id" value="<%=info.getId()%>" readonly></td><%--�о���°͸� ���� --%>
		</tr>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr> <%--��й�ȣ�� �Է¹��� --%>
		<tr><th>�̸�</th><td><input type="text" name="name" value="<%=info.getName()%>"></td></tr>
		<tr><th>����</th><td>
			<input type="radio" name="gender" value="1" <%=info.getGender()==1?"checked":"" %>>��
			<input type="radio" name="gender" value="2" <%=info.getGender()==2?"checked":"" %>>��
			</td>
		</tr>
		<tr><th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel" value="<%=info.getTel()%>"></td></tr>
		<tr><th>�̸���</th><td colspan="2"><input type="text" name="email" value="<%=info.getEmail()%>"></td></tr>
		<tr><td colspan="3"><input type="submit" value="ȸ������"><input type="button" value="��й�ȣ����" onclick="repass()"></td></tr>
	</table>
</form>
</body>
</html>
<%} %>