<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. �Ķ���� �������� Board ��ü ����.
	2. ��й�ȣ ����
		��й�ȣ ��ġ �ϴ� ��� ����
			�Ķ������ �������� �ش� �Խù��� ������ �����ϱ�
			÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� �����ϱ� 
		��й�ȣ ����ġ
			��й�ȣ ���� �޼��� ����ϰ�, updateForm.jsp�� ������ �̵�
	3. �������� : �������� �޼��� ��� �� info.jsp ������ �̵�
	      �������� : �������� �޼��� ��� �� updateForm.jsp ������ �̵�
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
	}//������ ���� ���� �ʾ������
	
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(b.getNum());
	
	msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
	url = "updateForm.jsp?num="+ b.getNum();
	if(b.getPass().equals(board.getPass())){
		if(dao.update(b)){
			msg = "��������";
			url = "info.jsp?num=" + b.getNum();
		}else{
			msg = "��������";
		}
	}	
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>