<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 로그아웃상태인 경우. 로그인하세요. 메세지 출력.
		다른사용자의 비밀번호 변경 불가
		opener 페이지를 loginForm.jsp 페이지로이동. opener.location
		현재페이지 닫기
	2. pass,rpass1 파라미터 값 저장
	3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면
		비밀번호 오류 메세지 출력. passwordForm.jsp 페이지 이동
	4. pass 비밀번호가 db에 저장된 비밀번호와 같으면
		비밀번호 수정
		opener 페이지를 updateForm.jsp 페이지 이동.
		현재페이지 닫기
 --%>
<%
	String login = (String)session.getAttribute("login");	//2.
	String rpass = request.getParameter("rpass1"); //변경 비밀번호
	String msg = null;
	String url = null;
	MemberDao dao = new MemberDao(); 
	Member m = dao.selectOne(login); //id에맞는 정보 가져오기
	if(login==null || login.equals("")){ %>
		<script>		// 1.
			alert("로그인 하세요")
			opener.location.href="loginForm.jsp";
			self.close();
		</script>
<%	}else if(!m.getPass().equals(request.getParameter("p"))){	//3.
		msg = "비밀번호가 틀렸습니다.";
		url = "passwordForm.jsp";
	}else{
		//m.setPass(rpass);
		int result = dao.passupdate(login,rpass);		// 4.
		if(result >0 ){ %>
			<script>
			alert("비밀번호 변경 완료, 재로그인 하세요")
			self.close();
			</script>
<%		}else{ %>
			<script>
			alert("비밀번호 변경 실패")
			self.close();
			</script>
<%		} %>
<%	}
%>
<script>
	alert("<%=msg %>")
	location.href="<%=url %>"
	/*
	if(opener){
		
	}else if(closer){ //closer가 true면 self.close();
		self.close();
	}
	*/
</script>