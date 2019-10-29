<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단한 select 조회</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String sql = request.getParameter("sql");
%>
	
<%-- form에 action 속성이 없는 경우 자신의 페이지를 다시 호출함. --%>
	<form method="post">
		<textarea cols="60" rows="5" name="sql"><%=(sql==null)?"":sql %></textarea>
		<input type="submit" value="실행">
	</form>

<%
	Connection conn = null;
	if(sql!=null && !sql.trim().equals("")){
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection
					("jdbc:mariadb://localhost:3306/classdb","scott","1234");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); //db에해당되는 내용을 가져옴(참조)
			ResultSetMetaData rsmt = rs.getMetaData();
			int num = rsmt.getColumnCount();
			String name = rsmt.getColumnName(1);
			PreparedStatement pstmt2 = conn.prepareStatement("select count(*) from (" + sql + ") a");
			ResultSet rs2 = pstmt2.executeQuery();
			rs2.next();
			int cnt = rs2.getInt(1); //첫번째 컬럼의 값
%>

	<table>
	<tr><td colspan="<%=num%>" style="text-align:right;">
	조회된 레코드 갯수: <%=cnt %></td></tr>
	<tr>
<%			for(int i=1;i<=num;i++){%>
				<th><%=rsmt.getColumnName(i) %></th>
<%			} %>
	</tr>
<%			while(rs.next()){ %><tr>
<%				for(int i=1;i<=num;i++) { %>
				<td><%=rs.getString(i) %></td>
		 		<%}
			}
		}catch(Exception e){ %>
		<h2> sql 구문 오류 입니다.<br>
			<%=e.getMessage() %><br>
		sql 구문 : <%=sql%></h2>
<%		}finally{
			conn.close();
		}
}%></tr>
</table>
</body>
</html>