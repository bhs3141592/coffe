<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">상품 등록</h2>
		<br>
		<form method="post" action="m_action.jsp" name="m_frm"
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="insert">
			<table border=1>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				String pcode = "";
				try {
					conn = Condb.getConnection();//DB 연결
					st = conn.createStatement();
					String sql = "select max(pcode)+1 pcode from tbl_product_01";
					ResultSet rs = st.executeQuery(sql);
					rs.next(); //1개의 결과물 출력 
					pcode = rs.getString("pcode");
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<script type="text/javascript" src="mcheck.js"></script>
				<tr>
					<td>상품코드(자동발생)</td>
					<td><input type="text" name="pcode" value="<%=pcode%>"
						readonly></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>가 격</td>
					<td><input type="text" name="cost"></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" value="등록"
						onclick="return joinCheck()"> <input type="button"
						value="조회" onclick="return search()"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>