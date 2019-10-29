<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. �Ķ���� ���� Board ��ü�� �����ϱ�
		�������� : num,grp,grplevel,grpstep
		������� : name,pass,subject,content = ���������
	2. ���� grp ���� ����ϴ� �Խù����� grpstep ���� 1 �����ϱ�  = ��� �ؿ� ���� �ְ�
		void BoardDao.grpStepAdd(grp, grpstep) �����׷��̸鼭 ���ۺ��� ���ڰ� ū�ֵ� +1
	3. Board ��ü�� db�� insert �ϱ�
		 num : maxnum + 1
		 grp : ���۰� ����
		 grplevel : ���� + 1
		 grpstep : ���� + 1
		 num grp grplevel grpstep
		 15	  15     0       0
		 
	4. ��� ������ : "�亯��ϿϷ�" �޼��� �����, list.jsp�� ������ �̵�
	      ��� ���н� : "�亯��Ͻ� �����߻�" �޼��� �����, replyForm.jsp�� ������ �̵��ϱ�
 --%>
 	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="b" class="model.Board"/>
	<jsp:setProperty name="b" property="*"/>
<%
	BoardDao dao = new BoardDao();
	//2. ���� grp ���� ����ϴ� �Խù����� grpstep ���� 1 �����ϱ�
	dao.grpStepAdd(b.getGrp(), b.getGrpstep());
	//3. Board ��ü�� db�� insert �ϱ�
	int grplevel = b.getGrplevel();
	int grpstep = b.getGrpstep();
	int num = dao.maxnum();
	String msg = "�亯��Ͻ� �����߻�";
	String url = "replyFrom.jsp?num="+b.getNum();
	b.setNum(++num);
	b.setGrplevel(grplevel +1);
	b.setGrpstep(grpstep + 1);
	if(dao.insert(b)){
		msg="�亯��ϿϷ�";
		url="list.jsp";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>