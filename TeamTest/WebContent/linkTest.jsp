<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//String regex = "([\\p{Alnum}]+)://([a-z0-9.\\p{Punct}\\_]+)";
	
	String regex = "([\\p{Alnum}]+)://([a-z0-9.\\-&/%=?:@#$(),.+;~\\_]+)";
	String strHTML = "한글사랑 http://www.naver.com test-text";
	
	Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
	Matcher m = p.matcher(strHTML);
	String s = m.replaceAll("<a href='http://$2' target=_blank>http://$2</a>");
	System.out.println("origin string : "+strHTML);
	System.out.println("link string : "+s);

%>

<%=s %>
</body>
</html>