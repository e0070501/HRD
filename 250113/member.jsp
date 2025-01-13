<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		<h2>회원목록조회/수정</h2>
		<table>
  <tr><th>회원번호</th><th>회원성명</th><th>전화번호</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th></tr>

		<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member_02");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("	 <td>" + rs.getString(2) + "</td>");
				out.println("	 <td>" + rs.getString(3) + "</td>");
				out.println("	 <td>" + rs.getString(4) + "</td>");
				out.println("	 <td>" + rs.getDate(5) + "</td>");
				out.println("	 <td>");
				if(rs.getString(6).equals("A")) out.print("VIP");
				else if(rs.getString(6).equals("B")) out.print("일반");
				else out.print("직원");
				out.println("</td>");
				out.println("	 <td>" + rs.getString(7) + "</td></tr>");
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