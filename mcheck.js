function joinCheck() {
	if (document.m_frm.name.value.length == 0) {
		alert("상품명이 입력되지 않았습니다.");
		m_frm.name.focus();
		return false;
	}
	if (document.m_frm.cost.value.length == 0) {
		alert("가격이 입력되지 않았습니다.");
		m_frm.cost.focus();
		return false;
	}

	success();
	return true;
}
function success() {
	alert("상품등록이 완료되었습니다.");
}

function search() {
	window.location = "m_list.jsp";
}

function modify() {
	alert("상품정보 수정이 완료되었습니다.");
}