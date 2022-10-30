<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매목록조회</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">판매목록 조회/수정</h2>
		<br>
		<form
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<table border=1>
				<tr>
					<td>판매코드</td>
					<td>상품코드</td>
					<td>상품명</td>
					<td>가격</td>
					<td>매장코드</td>
					<td>매장이름</td>
					<td>수량</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				try {
					conn = Condb.getConnection();
					st = conn.createStatement();
					String sql = "select S.saleno, S.pcode, S.scode, S.amount," + "M.pcode,M.name,M.cost," + "B.scode,B.sname "
					+ "from tbl_salelist_01 S " + "inner join tbl_product_01 M " + "on S.pcode=M.pcode "
					+ "inner join tbl_shop_01 B " + "on S.scode=B.scode " + "order by saleno";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr>
					<td><a
						href="s_modify.jsp?mod_saleno=<%=rs.getString("saleno")%>"><%=rs.getString("saleno")%></a></td>
					<td><%=rs.getString("pcode")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("cost")%></td>
					<td><%=rs.getString("scode")%></td>
					<td><%=rs.getString("sname")%></td>
					<td><%=rs.getString("amount")%></td>
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