<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>방명록 내용 보기</title>
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
	  <!-- 		  참조변수이름 -->
	<jsp:useBean id="book" class="chap7.Book" scope="page" /> <%--scope="page" : 사용범위 --%>
	<%--
		book.setWriter(request.getParameter("writer"));
		book.setTitle(request.getParameter("title"));
		....
		
		프로퍼티
			setProperty
			setXxx() => 프로퍼티는 (Xxx) 소문자로 인식 = xxx
			getProperty
			getXxx() => xxx
	 --%>
	 		<!-- 						위에있는 book을 다가져옴 -->
	<jsp:setProperty property="*" name="book" />
	
	<%-- book.setWriter(request.getParameter("name")) --%>
	<jsp:setProperty property="writer" name="book" param="name" />
	
	<table border="1" style="border-collapse:collapse;">
		<caption>방명록 조회</caption>
		<tr>
			<td>작성자</td>
			<%-- book.getWriter() 메서드 호출 --%>
			<td><jsp:getProperty property="writer" name="book"/>
			,<%=book.getWriter()%> </td>
		</tr>
		<tr>
			<td>제목</td>
			<%-- book.getTitle() 메서드 호출 --%>
			<td><jsp:getProperty property="title" name="book"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<%-- book.getContent() 메서드 호출 --%>
			<td><jsp:getProperty property="content" name="book"/></td>
		</tr>
	</table>
</body>
</html>