<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function checkMember(){
			var regExpId = 	/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;	//숫자를 넣지 못하도록
			var regExpName = /^[가-힣]*$/;	// 이름은 한글만 적용
			var regExpPasswd = /^[0-9]*$/;	// 패스워드는 숫자만 적용
			var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$;	//핸드폰 첫박스 3,두번째 : 3,4 세번째: 4
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a=zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
					//email 주소는 @ 가 있어야 하고, . 있어야 하고, 마지막은 두자 또는 세자 
			
			var form = document.Member;
			
			var id = form.id.value;
			var name = form.name.value;
			var passwd = form.passwd.value;
			var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value ;
			var email = form.email.value ;
			
			if (!regExpId.test(id)){
				alert("아이디는 숫자는 넣을 수 없습니다. ");
				form.id.select();
				return;
			}
			if (!regExpName.test(name)){
				alert("이름은 한글만 입력 하세요.");
				form.name.select();
				return;
			}
			if (!regExpPasswd.test(passwd)){
				alert("비밀번호는 숫자만 입력가능 합니다.");
				form.passwd.select();
				return;
			}
			if (!regExpPhone.test(phone)){
				alert("연락처 입력을 확인해 주세요");
				form.phone2.select();
				return;
			}
			if (!regExpEmail.test(email)){
				alert("이메일 주소를 확인해 주세요");
				form.email.select();
				return;
			}
			
			
			form.submit();
		}	
	</script>
</head>
<body>
	<h3> 회원 가입 </h3>
	<form action = "validation05_process.jsp" name ="Member" method = "post">
		<p> 아 이 디 : <input type="text" name ="id">
		<p> 비밀번호  : <input type= "password" name = "passwd">
		<p> 이  름 : <input type= "text" name="name">
		<p> 연락처 : <select name = "phone1">
						<option value = "010"> 010 </option>
						<option value = "011"> 011 </option>
						<option value = "016"> 016 </option>
						<option value = "017"> 017 </option>
						<option value = "018"> 018 </option>						
					</select> 
					- <input type="text" maxlength = "4" size = "4" name="phone2">
					- <input type="text" maxlength = "4" size = "4" name="phone3">
		<p> 이 메 일 : <input type="text" name = "email">
		<p> <input type="button" value="전송" onclick = "checkMember()"> 
	
	</form>
</body>
</html>