<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매정보 수정</title>
</head>
<body>
	<script type="text/javascript" src="scheck.js"></script>
	<jsp:include page="header.jsp" />
	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">판매 정보 수정</h2>
		<br>
		<form method="post" action="s_action.jsp"
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="modify">
			<table border=1>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				String mod_saleno = request.getParameter("mod_saleno");
				String pcode = "";
				String scode = "";
				String amount = "";
				try {
					conn = Condb.getConnection();
					st = conn.createStatement();
					String sql = "select * from tbl_salelist_01 where saleno= " + mod_saleno;
					ResultSet rs = st.executeQuery(sql);
					rs.next();
					mod_saleno = rs.getString("saleno");
					pcode = rs.getString("pcode");
					scode = rs.getString("scode");
					amount = rs.getString("amount");
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<tr>
					<td>판매코드</td>
					<td><input type="text" name="saleno" value="<%=mod_saleno%>"
						readonly></td>
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pcode" value="<%=pcode%>"
						readonly></td>
				</tr>
				<tr>
					<td>매장코드</td>
					<td><input type="text" name="scode" value="<%=scode%>"
						readonly></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="amount" value="<%=amount%>"></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" value="수정"
						onclick="return modify()"> <input type="button" value="조회"
						onclick="return search()"></td>
				</tr>
			</table>
		</form>
	</section>

	<jsp:include page="footer.jsp" />
</body>
</html>