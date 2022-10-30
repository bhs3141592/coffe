<%@page import="java.sql.*"%>

<%@page import="BPKG.Condb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가, 수정</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement st = null;
	String mode = request.getParameter("mode");
	String pcode = request.getParameter("pcode");
	String name = request.getParameter("name");
	String cost = request.getParameter("cost");
	try {
		conn = Condb.getConnection();//DB 연결
		st = conn.createStatement();
		String sql = "";
		switch (mode) {
		case "insert":
			sql = "insert into tbl_product_01 values (" + pcode + "," + "'" + name + "'," + "" + cost + ")";
			st.executeUpdate(sql);
	%>
	<jsp:forward page="m_join.jsp"></jsp:forward>
	<%
	break;
	case "modify":
		sql = "update tbl_product_01 set " + "name = '" + name + "'," + "cost = " + cost + " " + "where pcode =" + pcode;
		st.executeUpdate(sql);
	%>
	<jsp:forward page="m_list.jsp"></jsp:forward>
	<%
	break;

	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>