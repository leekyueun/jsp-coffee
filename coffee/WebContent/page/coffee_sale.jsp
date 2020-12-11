<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<table border="1">
	<tr>
		<td>상품코드</td>
		<td>상품명</td>
		<td>상품별 판매액</td>
	</tr>
	<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "select " +
			    "product.pcode, product.name, " +
			    "sum(product.cost * salelist.amount) as total_cost " +
			"from " +
			    "tbl_product_01 product, " +
			    "tbl_shop_01 shop, " +
			    "tbl_salelist_01 salelist " +
			"where " +
			    "salelist.pcode = product.pcode and " +
			    "salelist.scode = shop.scode " +
			"group by " +
			    "product.pcode, product.name " +
			"order by " +
			    "pcode asc";

		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			String money = String.format("%,d", rs.getInt(3));
	%>
		<tr>
			<td> <%= rs.getString(1) %></td>
			<td> <%= rs.getString(2) %></td>
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