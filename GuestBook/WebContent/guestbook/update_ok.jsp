<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB데이터 수정하고 페이지 전환
	정상 수정 처리 : 상세페이지로 이동(onelist.jsp)
	예외 발생 : 예외 메세지 표시 후 상세 페이지 이동
--%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출해서 VO객체에 저장(guestbookVO)
%>
	<jsp:useBean id="guestbookVO" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO"/>
<%
	//2. SqlSession 객체 생성 - 자동 커밋 상태로
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//3. 매퍼(mapper)의 SQL 사용해서 DB입력 처리
	try {
		ss.update("guestbook.update", guestbookVO);
		
	//4.페이지 이동 처리(list.jsp) - 정상 입력된 경우
%>
	<script>
		alert("정상입력되었습니다.\n상세페이지로 이동합니다.");
		location.href="onelist.jsp?idx=<%=guestbookVO.getIdx()%>";
	</script>
<%		
	} catch(Exception e) { 
		e.printStackTrace();	
%>
	<script>
		alert("[예외발생] 입력처리중 예외가 발생했습니다.\n"
				+"담당자(8282)에게 연락하세요.\n"
				+"상세페이지로 이동합니다.");
		location.href="onelist.jsp?idx=<%=guestbookVO.getIdx()%>";
	</script>	
<%		
	} finally {
		ss.close();
	}
%>

<%--강사님 방법
<%
	//0. 한글처리를 위한 encoding 타입 설정
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="vo"/>
<%
	System.out.println(">> vo : " + vo);
	System.out.println(">> page vo : " + pageContext.getAttribute("vo"));
	
	//2. SqlSession 객체 생성 및 DB 수정 처리
	//SqlSession ss = DBService.getFactory().openSession(true); //자동커밋
	SqlSession ss = DBService.getFactory().openSession(); //자동커밋 아님
	
	try {
		ss.update("guestbook.update", vo);
		ss.commit();
		//3. 화면전환 - 정상처리된 경우
		//response.sendRedirect("onelist.jsp?idx=" + vo.getIdx());
%> 
		<script>
			alert("수정처리 되었습니다.");
			location.href = "onelist.jsp?idx=<%=vo.getIdx() %>";
		</script>		
<%		
	} catch(Exception e) {
		ss.rollback();
		e.printStackTrace();
		//3. 화면전환 - 예외발생 경우
%>
		<script>
			alert("[예외발생] 수정되지 않았습니다");
			history.go(-2); //상세화면으로 이동
		</script>
<%		
	} finally {
		ss.close();
	}
%>


 --%>	