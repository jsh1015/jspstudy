<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>���� ���� ����</title>
</head>
<body>
	<% request.setCharacterEncoding("euc-kr"); %>
	<%--
		String writer = request.getParameter("writer");
	 --%>
	 <%--
	 	1. Book book = new Book();
	 	2. pageContext.setAttribute("book",book);
	 	
	  --%>
	  <!-- 		  ���������̸� -->
	<jsp:useBean id="book" class="chap7.Book" scope="page" /> <%--scope="page" : ������ --%>
	<%--
		book.setWriter(request.getParameter("writer"));
		book.setTitle(request.getParameter("title"));
		....
		
		������Ƽ
			setProperty
			setXxx() => ������Ƽ�� (Xxx) �ҹ��ڷ� �ν� = xxx
			getProperty
			getXxx() => xxx
	 --%>
	 		<!-- 						�����ִ� book�� �ٰ����� -->
	<jsp:setProperty property="*" name="book" />
	
	<%-- book.setWriter(request.getParameter("name")) --%>
	<jsp:setProperty property="writer" name="book" param="name" />
	
	<table border="1" style="border-collapse:collapse;">
		<caption>���� ��ȸ</caption>
		<tr>
			<td>�ۼ���</td>
			<%-- book.getWriter() �޼��� ȣ�� --%>
			<td><jsp:getProperty property="writer" name="book"/>
			,<%=book.getWriter()%> </td>
		</tr>
		<tr>
			<td>����</td>
			<%-- book.getTitle() �޼��� ȣ�� --%>
			<td><jsp:getProperty property="title" name="book"/></td>
		</tr>
		<tr>
			<td>����</td>
			<%-- book.getContent() �޼��� ȣ�� --%>
			<td><jsp:getProperty property="content" name="book"/></td>
		</tr>
	</table>
</body>
</html>