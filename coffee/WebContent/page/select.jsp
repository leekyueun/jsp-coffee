<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<table border="1">
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총판매액</td>
	</tr>
	<%
	String filter_mssage = request.getParameter("filter_mssage");
	String query_column = request.getParameter("query_column");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "select " +
						"saleno, product.pcode, sale.saledate, shop.scode, product.name, sale.amount " +
						"from tbl_product_01 product, tbl_salelist_01 sale, tbl_shop_01 shop " +
						"where " +
							"product.pcode = sale.pcode and " +
							"shop.scode = sale.scode";
		
		if (filter_mssage != null && filter_mssage.length() != 0) {
			query += String.format(" and %s = '%s'", query_column, filter_mssage);
		}
		out.println(query);

		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			String money = String.format("%,d", rs.getInt(7));
	%>
		<tr>
			<td> <%= rs.getInt(1) %></td>
			<td> <%= rs.getString(2) %></td>
			<td> <%= rs.getString(3) %></td>
			<td> <%= rs.getString(4) %></td>
			<td> <%= rs.getString(5) %></td>
			<td> <%= rs.getInt(6) %></td>
			<td> <%= money %></td>
		</tr>
	<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>

<table border="1">
	<form action="select.jsp">
		<select name="query_column">
			<option value="saleno">비번호</option>
			<option value="product.pcode">상품코드</option>
			<option value="shop.scode">매장코드</option>
			<option value="product.name">상품명</option>
			<option value="sale.amount">판매수량</option>	
			<option value="total_cost">총판매액</option>
		</select>
		<input type="text" name="filter_mssage">
		<input type="submit">
	</form>
</table>