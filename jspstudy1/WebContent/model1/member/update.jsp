<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 모든 파라미터 Member 객체에 저장
	2. 입력된 비밀번호와, db에 저장된 비밀번호가 같지 않으면
		"비밀번호가 틀렸습니다." 메세지 출력후, updateForm.jsp 페이지로 이동
	3. 비밀번호 맞는 경우 1번에 내용을 db에 수정하기
		int MemberDao.update(Member )
		결과가 0보다 크면 수정성공 메세지 출력하고, info.jsp 페이지로 이동
			 0보다 작으면 수정실패 메세지 출력하고, main.jsp로 페이지 이동
 --%>
 	<% request.setCharacterEncoding("euc-kr"); %>
 	<%-- Member m = new Member(); --%>
	<jsp:useBean id="m" class="model.Member" /> <%-- 1. 모든 파라미터 Member 객체에 저장 --%>
	<%-- m.setId(request.getParameter("id"))  모든값들을 m에 등록
		....
	 --%>
	<jsp:setProperty name="m" property="*" />
<%
	String login = (String)session.getAttribute("login");
	MemberDao dao = new MemberDao();
	Member dbmem = dao.selectOne(m.getId()); //수정전 id에대한 정보
	String msg = null;
	String url = null;
	if(!login.equals("admin") && !dbmem.getPass().equals(m.getPass())){ //비밀번호
			//login이 admin인지를 먼저 실행해야함
			msg = "비밀번호가 틀렸습니다.";
			url="updateForm.jsp?id="+ m.getId();
	}else{ 
		int result = dao.update(m);
		if(result > 0){ 
			msg = "수정성공";
			url= "info.jsp?id="+m.getId();
		}else{
			msg = "수정실패";
			url="main.jsp";
		}
	}
	%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>