<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<h2>네일 메뉴 조회</h2>
<table>
<tr><th>방문일자</th><th>총건수</th><th>총가격</th></tr>
<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select f.visitdate,count(*),SUM(m.price) from tbl_ferformance f JOIN tbl_menu m on f.menucode1=m.menucode where f.menucode1 != 'N00'group by f.visitdate Order by f.visitdate");
			while(rs.next()) {
				out.println("	<td>" + rs.getString(1) + "</td>");
				out.println("	<td>" + rs.getString(2) + "</td>");
				out.println("	<td>￦" + String.format("%,d",rs.getInt(3)) + "</td></tr>");
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