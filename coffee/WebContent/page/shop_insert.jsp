<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script>
	function submit_form() {
        document.input_form.submit();
    }

    function reset_form() {
        document.input_form.reset()
    }
</script>
<form action="shop_insert.jsp" method="post" name="input_form">
    <table border="1">
        <tr>
            <td>매장코드</td>
            <td><input type="text" name="scode" /></td>
        </tr>
        <tr>
            <td>매장이름</td>
            <td><input type="text" name="sname" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="등록" onclick="submit_form()">
                <input type="button" value="다시쓰기" onclick="reset_form()">
            </td>
        </tr>
    </table>
</form>

<%
	request.setCharacterEncoding("utf-8");
	String scode = request.getParameter("scode");
	String sname = request.getParameter("sname");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "INSERT INTO TBL_SHOP_01(SCODE, SNAME)" +
						"VALUES('%s', '%s')";

		ResultSet rs = stmt.executeQuery(String.format(query, scode, sname));

		conn.commit();
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>