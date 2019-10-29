<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%--
	1. 파일업로드 => java
	2. opener 화면에 경과 전달 =>javascript
	3. 현재 화면 close() =>javascript
 --%>
 <%
 	String path = application.getRealPath("") + "model1/member/picture";
 	String fname = null;
 try{
 	File f = new File(path);
 		if(!f.exists()){//존재하지 않으면
 			f.mkdirs(); //폴더를 만듬
 		}
 	
 		MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
 		fname = multi.getFilesystemName("picture");
 	}catch(IOException e){
 		e.printStackTrace();
 	}
 %>
 <script type="text/javascript">
	img = opener.document.getElementById("pic"); //opener이미지에게 알려줌
	img.src = "picture/<%=fname%>";
	opener.document.f.picture.value="<%=fname%>"; //opener에 파라미터값으로 전달
	self.close();	
 </script>
<meta charset="EUC-KR">
