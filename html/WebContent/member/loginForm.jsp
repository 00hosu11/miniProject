<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 과제</title>
<style type="text/css">
body
{
  background-color: #f8bdc6;
}

#whole{
width:400px;
height:400px;
border-radius:30%;
background:white;
margin: auto;
margin-top: 150px;
}
h1{
margin-top: 60px;
}
</style>
</head>

<body>
<div id=whole>
   <form name='loginForm' method="post" action="./loginOk.jsp">
   <br>
      <h1 align="center">로그인</h1>

      <table border="1" bordercolor="ff6080" width="300" height="100"
         align="center" cellspacing="0" cellpadding="5" >

         <!-- 아이디 -->
         <tr>
            <td bgcolor="ffb8c6" align="center" width="100">아이디</td>
            <td><input name="id" id="id" type="text" placeholder="아이디 입력">
            <div id="idDiv"></div>
            </td>
         </tr>


         <!-- 비밀번호 -->
         <tr>
            <td bgcolor="ffb8c6" align="center" width="100">비밀번호</td>
            <td><input name="pwd" id="pwd" type="password">
             <div id="pwdDiv"></div>
            </td>
         </tr>

         <!--버튼 -->
         <tr>
            <td colspan="2" width="200" align="center">
            <input type="button" value="로그인" id="loginBtn">
            <input type="button" value="회원가입" onClick="location.href='writeForm.jsp'">
			<div id="loginResult"></div>
            </td>
         </tr>
      </table>
      <br><br>
   </form>
   </div>

<!-- <script src="../js/member.js"></script> -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$('#loginBtn').click(function(){
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#id').val() == ''){
		$('#idDiv').html("아이디 입력");
		$('#idDiv').css('color', 'red');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
	}else if($('#pwd').val() == ''){
		$('#pwdDiv').html("비밀번호 입력");
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwdDiv').css('font-weight', 'bold');
	}else{
		$.ajax({
			url: '/html/member/login.jsp',
			type: 'post',
			data: {'id': $('#id').val(),
				   'pwd': $('#pwd').val()},
			dataType: 'text',
			success: function(data){
				data = data.trim();
				
				if(data == 'ok'){
					location.href = 'loginOk.jsp';
					
				}else if(data =='fail'){
					$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.')
					$('#loginResult').css('color', 'red');
					$('#loginResult').css('font-size', '10pt');
					$('#loginResult').css('font-weight', 'bold');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>


</body>
</html>