<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "INSERT INTO TBL_SALELIST_01(saleno, pcode, saledate, scode, amount)" +
						"VALUES('%s', '%s', '%S', '%S', '%d')";

		ResultSet rs = stmt.executeQuery(String.format(query, saleno, pcode, saledate, scode, amount));

		conn.commit();
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>