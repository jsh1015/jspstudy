<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>요청페이지 없음</title>
	<style type="text/css">
		h1{color:red;}
	</style>
</head>
<body>
	<h1>요청하신 페이지는 존재하지 않습니다.</h1>
	<h2>URL 주소가 올바른지 확인해 주세요</h2>
	<h3>요청 URL : <%=request.getRequestURL() %></h3>
</body>
</html>