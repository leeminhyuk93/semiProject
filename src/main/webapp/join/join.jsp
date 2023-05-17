<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE>
<html>
<head>
   <meta charset="UTF-8">
   <title>Ezen Hotel 회원 가입 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.7">
    <link rel="stylesheet" type="text/css" href="../css/loginCss.css?version=1.7">
	<link rel="shortcut icon" href="#">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
        $('#btn').on('click', function(e) {
           e.preventDefault();

           var id = $('#userid').val();
           var pwd = $('#password').val();
           var name = $('#name').val();
           var phone = $('#phone').val();
           var email = $('#email').val();
           
           if(id == "") {
        	   alert("아이디를 입력해주세요");
        	   $('#userid').focus();
        	   return;
           }
           
           if(pwd == "") {
        	   alert("비밀번호를 입력해주세요");
        	   $('#password').focus();
        	   return;
           }
           
           if(name == "") {
        	   alert("이름를 입력해주세요");
        	   $('#name').focus();
        	   return;
           }
           
           if(phone == "") {
        	   alert("전화번호를 입력해주세요");
        	   $('#phone').focus();
        	   return;
           }
           
           if(email == "") {
        	   alert("이메일를 입력해주세요");
        	   $('#email').focus();
        	   return;
           }
           
           $.ajax({
        	   url : '${contextPath}/idCheck',
        	   type : 'get',
        	   data : {id: id},
        	   dataType : 'text',
        	   success: function(result) {
        		  const isExist = JSON.parse(result);
        		  if(isExist) {
        			  alert("아이디가 존재합니다.");
        		  } else {
        			  alert("회원가입이 가능한 아이디입니다.");
        			  alert("회원가입 완료.");
        			  $('#regForm').submit();
        		  }
        	   }
           });
          
        });
     });
	
	</script>
	
	<%-- 로그인이 된 상태에서 회원가입 폼으로 이동하기 방지 --%> 
	<%
		MemberVo object = (MemberVo)session.getAttribute("member");
		if(object != null) {
			
	%>
		<script type="text/javascript">
			alert("로그아웃 후 진행해주세요.");
			window.location.href = "${contextPath}/main/main.jsp";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("회원가입 창으로 이동합니다.");
		</script>
	<%
		}
	%>
</head>

<body>
      <!--LoginServlet으로 이동-->
      <%@ include file="../etc/header.jsp" %>
      <div id="loginComment">
         회원 가입<br />
         
      </div>
      
      <form action="${pageContext.request.contextPath}/join" method="post" name="regForm" id="regForm">
         <table align="center" class="log">
            <tr>
               <th align="center" colspan="2">회원 가입</th>
            </tr>
            <tr id="loginTr">
               <td id="text">아이디</td>
               <td><input type="text" name="id" id="userid" required/></td>
            </tr>
            <tr>
               <td id="text">비밀번호</td>
               <td><input type="password" name="pwd" id="password" required/></td>
            </tr>
            <tr>
               <td id="text">이름</td>
               <td><input type="text" name="name" id="name"  required/></td>
            </tr>
            <tr>
               <td id="text">전화번호</td>
               <td><input type="tel" name="phone" id="phone"  required/></td>
            </tr>
            <tr>
               <td id="text">이메일</td>
               <td><input type="text" name="email" id="email"  required/></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="회원가입" id="btn" />
               </td>
            </tr>
         </table>
         
      </form>
      <br /><br /><br /><br /><br />
     
      <%@ include file="../etc/footer.jsp" %>
</body>
</html>