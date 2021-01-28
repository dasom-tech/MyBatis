<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습)선택된 데이터 삭제 처리 (파라미터 pwd 값과 session 데이터 사용)
	전달받은 파라미터 pwd와 session에 저장된 VO객체의 pwd 값 비교
	- 일치하면 : 삭제 후 목록 페이지로 이동(삭제 메세지 표시)
	- 불일치하면 : 이전 페이지로 이동(암호불일치 메세지 표시)
--%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	String pwd = request.getParameter("pwd");
	//1. 파라미터 값 추출해서 VO객체에 저장(guestbookVO)
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
	System.out.println("sesson vo : " + vo); //확인해보기
	
	//암호 일치여부 확인
	if (!pwd.equals(vo.getPwd())) {
%>
		<script>
		alert("암호가 일치하지 않습니다. 암호를 확인하세요.\n"
				+"이전페이지로 이동합니다.");
		history.back();
		</script>
<%
		return;
	}
	
	SqlSession ss = DBService.getFactory().openSession(true);
	try {
		int result = ss.delete("guestbook.delete", Integer.parseInt(vo.getIdx())); //매퍼에서 int로 선언했으므로.
%>
	<script>
		alert("정상적으로 삭제되었습니다.\n목록으로 이동합니다.");
		location.href="list.jsp";
	</script>
<%		
	} catch(Exception e) { 
		e.printStackTrace();
%>
	<script>
		alert("[예외발생] 삭제실패! 담당자 연락~");
		location.href="list.jsp";
	</script>
<%
	} finally {
		ss.close();
	}
%>			
		
