<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 한페이지당 10건의 게시물을 출력하기.
		pageNum 파라미터값을 저장 1-1페이지 =>없는경우는 1로 설정하기.
	2. 최근 등록된 게시물을 가장 위에 배치함.(List형태)
	3. 화면에 출력.
		게시물 출력부분
		페이지구분 출력부분
 --%>
<%
	// http://localhost:8080/jspstudy1/model1/board/list.jsp
	// 	  웹서버,브라우저(포트번호) was	WebContent
	int pageNum = 1;
	try{
		pageNum = Integer.parseInt(request.getParameter("pageNum")); //안들어오면 1페이지 들어오면 그페이지로인식
	}catch(NumberFormatException e){} //NumberFormatException 아무것도하지 않음.
	int limit = 10; //한페이지에 출력할 게시물 건수
	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount();	//등록된 전체 게시물의 건수
	List<Board> list = dao.list(pageNum,limit); 
	//화면에 출력된 게시물 데이터, 페이지에 해당하는 게시물들을 가져옴
	
	/*
		maxpage : 총페이지 갯수
			전체게시물건수 : 21건 => 3페이지
				ex)
				21.0/10 + 0.95 = 3.05 => 3
				20.0/10 + 0.95 = 2.95 => 2
				29.0/10 + 0.95 = 3.85 => 3
	*/
	int maxpage = (int)((double)boardcount/limit + 0.95);//등록된 게시물/10 +0.95
	/*
		startpage : 화면에 표시될 첫번째 페이지 [1][2]...[10]
			pageNum : 2 => 1
			(2/10.0 + 0.9) => ((int)(1.1) -1)*10+1 = 1
			(10/10.0 + 0.9) => ((int)(1.9) -1)*10+1 = 1
			(11/10.0 + 0.9) => ((int)(2.0) -1)*10+1 = 11
	*/
	int startpage = ((int)(pageNum/10.0 + 0.9)-1) *10 +1; //시작페이지 번
	
	//	endpage : [1][2]...[10] 의 끝
	int endpage = startpage + 9;
	if(endpage > maxpage) endpage = maxpage;
	int boardnum = boardcount -(pageNum-1)*limit;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table><caption>게시판 목록</caption>
	<% if(boardcount == 0){ //등록된 게시글이 없을때 %> 
		<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
	<%}else{ //게시물 있을때 %>
		<tr><td colspan="5" style="text-align:right">글개수:<%=boardcount %></td></tr>
		<tr><th width="8%">번호</th><th width="50%">제목</th>
			<th width="14%">작성자</th><th width="17%">등록일</th>
			<th width="11%">조회수</th>
		</tr>
		<% for(Board b :list){ %>
			<tr><td>
					<%=boardnum-- %></td><td style="text-align:left">
					<% if(b.getFile1()!=null && !b.getFile1().trim().equals("")){ %>
						<a href="file/<%=b.getFile1()%>" style="text-decoration:none;">@</a>
					<%}else{%>&nbsp;&nbsp;&nbsp;<%} %>
					
					<a href="info.jsp?num=<%=b.getNum() %>">
						<% int level = b.getGrplevel();
						if(level >0){
							for(int i=1;i<level;i++){ %>
								&nbsp;&nbsp;&nbsp;
							<%}%> └
						<%} %>
						<%=b.getSubject() %></a></td>
				<td><%=b.getName() %></td><td><%=b.getRegdate() %></td>
				<td><%=b.getReadcnt() %></td>
			</tr>
		<%} %> <!-- for구문 끝 --> 
		<tr><td colspan="5">
			<% if(pageNum <= 1){%>
					[이전] 
			<%}else{ //이전페이지가 없을때. %>
				<a href="list.jsp?pageNum=<%=pageNum -1 %>">[이전]</a>
			<%} %>
			<% for(int a=startpage; a<=endpage; a++) { %>
					<% if(a==pageNum){ 
							%>[<%=a %>] 
					<%}else{ %>
						<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
					<%}
			} %>
			<% if(pageNum >= maxpage){ 
						%>[다음]<%
			} else{ %>
					<a href="list.jsp?pageNum=<%=pageNum +1 %>">[다음]</a><% 
			}%>
		</td></tr>
	<%} %><!-- else 구문 끝 -->
	<tr><td colspan="5" style="text-align:right">
		<a href="writeForm.jsp">[글쓰기]</a></td>
	</tr> 
	</table>
</body>
</html>