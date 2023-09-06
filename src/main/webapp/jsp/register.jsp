<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<button class="ulefbut" onclick="backLogin('register')">취소</button>
<div class="clear"></div>
<form action="jsp/registerProc.jsp" method="post">
	<table style="width:90%;margin: 50px auto;">
		<tr height="30" align="center">
			<td width="30%">닉네임</td>
			<td><input type="text" name="name" minlength='2' 
			maxlength='16' required="required"></td>
		</tr>	
		<tr height="30" align="center">
			<td width="30%">성별</td>
			<td>
				<input type="radio" name="gender" value="0" checked="checked">남&nbsp;
				<input type="radio" name="gender" value="1">여
			</td>
		</tr>	
		<tr height="30" align="center">
			<td>아이디</td>
			<td><input type="text" name="id" pattern='^[a-z0-9]*$'
				 minlength='4' maxlength='16' required="required"></td>
		</tr>	
		<tr height="30" align="center">
			<td>비밀번호<div id="see">(보기)</div></td>
			<td><input type="password" name="pass" pattern='^[a-zA-Z0-9]*$' 
				minlength='4' maxlength='16' required="required"></td>
		</tr>
		<tr height="30" align="center">
			<td>이메일</td>
			<td><input type="email" name="email" value="@"></td>
		</tr>	
		<tr height="50">
			<td colspan="2" align="center">
				<input class="formBut" type="submit" value="회원가입">&nbsp;&nbsp;
				<input class="formBut" type="reset" value="초기화">
			</td>
		</tr>	
	</table>
</form>