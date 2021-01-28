<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장 
	입력성공시 : 목록페이지로 이동(list.jsp)
	예외발생시 : 메시지 표시 후 이전화면(입력페이지) 이동
--%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출해서 VO객체에 저장(guestbookVO)
%>
	<jsp:useBean id="guestbookVO" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO"/>
<%
	System.out.println("guestbookVO : " + guestbookVO);

	//2. SqlSession 객체 생성 - 자동 커밋 상태로
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//3. 매퍼(mapper)의 SQL 사용해서 DB입력 처리
	try {
		ss.insert("guestbook.insert", guestbookVO);
		
		//4.페이지 이동 처리(list.jsp) - 정상 입력된 경우
%>
	<script>
		alert("정상입력되었습니다.\n목록페이지로 이동합니다.");
		location.href="list.jsp";
	</script>
<%		
	} catch(Exception e) { 
		e.printStackTrace();	
%>
	<script>
		alert("[예외발생] 입력처리중 예외가 발생했습니다.\n"
				+"담당자(8282)에게 연락하세요.\n"
				+"이전페이지로 이동합니다.");
		history.back();
	</script>	
<%		
	} finally {
		ss.close();
	}
%>	