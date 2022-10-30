<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장목록조회</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">매장목록 조회/수정</h2>
		<br>
		<form
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<table border=1>
				<tr>
					<td>매장코드</td>
					<td>매장이름</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				try {
					conn = Condb.getConnection();
					st = conn.createStatement();
					String sql = "select * from tbl_shop_01 order by scode";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr>
					<td><a
						href="b_modify.jsp?mod_scode=<%=rs.getString("scode")%>"><%=rs.getString("scode")%></a></td>
					<td><%=rs.getString("sname")%></td>
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