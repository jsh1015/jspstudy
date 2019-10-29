<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 파라미터 값을 Board 객체에 저장하기
		원글정보 : num,grp,grplevel,grpstep
		답글정보 : name,pass,subject,content = 등록한정보
	2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기  = 답글 밑에 들어갈수 있게
		void BoardDao.grpStepAdd(grp, grpstep) 같은그룹이면서 원글보다 숫자가 큰애들 +1
	3. Board 객체를 db에 insert 하기
		 num : maxnum + 1
		 grp : 원글과 동일
		 grplevel : 원글 + 1
		 grpstep : 원글 + 1
		 num grp grplevel grpstep
		 15	  15     0       0
		 
	4. 등록 성공시 : "답변등록완료" 메세지 출력후, list.jsp로 페이지 이동
	      등록 실패시 : "답변등록시 오류발생" 메세지 출력후, replyForm.jsp로 페이지 이동하기
 --%>
 	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="b" class="model.Board"/>
	<jsp:setProperty name="b" property="*"/>
<%
	BoardDao dao = new BoardDao();
	//2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기
	dao.grpStepAdd(b.getGrp(), b.getGrpstep());
	//3. Board 객체를 db에 insert 하기
	int grplevel = b.getGrplevel();
	int grpstep = b.getGrpstep();
	int num = dao.maxnum();
	String msg = "답변등록시 오류발생";
	String url = "replyFrom.jsp?num="+b.getNum();
	b.setNum(++num);
	b.setGrplevel(grplevel +1);
	b.setGrpstep(grpstep + 1);
	if(dao.insert(b)){
		msg="답변등록완료";
		url="list.jsp";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>