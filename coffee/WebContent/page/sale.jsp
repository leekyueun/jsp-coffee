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
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "select " +
			    "salelist.saleno, salelist.pcode, TO_CHAR(SALELIST.SALEDATE, 'yyyy-MM-dd'), " +
			    "salelist.scode, product.name, salelist.amount, " +
			    "sum(product.cost * salelist.amount) as  total_cost " +
			"from " +
			    "tbl_product_01 product, " +
			    "tbl_shop_01 shop, " +
			    "tbl_salelist_01 salelist " +
			"where " +
			    "salelist.pcode = product.pcode and " +
			    "salelist.scode = shop.scode " +
			"group by " +
			    "product.pcode, salelist.saleno, product.name, salelist.pcode, salelist.saledate, " +
			    "salelist.scode, salelist.amount " +
			"order by " +
			    "salelist.saleno ASC";

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