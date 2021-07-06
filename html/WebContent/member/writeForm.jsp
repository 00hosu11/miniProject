<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 과제</title>

<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

body
{
  background-color: #f8bdc6;
}

#whole{
width:700px;
height:700px;
border-radius:30%;
background:white;
margin: auto;
margin-top: 150px;
}

h1{
margin-top: 80px;
}

</style>

</head>

<body>
<div id=whole>
   <form name="writeForm" method="post" action="/html/member/write.jsp">
   <br>
      <h1 align="center">회원가입</h1>

      <table border="1" bordercolor="ff6080" width="500" height="300"
         align="center" cellspacing="0" cellpadding="10">

         <!--이름 -->
         <tr>
            <td bgcolor="ffb8c6" align="center" width="100">이름</td>
            <td><input name="name" id="name"  type="text" placeholder="이름 입력">
            <div id="nameDiv"></div>
            </td>
         </tr>

         <!-- 아이디 -->
         <tr>
            <td bgcolor="ffb8c6" align="center" width="100">아이디</td>
            <td>
           		 <input name="id" id="id" type="text"  placeholder="아이디 입력">
       	  <!--<input type="button" value="중복체크" onclick=""> -->
         		 <input type="hidden" name="check" id="check">
            <div id="idDiv"></div>
            </td>
         </tr>


         <!-- 비밀번호 -->

         <tr>
            <td bgcolor="ffb8c6" align="center" width="100">비밀번호</td>
            <td><input name="pwd" id="pwd" type="password"></td>
            
         </tr>

         <!-- 재확인 -->

         <tr>
            <td bgcolor="ffb8c6" align="center" width="100">재확인</td>
            <td><input name="repwd" id="repwd" type="password">
            <div id="pwdDiv"></div>
            </td>
         </tr>



         <!--성별-->
         <tr>
            <td bgcolor="ffb8c6" align="center">성별</td>
            <td>
               <input type="radio" name="gender" value="0" checked="checked">남 
               <input type="radio" name="gender" value="1">여
            </td>
         </tr>



         <!-- 이메일 -->
         <tr>
            <td bgcolor="ffb8c6" align="center">이메일</td>
            <td><input type="text" name="email1" size="15"> @ 
      			 <input type="email" list="email2" name="email2" placeholder="직접입력" size="15">
  				  <datalist id="email2">	  
                  <option value="gmail.com"></option>
                  <option value="hanmail.com"></option>
                  <option value="naver.com"></option>
                  </datalist>
            </td>
         </tr>

         <!--핸드폰 -->
         <tr>
            <td bgcolor="ffb8c6" align="center">핸드폰</td>
            <td><select name="tel1" style ="width:70px;">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="019">019</option>
               </select>
                -
               <input type="text" name="tel2" size="3" maxlength="4" />
                - 
               <input type="text" name="tel3" size="3" maxlength="4" />
            </td>
         </tr>


         <!--주소 -->
         <tr>
            <td bgcolor="ffb8c6" align="center">주소</td>
            <td>
            <input type="text" size="10" readonly name="zipcode" id="zipcode" >  <!--disabled은 데이터도 못가져간다 -->
            <input type="button" value="우편번호 검색" id="checkPostBtn" > 
            <br> 
            <input type="text" name="addr1" size="50" placeholder="주소" readonly id="addr1"> 
            <input type="text" name="addr2" size="50" placeholder="상세주소" id="addr2">
            </td>
         </tr>


         <!--버튼 -->
         <tr>
            <td colspan="2" width="200" align="center">
            <input type="button"  value="회원가입" id="writeBtn">
            <input type="reset" value="다시작성">
            </td>
         </tr>


      </table>
   </form>
 </div>
 
 <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="../js/member.js"></script>


</body>
</html>