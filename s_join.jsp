<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">판매 등록</h2>
		<br>
		<form method="post" action="s_action.jsp" name="s_frm"
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="insert">
			<table border=1>
				<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement st = null;
				String saleno = "";
				try {
					conn = Condb.getConnection();//DB 연결
					st = conn.createStatement();
					String sql = "select max(saleno)+1 saleno from tbl_salelist_01";
					ResultSet rs = st.executeQuery(sql);
					rs.next(); //1개의 결과물 출력 
					saleno = rs.getString("saleno");
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<script type="text/javascript" src="scheck.js"></script>
				<tr>
					<td>판매번호(자동발생)</td>
					<td><input type="text" name="saleno" value="<%=saleno%>"
						readonly></td>
				</tr>
				<tr>
					<td>상품정보</td>
					<td><select name="pcode">
							<%
							String sql = "select pcode from tbl_product_01";
							ResultSet rs = st.executeQuery(sql);
							while (rs.next()) {
								String pcode = rs.getString("pcode");
							%><option value=<%=pcode%>><%=pcode%>
							</option>
							<%
							}
							rs.close(); //새로운 sql문을 실행하기 이전 레코드셋은 종료
							%>
					</select></td>
				</tr>
				<tr>
					<td>매장정보</td>
					<td><select name="scode">
							<%
							sql = "select scode from tbl_shop_01";
							rs = st.executeQuery(sql);
							while (rs.next()) {
								String scode = rs.getString("scode");
							%>
							<option value=<%=scode%>><%=scode%>
							</option>
							<%
							}
							rs.close();
							%>
					</select>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="amount"></td>
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