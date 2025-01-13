<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<%
String new_no="";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(custno)+1 from member_02");
			while(rs.next()) {
				new_no = rs.getString(1);
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

<h2>쇼핑몰 회원관리 프로그램</h2>
<form action="new_db.jsp">
<table>
<tr><th>회원번호</th><td style="text-align: left;"><input type="text" name="a" value="<%=new_no %>"/></td></tr>
<tr><th>회원성명</th><td style="text-align: left;"><input type="text" name="b"/></td></tr>
<tr><th>회원전화</th><td style="text-align: left;"><input type="text" name="c" style="width: 300px;"/></td></tr>
<tr><th>회원주소</th><td style="text-align: left;"><input type="text" name="d" style="width: 400px;"/></td></tr>
<tr><th>가입일자</th><td style="text-align: left;"><input type="date" name="e"/></td></tr>
<tr><th>고객등급</th><td style="text-align: left;"><input type="text" name="f"/></td></tr>
<tr><th>도시코드</th><td style="text-align: left;"><input type="text" name="g"/></td></tr>
<tr><th colspan="2"><input type="submit" value=" 등 록 "/> <input type="button" value=" 조 회 " onclick="location.href='member.jsp'"/> </th></tr>
</table>
</form>

</section>
<footer><h3>HRDKOREA Copyrightⓒ2023</h3></footer>
</body>
</html>