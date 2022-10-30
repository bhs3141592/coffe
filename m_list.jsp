<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록조회</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">상품목록 조회/수정</h2>
		<br>
		<form
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<table border=1>
				<tr>
					<td>상품코드</td>
					<td>상품명</td>
					<td>가 격</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				try {
					conn = Condb.getConnection();
					st = conn.createStatement();
					String sql = "select * from tbl_product_01 order by pcode";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr>
					<td><a
						href="m_modify.jsp?mod_pcode=<%=rs.getString("pcode")%>"><%=rs.getString("pcode")%></a></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("cost")%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>

	<jsp:include page="footer.jsp" />
</body>
</html>