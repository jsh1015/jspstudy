<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 원글의 num을 파라미터로 받는다.
	2. 원글의 num,grp,grplevel,grpstep 정보를 저장
	3. 입력화면표시
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답글 쓰기</title>
<link rel="stylesheet" href="../../css/main.css">
<%
	int num = Integer.parseInt(request.getParameter("num")); //원글에 대한 num값
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(num);
%>
</head>
<body>
	<form action="reply.jsp" method="post" name="f">
		<input type="hidden" name="num" value="<%=board.getNum()%>">
		<input type="hidden" name="grp" value="<%=board.getGrp()%>">
		<input type="hidden" name="grplevel" value="<%=board.getGrplevel()%>">
		<input type="hidden" name="grpstep" value="<%=board.getGrpstep()%>">
		<%-- 원글에 대한 정보들  --%>
		
		<table><caption>게시판 답글 등록</caption>
			<tr><th>글쓴이</th><td><input type="text" name="name"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
			<tr><th>제목</th><td><input type="text" name="subject" value="RE:<%=board.getSubject() %>"></td></tr>
			<tr><th>내용</th>
				<td><textarea name="content" rows="15"></textarea></td></tr>
			<tr><td colspan="2">
				<a href="javascript:document.f.submit()">[답변글등록]</a></td></tr>
		</table>
	</form>
</body>
</html>