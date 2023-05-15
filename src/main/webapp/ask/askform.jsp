<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의하기</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			//폼에서 submit 이벤트 발생시 작동
	        $("#regform").on('submit', function() {
	        		alert("문의 해주셔서 감사합니다. 확인 후 연락드리겠습니다.");
	        });
	    });
    </script>
    <link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.7">
	<link rel="shortcut icon" href="#">
</head>
<body>
	<%@ include file="../etc/header.jsp" %>
	
	<div style="margin:auto;text-align:center;">
	<form style="display:inline-block;" id="regform" method="post" action="${contextPath}/addAsk">
		<h1 style="text-align: center">문의 화면</h1>
		<hr>
		<table>
			<tr style="align-self: center">
				<td><p align="right">이름</td>
				<td><input type="text" name="ask_name" id="ask_name" required></td>
			</tr>
			<tr>
				<td><p align="right">제목</td>
				<td><input type="text" name="ask_title" id="ask_title" required></td>
			</tr>
			<tr>
				<td><p align="right">전화번호</td>
				<td><input type="text" name="ask_phone" id="ask_content" required></td>
			</tr>
			<tr>
				<td><p align="right">이메일</td>
				<td><input type="text" name="ask_email" id="ask_content" style="width: 600px;text-align: left;" required></td>
			
			</tr>
			<tr>
				<td><p align="right">내용</td>
				<td><textarea name="ask_content" id="ask_content" rows="20" cols="70" required ></textarea></td>
			</tr>
			<tr>
				<td><p>&nbsp;</td>
				<td>
				<input type="submit" value="문의하기">
				<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<%@ include file="../etc/footer.jsp" %>
</body>
</html>