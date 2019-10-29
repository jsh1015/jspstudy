<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
<%--
<link rel="stylesheet" href="../../css/main.css">

	http://localhost:8080/jspstudy1/model1/member/loginForm.jsp
	.. : 상위폴더
	jspstudy1/model1/member/loginForm.jsp
	../../css/main.css : 상대경로 방식
	/jspstudy1/css/main.css : 절대경로 방식
 --%>
<script>
	function click_id(){
		var op = "width=500, height=150, left=50, top=150";
		open("idForm.jsp","",op)
	}
	function click_pass(){
		var op = "width=500, height=250, left=50, top=150";
		open("pwForm.jsp","",op)
	}
	/*function win_open(page){
		var op = "width=500, height=250, left=50, top=150";
		open(page+".jsp","",op)
	}*/
</script>
</head>
<body>
<form action="login.jsp" method="post" name="f">
	<table>
		<caption>로그인</caption>
		<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입"
					onclick="location.href='joinForm.jsp'">
				<input type="button" value="아이디" onclick="click_id()">
				<input type="button" value="비밀번호찾기" onclick="click_pass()">
			</td></tr>
	</table>
</form>
</body>
</html>