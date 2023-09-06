<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<button class="ulefbut" onclick="backLogin('login')">취소</button>
<div class="clear"></div>
<form action="jsp/loginProc.jsp" method="post">
	<table style="width:90%;margin: 50px auto;">
		<tr height="40" align="center">
			<td width="30%">
				아이디
			</td>
			<td>
				<input type="text" name="id" pattern='^[a-z0-9]*$'
				 minlength='4' maxlength='16' required="required">
			</td>
		</tr>	
		<tr height="40" align="center">
			<td>
				비밀번호
			</td>
			<td>
				<input type="password" name="pass" pattern='^[a-zA-Z0-9]*$' 
				minlength='4' maxlength='16' required="required">
			</td>
		</tr>	
		<tr height="50">
			<td colspan="2" align="center">
				<input class="formBut" type="submit"  value="로그인">&nbsp;&nbsp;
				<input class="formBut" type="button" onclick="register()" value="회원가입">
			</td>
		</tr>	
	</table>
</form>