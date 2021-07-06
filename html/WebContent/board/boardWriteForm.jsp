<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<style type="text/css">
div {
	color: white;
	font-size: 8pt;
	font-weight: bold;
}

</style>

</head>

<body style="background: linear-gradient(to right, #aa4b6b, #3b8d99 ) ; color:white;">

   <form name='boardWriteForm' method="post" action="/html/board/boardWrite.jsp">
      <h1 align="center">글쓰기</h1>

      <table border="1" bordercolor="white" width="500" height="200"
         align="center" cellspacing="0" cellpadding="3">

        

         <!--제목-->
        <tr>
            <td align="center" width="100">제목</td>
            <td><input id="subject" name="subject" type="text" size=50 style="background:transparent; color:white;">
            <div id="subjectDiv"></div>
            </td>
         </tr>

        <!--내용-->
        <tr>
            <td  align="center" width="100">내용</td>
            <td><textarea id="content" name="content" style="width:380px; font-family:함초롬돋움; height:180px; border:0; background: transparent; color:white; font-size:13pt;  outline:none; resize:none;"></textarea>
            <div id="contentDiv"></div>
            </td>
         </tr>

       

         <!--버튼 -->
         <tr>
            <td colspan="2" width="200" align="center">
            <input type="button" value="글쓰기" id="boardwriteBtn" style="background-color:transparent; border:0; border-color:white; color:white; font-size:11pt;">
           <input type="reset" value="다시작성" style="background-color:transparent; border:0; border-color:white; color:white; font-size:11pt;">
            </td>                          
         </tr>


      </table>
   </form>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script src="../js/board.js"></script>

</body>
</html>