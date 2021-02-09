<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 현재 페이지에서 표시할 데이터를 화면에 표시 
	1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
	2. 페이징 객체에 설정할 데이터 저장
	3. DB 데이터 조회(건수 확인)
	4. 현재 페이지에 표시할 데이터 조회
		4-1. 전달받은 페이지 번호 활용
		4-2. 전체 페이지 수, 블록 갯수 확인
		4-3. 현재 블록의 시작페이지, 끝페이지
		4-4. 현재 페이지의  begin, end
	5. 데이터 화면에 표시(스타일 적용해서)
--%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS</title>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs table th, #bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
</head>
<body>

<div id="bbs">
<table>
	<caption>게시글 목록</caption>
	<thead>
		<tr class="title">
			<th class="no">번호</th>
			<th class="subject">제목</th>
			<th class="writer">글쓴이</th>
			<th class="regdate">날짜</th>
			<th class="hit">조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>10</td>
			<td>테스트10</td>
			<td>테스터</td>
			<td>2021-02-02</td>
			<td>0</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
					<li class="disable">이전으로</li>
					<li class="now">1</li>
					<li>
						<a>2</a>
					</li>
					<li>
						<a>3</a>
					</li>
					<li>
						<a>다음으로</a>
					</li>
				</ol>
			</td>
			<td>
				<input type="button" value="글쓰기">
			</td>
		</tr>
	</tfoot>
</table>
</div>

</body>
</html>












