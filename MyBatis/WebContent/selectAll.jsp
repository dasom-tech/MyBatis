<%@page import="com.mystudy.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- DB에서 전체 데이터 조회(검색)해서 화면 출력 --%>
<%
	// SqlSession 객체 얻기
	// openSession(true) : 자동 커밋 상태로 세션객체 생성(SQL실행후 자동커밋)
	// openSession(), openSession(false) : Auto commit 해제 상태(트랜잭션 필요) 
	//		- insert, update, delete 작업 후 명시적으로 commit 처리 필요
	SqlSession ss = DBService.getFactory().openSession();
	
	// SqlSession selectList(mapper의 id명) : select 결과 여러개인 경우 List 형태로 받기
	// SqlSession selectOne(mapper의 id명) : select 결과가 한개(0, 1)인 경우
	List<MemberVO> memberList = ss.selectList("member.selectAll");
	ss.close();
	System.out.println("memberList : " + memberList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표준화면</title>
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>

<%@ include file="includee/menu.jspf" %>

	<hr>
	<h1>전체 데이터 검색</h1>
	<ul>
<%
	if (memberList.size() > 0) { //데이터가 있으면
		for (MemberVO vo : memberList) { %>
		<li>
			<%=vo.getId() %> :: 
			<%=vo.getId() %> ::
			<%=vo.getName() %> ::
			<%=vo.getAddress() %>
		</li>		
<%			
		}
	} else { //데이터가 없으면
		out.print("<li>조회(검색) 데이터가 없습니다</li>");
	}
%>	
	</ul>

</body>
</html>










