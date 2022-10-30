<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 수정</title>
</head>
<body>
	<script type="text/javascript" src="mcheck.js"></script>
	<jsp:include page="header.jsp" />
	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">상품 정보 수정</h2>
		<br>
		<form method="post" action="m_action.jsp"
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="modify">
			<table border=1>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				String mod_pcode = request.getParameter("mod_pcode");
				String name = "";
				String cost = "";
				try {
					conn = Condb.getConnection();//DB 연결
					st = conn.createStatement();
					String sql = "select * from tbl_product_01 where pcode= " + mod_pcode;
					ResultSet rs = st.executeQuery(sql);
					rs.next();
					mod_pcode = rs.getString("pcode");
					name = rs.getString("name");
					cost = rs.getString("cost");
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pcode" value="<%=mod_pcode%>" readonly></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<td>가 격</td>
					<td><input type="text" name="cost" value="<%=cost%>"></td>
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
