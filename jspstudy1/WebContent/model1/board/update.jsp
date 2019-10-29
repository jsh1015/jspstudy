<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 파라미터 정보들을 Board 객체 저장.
	2. 비밀번호 검증
		비밀번호 일치 하는 경우 수정
			파라미터의 내용으로 해당 게시물의 내용을 수정하기
			첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 다시 저장하기 
		비밀번호 불일치
			비밀번호 오류 메세지 출력하고, updateForm.jsp로 페이지 이동
	3. 수정성공 : 수정성공 메세지 출력 후 info.jsp 페이지 이동
	      수정실패 : 수정실패 메세지 출력 후 updateForm.jsp 페이지 이동
 --%>
<%
	String msg = null;
	String url = null;
	Board b = new Board();
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
	b.setNum(Integer.parseInt(multi.getParameter("num")));
	b.setName(multi.getParameter("name"));
	b.setPass(multi.getParameter("pass"));
	b.setSubject(multi.getParameter("subject"));
	b.setContent(multi.getParameter("content"));
	b.setFile1(multi.getFilesystemName("file1"));
	
	if(b.getFile1()==null || b.getFile1().equals("")){
		b.setFile1(multi.getParameter("file2"));
	}//파일이 변경 되지 않았을경우
	
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(b.getNum());
	
	msg = "비밀번호가 일치하지 않습니다.";
	url = "updateForm.jsp?num="+ b.getNum();
	if(b.getPass().equals(board.getPass())){
		if(dao.update(b)){
			msg = "수정성공";
			url = "info.jsp?num=" + b.getNum();
		}else{
			msg = "수정실패";
		}
	}	
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>