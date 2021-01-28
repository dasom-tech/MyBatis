	function sel_all(frm) {
		frm.action = "selectAll.jsp";
		frm.submit();
	}
	function sel_one(frm) {
		frm.action = "selectOneID.jsp";
		frm.submit();
	}
	function add_go(frm) {
		//아이디 값 입력 여부 확인
		if (frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수 항목입니다.\n입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		frm.action="insertMember.jsp";
		frm.submit();
	}
	function del_go(frm) {
		//아이디 값 입력 여부 확인
		if (frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수 항목입니다.\n입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		frm.action="deleteMember.jsp";
		frm.submit();
	}
