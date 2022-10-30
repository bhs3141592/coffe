function joinCheck() {
	if (document.b_frm.sname.value.length == 0) {
		alert("매장이름이 입력되지 않았습니다.");
		b_frm.sname.focus();
		return false;
	}
	success();
	return true;
}
function success() {
	alert("매장등록이 완료되었습니다.");
}

function search() {
	window.location = "b_list.jsp";
}

function modify() {
	alert("매장정보 수정이 완료되었습니다.");
}