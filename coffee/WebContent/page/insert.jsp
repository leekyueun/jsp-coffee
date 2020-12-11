<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function submit_form() {
        document.input_form.submit();
    }

    function reset_form() {
        document.input_form.reset()
    }
</script>
<form action="action/insert_action.jsp" method="post" name="input_form">
    <table border="1">
        <tr>
            <td>비번호</td>
            <td><input type="text" name="saleno" /></td>
        </tr>
        <tr>
            <td>상품코드</td>
            <td><input type="text" name="pcode" /></td>
        </tr>
        <tr>
            <td>판매날짜</td>
            <td><input type="date" name="saledate" /></td>
        </tr>
        <tr>
            <td>매장코드</td>
            <td><input type="text" name="scode"></td>
        </tr>
        <tr>
            <td>판매 수량</td>
            <td><input type="number" name="amount" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="등록" onclick="submit_form()">
                <input type="button" value="다시쓰기" onclick="reset_form()">
            </td>
        </tr>
    </table>
</form>
