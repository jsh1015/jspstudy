<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. num, pass �Ķ���͸� ������ ����
	2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
		Ʋ����� : ��й�ȣ ���� �޼��� ���, deleteForm.jsp ������ �̵�
	3. ��й�ȣ�� �´� ��� : �Խù� ����.
		���� ���� : ���� ���� �޼��� ���, list.jsp ������ �̵�
		���� ���� : ���� ���� �޼��� ���, info.jsp ������ �̵�
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	
	BoardDao dao = new BoardDao(); 
	Board b = dao.selectOne(num);
	if(b == null){ %>
		<script>
			alert("���°Խñ��Դϴ�.")
			location.href="list.jsp"
		</script>	
<%	}else{
		if(pass.equals(b.getPass())){
			int result = dao.delete(num);
			if(result >0){ %>
				<script>
					alert("��������")
					location.href="list.jsp"
				</script>
<%			}else{ %>
				<script>
					alert("��������")
					location.href="info.jsp"
				</script>
<%			}
		}else{ %>
			<script>
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
				location.href="deleteForm.jsp"
			</script>
<%		}
	}
%>
