<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%--
	1. num ���� �Խù��� db���� ��ȸ�Ͽ� ȭ�� ����ϱ�
 --%>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value=""; //�⺻�� �ִ� ������ ���ֹ���
		file_desc.style.display="none"; //div�� �ƿ� ������ �ʰ�(���� �����ʹ� ������ ����)
	}
</script>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	Board b = new BoardDao().selectOne(num); //num���ش��ϴ� �Խù��� DB���� �����ϰ��ִ� ��ü
%>
<form action="update.jsp?num=<%=num %>" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="<%=b.getNum()%>">
	<input type="hidden" name="file2" value="<%=b.getFile1()==null?"":b.getFile1() %>"><%--�������� �̹����� �������� ���� --%>
	<table><caption>�Խ��� ���� ȭ��</caption>
		<tr>
			<th>�۾���</th>
			<td><input type="text" name="name" value="<%=b.getName()%>"></td>
		</tr>
		<tr>
			<th>��й�ȣ</th>
			<td><input type="password" name="pass"></td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type="text" name="subject" value="<%=b.getSubject() %>"></td>
		</tr>
		<tr>
			<th>����</th>
			<td><textarea rows="15" name="content"><%=b.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<th>÷������</th>
			<td style="text-align:left">
				<% if(b.getFile1() != null && (!b.getFile1().equals(""))){ %>
					<div id="file_desc"><%=b.getFile1() %>
					<a href="javascript:file_delete()">[÷������ ����]</a></div>
				<% }%>
					<input type="file" name="file1"></td>
		</tr>
		<tr><th colspan="2">
			<a href="javascript:document.f.submit()" style="color:black;">[�Խù�����]</a></th>
		</tr>
	</table>
</form>
</body>
</html>