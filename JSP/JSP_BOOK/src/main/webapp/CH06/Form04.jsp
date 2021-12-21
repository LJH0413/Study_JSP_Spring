<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 회원 가입 </h3>
	<form action = "form04_process.jsp" name = "member" method = "post">
		<p> 아 이 디 : <input type= "text" name = "id"> 
					<input type="button" value ="아이디 중복 검사">
		<p> 비밀번호 : <input type="password" name = "passwd"> 
		<p> 이   름 : <input type= "text" name= name>
		<p> 연 락 처 : 
				<select name = "phone1">
					<option value= "010"> 010 </option>
					<option value= "011"> 011 </option>
					<option value= "016"> 016 </option>
					<option value= "017"> 017 </option>
					<option value= "018"> 018 </option>
				</select>
					- <input type = "text" maxlength = "4" size = "4" name = "phone2">
					- <input type = "text" maxlength = "4" size = "4" name = "phone3">
		<p> 성   별 : <input type = "radio" name = "sex" value = "남성" checked> 남성 
					 <input type = "radio" name = "sex" value = "여성" > 여성 
		<p> 취   미 :  독서 <input type = "checkbox" name = "hobby1" value="독서" checked>
					  운동 <input type = "checkbox" name = "hobby2" value="운동">
					  영화 <input type = "checkbox" name = "hobby3" value="영화" >
					  
		<p> <textarea name = "comment" cols = "30" rows = "10" placeholder = "가입 인사를 남겨 주세요"></textarea>
				
					  
		<p> <input type ="submit" value = "가입하기"> 
			<input type = "reset" value = "다시쓰기"> 	
	
	
	</form>

</body>
</html>