<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
   <meta charset="UTF-8">
   <title>Ezen Hotel 회원 로그인</title>
    
    <link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.7">
    <link rel="stylesheet" type="text/css" href="../css/loginCss.css?version=1.7">
	<link rel="shortcut icon" href="#">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#loginBtn').on('click', function(e) {
				e.preventDefault();
				
				var id = $('#username').val();
				var pwd = $('#password').val();
				
				$.ajax({
					url : '${contextPath}/loginCheck',
					type : 'post',
					data : {id: id, pwd: pwd},
					dataType : 'text',
					success: function(result) {
						const member = JSON.parse(result);
						if(member == null) {
							alert("회원이 존재하지 않습니다.");
							$('#username').focus();
							return;
							
						} else {
							alert("로그인 되었습니다.");
							$('#regForm').submit();
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			})
		});
	</script>
</head>

<body>
	<%@ include file="../etc/header.jsp" %>
      <!--LoginServlet으로 이동-->
      <div id="loginComment">
         회원 로그인 화면입니다<br />
         
      </div>
      
      <form id="regForm" action="${contextPath}/login" method="post">
         <table align="center" class="log">
            <tr>
               <th align="center" colspan="2">LOGIN</th>
            </tr>
            <tr id="loginTr">
               <td id="text">아이디</td>
               <td><input type="text" name="username" id="username" /></td>
            </tr>
            <tr>
               <td id="text">비밀번호</td>
               <td><input type="password" name="password" id="password" /></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="로그인" id="loginBtn" />
               </td>
            </tr>
         </table>
         
      </form>
      <br /><br /><br /><br /><br />

      <%@ include file="../etc/footer.jsp" %>
</body>
</html>