<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%--
	1. id에 해당하는 정보를 db에서 조회
	2. 내용이 존재하면 비밀번호 검증
		-> db의 비밀번호와 입력된 비밀번호를 확인
		맞는 경우 : session 로그인 정보 등록. 확인 메세지 출력
		=> main.jsp   
		비밀번호가 틀린경우 : '비밀번호가 틀립니다' 메세지 출력
		=> login.jsp
	   id가 없으면 화면에 '아이디를 확인하세요' 메세지출력
	   => loginForm.jsp로 이동
 --%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//MemberDao 클래스 : Model 담당 클래스
	// Model : dbms와 연관있는 기능을 가진 클래스
	Member mem = new MemberDao().selectOne(id); //String타입 매개변수 하나
	if(mem != null){ //id가 존재
		if(pass.equals(mem.getPass())){ //비밀번호가 맞는 경우
		//	고객이입력한비밀번호  mem에있는 비밀번호
			session.setAttribute("login",id); //로그인 정보 등록
%>
			<script type="text/javascript">
			alert("<%=mem.getName()%>님이 로그인 하셨습니다.");
			location.href='main.jsp'; //내페이지로 이동
			</script>
<%		}else{ //비밀번호가 틀린경우 %>
			<script type="text/javascript">
				alert("비밀번호가 틀립니다.");
				location.href='loginForm.jsp';
			</script>
<%		}
	}else{ //id 없는 경우 %>
		<script type="text/javascript">
	 		alert('아이디를 확인하세요');
	 		location.href='loginForm.jsp';
		</script>		
<%	}
%>
</body>
</html>