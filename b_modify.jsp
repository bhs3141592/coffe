<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BPKG.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장정보 수정</title>
</head>
<body>
	<script type="text/javascript" src="bcheck.js"></script>
	<jsp:include page="header.jsp" />
	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">매장 정보 수정</h2>
		<br>
		<form method="post" action="b_action.jsp"
			style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="modify">
			<table border=1>
				<%
request.setCharacterEncoding("UTF-8"); 
Connection conn = null;
Statement st = null;
String mod_scode=request.getParameter("mod_scode");
String sname="";
try {
	conn= Condb.getConnection();
	st = conn.createStatement();
	String sql="select * from tbl_shop_01 where scode= " + mod_scode;
	ResultSet rs= st.executeQuery(sql);
	rs.next();
	mod_scode=rs.getString("scode");
	sname=rs.getString("sname");
}
catch (Exception e){
	e.printStackTrace();
}
%>
				<tr>
					<td>매장번호</td>
					<td><input type="text" name="scode" value="<%=mod_scode %>" readonly></td>
				</tr>
				<tr>
					<td>매장이름</td>
					<td><input type="text" name="sname" value="<%=sname %>"></td>
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
