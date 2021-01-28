<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(idx)로 DB데이터 조회 후 화면 출력 --%>
<%
	//1.전달받은 idx 값 추출
	String idx = request.getParameter("idx");
	
	//2.DB연결 후 데이터 가져오기
	SqlSession ss = DBService.getFactory().openSession();
	GuestbookVO vo = ss.selectOne("guestbook.one", idx);
	ss.close();
	
	System.out.println("vo : " + vo);
	
	//3.조회 데이터 화면 표시
	
	//검색 데이터(vo)를 수정, 삭제 처리시에도 사용하기 위한 설정
	//session scope에 등록 처리(session 객체에 저장)
	session.setAttribute("guestbookVO", vo);
	
	//세션에 저장 여부 확인
	System.out.println("session guestbookVO : " + session.getAttribute("guestbookVO"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<link href="../css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	function update_go(frm) {
		frm.action = "update.jsp"; //수정작업할 화면
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "delete.jsp"; //삭제작업할 화면
		frm.submit();
	}
</script>
</head>
<body>
	
<div id="container">
	<h2>방명록 : 상세화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>

	<form method="post">
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><%=vo.getName() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=vo.getSubject() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=vo.getEmail() %></td>
			</tr>
			<tr>
				<td colspan="2"><%=vo.getContent() %></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정(수정폼이동)"
							onclick="update_go(this.form)">
					<input type="button" value="삭 제(삭제폼이동)"
							onclick="delete_go(this.form)">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>	
	
</body>
</html>