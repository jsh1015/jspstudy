<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
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
		<caption>�Խñ� ���� ȭ��</caption>
		<tr><th>�Խñۺ�й�ȣ</th>
			<td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="�Խñۻ���">
			<input type="button" value="���" onclick="back()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>