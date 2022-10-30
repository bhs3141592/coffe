<%@page import="java.sql.*"%>

<%@page import="BPKG.Condb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매추가, 수정</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement st = null;
	String mode = request.getParameter("mode");
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");

	try {
		conn = Condb.getConnection();
		st = conn.createStatement();
		String sql = "";
		switch (mode) {
		case "insert":
			sql = "insert into tbl_salelist_01 values (" + saleno + "," + pcode + "," + scode + "," + amount + ")";
			st.executeUpdate(sql);
	%>
	<jsp:forward page="s_join.jsp"></jsp:forward>
	<%
	case "modify":
		sql = "update tbl_salelist_01 set " + "amount = " + amount + " " + "where saleno =" + saleno;
		st.executeUpdate(sql);
	%>
	<jsp:forward page="s_list.jsp"></jsp:forward>
	<%
	break;

	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>