<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. num, pass 파라미터를 변수에 저장
	2. 입력된 비밀번호와 db 비밀번호 검증
		틀림경우 : 비밀번호 오류 메세지 출력, deleteForm.jsp 페이지 이동
	3. 비밀번호가 맞는 경우 : 게시물 삭제.
		삭제 성공 : 삭제 성공 메세지 출력, list.jsp 페이지 이동
		삭제 실패 : 삭제 실패 메세지 출력, info.jsp 페이지 이동
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	
	BoardDao dao = new BoardDao(); 
	Board b = dao.selectOne(num);
	if(b == null){ %>
		<script>
			alert("없는게시글입니다.")
			location.href="list.jsp"
		</script>	
<%	}else{
		if(pass.equals(b.getPass())){
			int result = dao.delete(num);
			if(result >0){ %>
				<script>
					alert("삭제성공")
					location.href="list.jsp"
				</script>
<%			}else{ %>
				<script>
					alert("삭제실패")
					location.href="info.jsp"
				</script>
<%			}
		}else{ %>
			<script>
				alert("비밀번호가 일치하지 않습니다.")
				location.href="deleteForm.jsp"
			</script>
<%		}
	}
%>
