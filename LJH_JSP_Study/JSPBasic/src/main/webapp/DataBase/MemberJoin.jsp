<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="left">
		<h2>회원 가입</h2>
		<form action="MemberJoinProc.jsp">
			<table width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350" align="center"><input type="text" name="id"
						size="40" placeholder="id를 넣으세요"></td>
				</tr>

				<tr height="50">
					<td width="150" align="center">패스워드</td>
					<td width="350" align="center"><input type="password"
						name="pass1" size="40" placeholder="비밀번호는 숫자와 영어만 넣어주세요">
					</td>
				</tr>

				<tr height="50">
					<td width="150" align="center">이메일</td>
					<td width="350" align="center"><input type="email"
						name="email" size="40"></td>
				</tr>

				<tr height="50">
					<td width="150" align="center">전화 번호</td>
					<td width="350" align="center"><input type="tel" name="tel"
						size="40"></td>
				</tr>
				

				<tr height="50">
					<td width="150" colspan="2"><input type="submit" value="회원 가입">
						<input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>