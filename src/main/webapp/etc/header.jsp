<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javalab.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	MemberVo member = (MemberVo)session.getAttribute("member");
	String loginUrl = "";
	String reserveUrl = "";
	
	String contextPath = request.getContextPath();
	
	if(member == null) {
		loginUrl = "<a href='" + contextPath + "/loginCheck'>로그인</a>";
		reserveUrl = "<a href='#' onclick='loginCheck();'>";
	} else {
		loginUrl = "<a href='#' onclick='logoutCheck();'>로그아웃</a>";
		reserveUrl = "<a href='../reserve/reserveMain.jsp'>";
	}
	
%>
<script type="text/javascript">
	function logoutCheck() {
		if(confirm("로그아웃 하시겠습니까?")) {
			alert("로그아웃 되었습니다.");
			window.location.href = '<%= contextPath %>/logout';
		} else {
			alert("취소되었습니다.");
		}
	}
	
	function loginCheck() {
		if(sessionStorage.getItem("member") === null) {
			alert("로그인이 필요한 기능입니다.");
			window.location.href = '<%= contextPath %>/loginCheck';
		}
	}
</script>
<table width="100%" bgcolor="#F29661" class="header">
        <tr>
            <th><%= loginUrl %></th>
            <th><a href="${contextPath}/room/Roominfo.jsp">객실정보</a></th>
            <th><%= reserveUrl %>예약</a></th>
            <th><a href="${contextPath}/main/main.jsp"><img src="${contextPath}/images/main/logo_white.png" width="110" height="110"></a></th>
            <th><a href="${contextPath}/ask/askform.jsp">고객의소리</a></th>
            <th><a href="${contextPath}/reserve/reserveCheckForm.jsp">예약내역</a></th>
            <th><a href="<%=request.getContextPath()%>/boardList">이용후기</a></th>
            <th><a href="${contextPath}/join/join.jsp">회원가입</a></th>
        </tr>
</table>
