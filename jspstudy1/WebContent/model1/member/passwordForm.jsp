<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>패스워드변경</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function inchk(check){	//변경비밀번호 일치여부
		if(f.rpass1.value != f.rpass2.value){
			alert("변경 비밀번호가 일치하지 않습니다.")
			f.rpass2.value=""
			f.rpass2.focus()
			return false
		}
		return true
	}
</script>
</head>
<body>
	<form action="password.jsp" method="post" name="f" onsubmit="return inchk(this)">
	<table>
		<caption>비밀번호 변경</caption>
		<tr><th>현재 비밀번호</th><td><input type="password" name="p"></td></tr>
		<tr><th>변경 비밀번호</th><td><input type="password" name="rpass1"></td></tr>
		<tr><th>변경 비밀번호 재입력</th><td><input type="password" name="rpass2"></td></tr>
		<tr><td colspan="2"><input type="submit" value="비밀번호 변경"></td></tr>
	</table>
	</form>
</body>
</html>