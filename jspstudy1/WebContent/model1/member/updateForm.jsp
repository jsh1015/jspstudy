<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. id 파라미터 조회
	2. login 정보 조회
		로그인 안된경우 : "로그인 하세요 " 메세지 출력. loginForm.jsp 페이지 이동
	3. 로그인 된 경우 : 로그인이 admin이 아니면서 다른사람의 정보를 조회하고자 할 때  
					"내 정보 수정만 가능합니다." 메세지 출력, main.jsp 페이지 이동
	4. id의 정보를 db에서 읽어서 Member 객체에 저장
	5. Member 객체를 화면에 출력.
--%>
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	
	if(login == null || login.trim().equals("")){ %>
		<script>
			alert("로그인 하세요")
			location.href="loginForm.jsp"
		</script>
<%	}else if(!login.equals("admin") && !login.equals(id)){ %>
		<script>
			alert("내 정보 수정만 가능합니다.")
			location.href="main.jsp"
		</script>	
<%	}else{
		Member info = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function win_upload(){
		var op = "width=500,height=150,left=50,top=150";
		open("pictureForm.jsp","",op)
	}
	
	function repass(){
		var op = "width=500, height=250, left=50, top=150"
		open("passwordForm.jsp?id=<%=id%>","",op)
	}
	
	function inputcheck(f){
		<% if(!login.equals("admin")) { %>
				if(f.pass.value==""){
					alert("비밀번호를 입력하세요")
					f.pass.focus()
					return false
				}
		<%}%>
	}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="<%=info.getPicture()%>">
	<table>
		<caption>회원정보수정</caption>
		<tr>
			<td rowspan="4" valign="bottom">
				<img src="picture/<%=info.getPicture() %>" width="100" height="120" id="pic"><br>
				<font size="1">
					<a href="javascript:win_upload()">사진수정</a>
				</font>
			</td>
			<th>아이디</th><td><input type="text" name="id" value="<%=info.getId()%>" readonly></td><%--읽어오는것만 가능 --%>
		</tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr> <%--비밀번호는 입력받음 --%>
		<tr><th>이름</th><td><input type="text" name="name" value="<%=info.getName()%>"></td></tr>
		<tr><th>성별</th><td>
			<input type="radio" name="gender" value="1" <%=info.getGender()==1?"checked":"" %>>남
			<input type="radio" name="gender" value="2" <%=info.getGender()==2?"checked":"" %>>여
			</td>
		</tr>
		<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel" value="<%=info.getTel()%>"></td></tr>
		<tr><th>이메일</th><td colspan="2"><input type="text" name="email" value="<%=info.getEmail()%>"></td></tr>
		<tr><td colspan="3"><input type="submit" value="회원수정"><input type="button" value="비밀번호수정" onclick="repass()"></td></tr>
	</table>
</form>
</body>
</html>
<%} %>