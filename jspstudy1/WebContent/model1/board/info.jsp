<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<%--
	1. num �Ķ���� ������ ������ ����. (�Խù���ȣ)
	2. num�� �̿��Ͽ� db���� �ش� �Խù� ������ ��ȸ
		Board b = new BoardDao.selectOne(num)
	3. ��ȸ�� ������Ű�� 
		void BoardDao.readcntadd(num)
	4. 2���� ��ȸ�� �Խù��� ȭ�鿡 ���
 --%>
<%
	int num = Integer.parseInt(request.getParameter("num")); //1
	Board b = new BoardDao().selectOne(num);//2
	new BoardDao().readcntadd(num);
%>
</head>
<body>
<table><caption>�Խù� �� ����</caption>
	<tr><th width="20%">�۾���</th>
		<td width="80%" style="text-align:left"><%=b.getName() %></td>
	</tr>
	<tr><th>����</th>
		<td style="text-align:left"><%=b.getSubject() %></td>
	</tr>
	<tr><th>����</th>
		<td>
			<table style="width:100%; height:250px;">
				<tr>
					<td style="border-width:0px; vertical-align:top; text-align:left">
						<%=b.getContent() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><th>÷������</th>
		<td><%if(b.getFile1()==null||b.getFile1().trim().equals("")){ %>
				&nbsp;		
			<%}else{%>
				<a href="file/<%=b.getFile1() %>"><%=b.getFile1()%></a>
			<%} %>
			</td></tr>
	<tr><td colspan="2">
		<a href="replyForm.jsp?num=<%=num %>">[�亯]</a>	
		<a href="updateForm.jsp?num=<%=num %>">[����]</a>
		<a href="deleteForm.jsp?num=<%=num %>">[����]</a>
		<a href="list.jsp">[���]</a>
		</td>
	</tr>
</table>
</body>
</html>