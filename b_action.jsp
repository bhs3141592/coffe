<%@page import="java.sql.*"%>

<%@page import="BPKG.Condb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장추가, 수정</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement st = null;
	String mode = request.getParameter("mode");
	String scode = request.getParameter("scode");
	String sname = request.getParameter("sname");
	try {
		conn = Condb.getConnection();
		st = conn.createStatement();
		String sql = "";
		switch (mode) {
		case "insert":
			sql = "insert into tbl_shop_01 values (" + scode + "," + "'" + sname + "')";
			st.executeUpdate(sql);
	%>
	<jsp:forward page="b_join.jsp"></jsp:forward>
	<%
	break;
	case "modify":
		sql = "update tbl_shop_01 set " + "sname = '" + sname + "' " + "where scode =" + scode;
		st.executeUpdate(sql);
	%>
	<jsp:forward page="b_list.jsp"></jsp:forward>
	<%
	break;

	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>