<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
%>

<form action="insert_sale.jsp" method="post" name="input_form">
    <table border="1">
        <tr>
            <td>비번호</td>
            <td><input type="text" name="saleno" /></td>
        </tr>
        <tr>
            <td>상품코드</td>
            <td>
                <select name="pcode">
                    <%
                    String query = "select pcode, name from tbl_product_01";

                    ResultSet rs = stmt.executeQuery(query);
                    while(rs.next()) {
                        %> <option value="<%= rs.getString(1)%>"><%= rs.getString(2) %> <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>판매날짜</td>
            <td><input type="text" name="saledate" /></td>
        </tr>
        <tr>
            <td>매장코드</td>
            <td>
                <select name="scode">
                    <%
                    String query2 = "select scode, sname from tbl_shop_01";

                    ResultSet rs2 = stmt.executeQuery(query2);
                    while(rs.next()) {
                        %> <option value="<%= rs2.getString(1) %>"><%= rs2.getString(2) %> <%
                    }
                    %>
                </select>    
            </td>
        </tr>
        <tr>
            <td>판매수량</td>
            <td><input type="text" name="amount" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="상품 입력하기">
            </td>
        </tr>
    </table>
</form>
<%
    conn.commit();
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
    }
%>