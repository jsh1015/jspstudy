<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 로그아웃 상태 : "로그인하세요" 메세지출력, loginForm.jsp 페이지이동
	2. 로그인 상태
		유효성검증
		- 관리자가 아니고, id와 login이 다른 경우
			"본인 탈퇴만 가능합니다." 메세지출력, main.jsp 이동
		- id가 관리자 아이디인 경우
			"관리자는 탈퇴가 불가능합니다." list.jsp 페이지이동
		- 일반사용자
			1) 아이디,비밀번호 정보를 파라미터로 전송
			2) 비밀번호 불일치 =>입력된 번호와 db에 저장된 비밀번호 검증 
				"비밀번호가 틀립니다." deleteForm.jsp 로 이동
		- 관리자
			1) 아이디 정보를 파라미터로 전송
	3. 관리자로 로그인 되어있거나, 비밀번호 일치하는 경우 MemberDao.delete()
		삭제성공 : 일반사용자 : 메세지 출력, 로그아웃 후, loginForm.jsp로 이동
				관리자 : 탈퇴메세지 출력. list.jsp 페이지 이동
		삭제실패 : 일반사용자 : 삭제실패 메세지 출력. info.jsp 페이지 이동
				관리자 : 삭제실패 메세지 출력. list.jsp로 이동
--%>
<%
	String login = (String)session.getAttribute("login");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String msg = null;
	String url = null;
	if(login==null || login.trim().equals("")){ //로그아웃상태
		msg = "로그인하세요";
		url = "loginForm.jsp";
	}else if(id.equals("admin")){ //로그인 했는데 삭제하려는 아이디가 admin일때
			msg = "관리자는 탈퇴가 불가능합니다.";
			url = "list.jsp";
	}else if(!login.equals("admin") && !login.equals(id)){ 
			//admin으로 들어온게 아니고 login과 id가 다를때
			msg = "본인 탈퇴만 가능합니다.";
			url = "main.jsp";
	}else{ //나머지 로그인된 상태
		MemberDao dao = new MemberDao();
		Member m = dao.selectOne(id);
		if(login.equals("admin") || pass.equals(m.getPass())){
			//관리자이거나, 비밀번호가 일치했을때 ****순서가 바뀌면 안됨
			int result = dao.delete(id);
			if(result > 0){
				if(login.equals("admin")){
					msg = id + "사용자 강제 탈퇴 완료";
					url = "list.jsp";
				}else{
					msg = id + "님의 회원탈퇴가 완료되었습니다.";
					url = "loginForm.jsp";
					session.invalidate(); //session종료
				}
			}else{
				msg = id + "님의 탈퇴 오류 발생";
				if(login.equals("admin")){
					url = "list.jsp";
				}else{
					url = "info.jsp?id=" + id;
				}
			}
		}else{
			msg = id + "님의 비밀번호가 틀립니다.";
			url ="deleteForm.jsp?id=" +id;
		}
	}
%>
<script>
	alert("<%=msg %>")
	location.href="<%=url %>"
</script>
