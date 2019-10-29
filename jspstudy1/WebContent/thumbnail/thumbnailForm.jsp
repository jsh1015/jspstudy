<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%-- thumbnail 이미지 예제 : 큰이미지를 작은 이미지로 생성. --%>
	<meta charset="EUC-KR">
	<title>원본이미지 올리기</title>
</head>
<body>
	<form action="thumbnail.jsp" method="post" enctype="multipart/form-data">
		원본이미지 : <input type="file" name="picture">
		<input type="submit" value="썸네일이미지생성">
	</form>
</body>
</html>