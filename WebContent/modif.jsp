<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
    	Connection connection;
    	Statement statement;
    	ResultSet resultSet;
    
    	String name, id, pw, phone1, phone2, phone3, gender;
    %>
	<%
		id = (String)session.getAttribute("id");
		String query = "select * from members where id='"+id+"'";
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "hr" , "hr");
		statement = connection.createStatement();
		resultSet =  statement.executeQuery(query);
		
		while(resultSet.next()) {
			name = resultSet.getString("name");
			pw = resultSet.getString("pw");
			phone1 = resultSet.getString("phone1");
			phone2 = resultSet.getString("phone2");
			phone3 = resultSet.getString("phone3");
			gender = resultSet.getString("gender");
		
		}
	
	%>
	
	<form action="modifok" method="post">
	�̸�:<input type="text" name="name" value =<%=name %>><br/>
	���̵� : <%=id %><br/>
	��й�ȣ: <input type="text" name="pw"><br/>
	��ȭ��ȣ : <select name="phone1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="019">019</option>
			</select> 
			-<input type="text" name="phone2">
			-<input type="text" name="phone3"><br/>
	<%
	if(gender.equals("man")){
	
	%>
	�������� : <input type="radio" name="gender" value="man" checked="checked">��  &nbsp;<input type="radio" value="woman">��<br/>
	<% 
	} else{
	%>
		�������� : <input type="radio" name="gender" value="man">��  &nbsp;<input type="radio" value="woman" checked="checked">��<br/>
	<%} 
	
	%>
	<input type="submit" value="��������"><input type="reset" value="�ʱ�ȭ"> 
	</form>	
	

</body>
</html>