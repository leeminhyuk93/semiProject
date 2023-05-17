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
           
           const id_regex = /^[a-z]+[a-z0-9]{5,19}$/g;
           const pwd_regex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
           const name_regex = /^[가-힣]+$/;
           const phone_regex = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
           const email_regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        	     
        	 
           if(id == "") {
        	   alert("아이디를 입력해주세요");
        	   $('#userid').focus();
        	   return;
           }
           
           if(!id_regex.test(id)) {
        	   alert("영어 소문자와 숫자로 5자리 이상 입력해주세요.");
        	   $('#userid').focus();
        	   return;
           }
           
           if(pwd == "") {
        	   alert("비밀번호를 입력해주세요");
        	   $('#password').focus();
        	   return;
           }
          
           if(!pwd_regex.test(pwd)) {
        	   alert("소문자와 숫자 특수문자를 넣어 8자리 이상 입력해주세요.");
        	   $('#password').focus();
        	   return;
           }
           
           if(name == "") {
        	   alert("이름를 입력해주세요");
        	   $('#name').focus();
        	   return;
           }
           
           if(!name_regex.test(name)) {
        	   alert("한글로 입력해주세요.");
        	   $('#name').focus();
        	   return;
           }
           
           if(phone == "") {
        	   alert("전화번호를 입력해주세요");
        	   $('#phone').focus();
        	   return;
           }
           
           if(!phone_regex.test(phone)) {
        	   alert("하이픈(-)을 포함하여 작성해주세요.\n '010-0000-0000'");
        	   $('#phone').focus();
        	   return;
           }
           
           if(email == "") {
        	   alert("이메일를 입력해주세요");
        	   $('#email').focus();
        	   return;
           }
           
           if(!email_regex.test(email)) {
        	   alert("이메일 형식으로 입력해주세요 \n 'ezen@naver.com'");
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
	
	
	<%-- 실시간 아이디 중복 검사 --%>
	<script type="text/javascript">
        $(document).ready(function() {
            
            const input = document.getElementById('userid');
        
            
            input.addEventListener('keyup', function(event) {
                const input_id = event.target.value;
                const checkText = document.getElementById('idCheck');
                
             // 회원 아이디가 존재하는지 확인
		        $.ajax({
					url : '${contextPath}/idCheck',
					type : 'get',
					data : {id: input_id},
					dataType : 'text',
					success: function(result) {
						const isExists = JSON.parse(result);
						if(isExists == 'false') {
							checkText.value = "사용가능한 아이디입니다.";
							checkText.style.color = "green";
							return;
						} else {
							checkText.value = "이미 가입된 아이디입니다.";
							checkText.style.color = "red";
							return;
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				}); // 회원 아이디 체크 ajax
				
				
            });
        });
    </script>
    
    <style>
		#idCheck {
			border: none; 
			font-size: 16px; 
			color: green;
			background-color: transparent;
		}
	</style>
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
            	<td><input type="text" id="idCheck"></td>
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
               <td><input type="email" name="email" id="email"  required/></td>
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