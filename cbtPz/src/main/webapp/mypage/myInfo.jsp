<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function inputCheck() {
		if (frm.member_id.value == "") {
			window.alert("id 입력");
			frm.member_id.focus();
			return;
		}
		if (frm.member_pw.value == "") {
			window.alert("pw 입력");
			frm.member_pw.focus();
			return false;
		}
		//if(frm.job.value == ""){
		if (frm.member_job.selectedIndex == 0) { //
			window.alert("job 선택");
			frm.member_job.focus();
			return false;
		}
		return true;
	}
	/**/
</script>
</head>
<body>
	
	<h1 class="page_title">개인 정보 수정</h1>
	<div class="regist">
		<form method="post" name="frm" id="frm" action="<%=application.getContextPath()%>/memberUpdate.do"
			onsubmit="inputCheck()">
			<div>
				<label for="member_id">ID</label> <input id="member_id"
					name="member_id" type="text" value="${member.member_id }"
					readonly="readonly">
			</div>
			<div>
				<label for="member_pw">Password</label> <input id="member_pw"
					name="member_pw" type="password" value="${member.member_pw }">
			</div>
			<div>
				<label for="member_name">이름</label> <input type="text"
					name="member_name" value="${member.member_name }">
			</div>
			<div>
				<label for="member_age">나이</label> <input type="text"
					name="member_age" value="${member.member_age }">
			</div>
			<div>
				<label for="member_job">직업</label> <input type="text"
					name="member_job" value="${member.member_job }">
			</div>
			<div>
				<label for="study_term">공부기간</label> <input type="text"
					id="study_term" name="study_term" value="${member.study_term }">
			</div>
			<div>
				<label for="phone_number">전화번호</label> <input type="text"
					id="phone_number" name="phone_number"
					value="${member.phone_number }">
			</div>
			<div>
				<label for="is_major">전공 여부</label> <input type="checkbox"
					name="is_major" value="y">
				<!-- yes or no -->
			</div>
			<div>
				<label for="tested_num">시험 응시 횟수</label> <input type="text"
					id="tested_num" name="tested_num" value="${member.tested_num }">
			</div>
			<div>
				<label for="email">이메일</label> <input type="text"
					id="email" name="email" value="${member.email }">
			</div>
			<div>
				<button type="reset">초기화</button>
				<button>등록</button>
			</div>
		</form>
		<form action="memberDelete.do" method="post">
			<input type="hidden" name="member_id" value="${member.member_id }" />
			<button>회원 탈퇴</button>
		</form>
	</div>
</body>
</html>