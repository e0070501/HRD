<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		<h2>회원매출조회</h2>
		<table>
  <tr><th>회원번호</th><th>회원성명</th><th>매출횟수</th><th>매출수량</th><th>매출액</th></tr>

		<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select r.custno, r.custname, COUNT(m.custno), SUM(m.amount), SUM(m.price) from member_02 r LEFT JOIN money_02 m ON r.custno=m.custno GROUP By r.custno, r.custname ORDER BY R.CUSTNO");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("	 <td>" + rs.getString(2) + "</td>");
				out.println("	 <td>" + rs.getInt(3) + "</td>");
				out.println("	 <td>" + rs.getInt(4) + "</td>");
				out.println("	 <td>" + String.format("%,d",rs.getInt(5)) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
	</section>
	<footer><h3>HRDKOREA Copyrightⓒ2023</h3></footer>
</body>
</html>