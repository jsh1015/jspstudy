<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 파라미터 정보를 Member객체에 저장
	2. Member 객체를 DB에 저장 => Model 담당
	3. 회원가입성공 : loginForm.jsp 페이지 이동.
	      회원가입실패 : 화면에 '회원가입실패', joinForm.jsp 페이지 이동
	      			(아이디 중복)
 --%>
 <% request.setCharacterEncoding("euc-kr"); %>
 <jsp:useBean id="m" class="model.Member" />
 <jsp:setProperty name="m" property="*" />
 <%
 	MemberDao dao = new MemberDao();
 	int result = dao.insert(m);
 	String msg = null;
 	String url = null;
 	if(result > 0){ //insert 성공
 		msg = m.getName() + "님 회원 가입 완료";
 		url = "loginForm.jsp";
 	}else{ //실패
 		msg = "회원가입실패";
 		url = "joinFrom.jsp";
 	}
 %>
 <script>
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 </script>