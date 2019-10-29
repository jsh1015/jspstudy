<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function win_upload(){
		var op = "width=500, height=150, left=50, top=150";
		open("pictureForm.jsp","",op)
	}
</script>
</head>
<body>
	<form action="join.jsp" name="f" method="post">
		<input type="hidden" name="picture" value=""> <%--여기에 사진파일이름이 들어옴 --%>
		<table>
			<tr>
				<td rowspan="4" valign="bottom">
					<img src="" width="100" height="120" id="pic"><br>
					<font size="1">
					<a href="javascript:win_upload()">사진등록</a>
					</font>
				</td>
				<th>아이디</th><td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th><td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>이름</th><td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>성별</th><td><input type="radio" name="gender" value="1" checked>남
				<input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr>
				<th>전화번호</th><td colspan="2"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>이메일</th><td colspan="2"><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>