<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<h2>네일 메뉴 조회</h2>
<table>
<tr><th>메뉴코드</th><th>메뉴명</th><th>메뉴타입</th><th>메뉴가격</th></tr>
<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_menu");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("	<td>" + rs.getString(2) + "</td>");
				out.println("	<td>");
				if(rs.getString(3).equals("N")) out.print("네일");
				else if(rs.getString(3).equals("P")) out.print("페디");
				else out.print("기타");
				out.print("</td>");
				out.println("	<td>￦" + String.format("%,d",rs.getInt(4)) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
</table>
</section>
<%@ include file="footer.jsp" %>