<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<h2>네일 메뉴 조회</h2>
<table>
<tr><th>번호</th><th>고객아이디</th><th>성명</th><th>주소</th><th>고객등급</th><th>네일</th><th>패디</th><th>기타</th><th>방문일자</th></tr>

<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_customer C, tbl_ferformance F, tbl_menu m1, tbl_menu m2, tbl_menu m3 WHERE C.customerid=F.customerid AND f.menucode1=m1.menucode AND f.menucode2=m2.menucode AND f.menucode3=m3.menucode order by f.visitdate");
			int num = 1;
			while(rs.next()) {
				out.println("	<td>" + num + "</td>");
				out.println("	<td>" + rs.getString(1) + "</td>");
				out.println("	<td>" + rs.getString(2) + "</td>");
				out.println("	<td>" + rs.getString(5) + "</td>");
				out.println("	<td>");
				if(rs.getString(9).equals("V")) out.print("민석고객");
				else if(rs.getString(9).equals("G")) out.print("일반고객");
				else if(rs.getString(9).equals("S")) out.print("학생고객");
				else out.print("기타");
				out.println("	<td>" + rs.getString(15) + "</td>");
				out.println("	<td>" + rs.getString(19) + "</td>");
				out.println("	<td>" + rs.getString(23) + "</td>");
				out.println("	<td>" + rs.getString(13) + "</td></tr>");
				num++;
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