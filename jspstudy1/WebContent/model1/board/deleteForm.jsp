<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 삭제 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function back(){
		location.href="info.jsp?num=" + "<%=request.getParameter("num") %>"
	}
</script>
</head>
<body>
<form action="delete.jsp" name="f" method="post">
	<input type="hidden" name="num" value="<%=request.getParameter("num") %>">
	<table>
		<caption>게시글 삭제 화면</caption>
		<tr><th>게시글비밀번호</th>
			<td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="게시글삭제">
			<input type="button" value="취소" onclick="back()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>