<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String mainContextPath = request.getContextPath();
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>
    
    <link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.11">
    <link rel="stylesheet" type="text/css" href="../css/reverseCss.css?version=1.4">
	<link rel="shortcut icon" href="#">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"> // 로그인 세션 만료 체크
	var member = '<%= session.getAttribute("member") %>';
		// member에 값이 존재할 때만 인터벌 실행
		if(member != 'null') {
			var timer = setInterval(() => {
					
					var createTime = '<%= session.getAttribute("createTime") %>';
					console.log("세션 접근 시간: " + createTime);
					
					var maxInactiveInterval = '<%= session.getMaxInactiveInterval() * 1000 %>';
					console.log("세션 만료 시간: " + maxInactiveInterval);
					
					var now = new Date().getTime(); // 현재 시간을 millisecond 값으로 치환
					console.log("현재 시간: " + now);
					
					var elapsed = now - createTime;
					console.log("현재 시간 - 세션 마지막 접근 시간: " + elapsed);
					
					if(elapsed > maxInactiveInterval) {
						alert("세션이 만료되었습니다. 다시 로그인해주세요.");
						clearInterval(timer);
						window.location.href = '<%= mainContextPath %>/logout';
					}
				}, 1000);
			}
	</script>
</head>
<body>
	<%@ include file = "../etc/header.jsp" %>

    <div>
        <h1 style="text-align: center">예약 객실 리스트</h1>
        <div class="roominfo">
            <img src="../images/reserve/room1.1.jpg">
            <div>
            <p>디럭스 킹 <span>DELUXE KING</span></p>
            <p id="content">비즈니스 고객에게 적합한 사무 공간과<br>숙면을 위한 편안한 객실입니다.</p>
                <div class="subimages">
                    <img src="../images/reserve/room1.2.jpg">
                    <img src="../images/reserve/room1.3.jpg">
                    <img src="../images/reserve/room1.4.jpg">
                </div>
            </div>
            <button onclick="location.href='${contextPath}/reserve/reserveDetail.jsp?room=room1'">예약하기</button>
        </div>
        
        
        <div class="roominfo">
            <img src="../images/reserve/room2.1.jpg">
            <div>
            <p>디럭스 트윈 <span>DELUXE TWIN</span></p>
            <p id="content">공간의 부드러움을 더하여 업무의 피로를<br>녹일 수 있는 배려가 깃든 객실입니다.</p>
                <div class="subimages">
                    <img src="../images/reserve/room2.2.jpg">
                    <img src="../images/reserve/room2.3.jpg">
                    <img src="../images/reserve/room2.4.jpg">
                </div>
            </div>
            <button onclick="location.href='${contextPath}/reserve/reserveDetail.jsp?room=room2'">예약하기</button>
        </div>
        <div class="roominfo">
            <img src="../images/reserve/room3.1.jpg">
            <div>
            <p>패밀리 스위트 <span>FAMILY SUITE</span></p>
            <p id="content">고급스러운 스위트 룸이 선사하는<br>프리미엄 라이프스타일 공간을 누리세요.</p>
                <div class="subimages">
                    <img src="../images/reserve/room3.2.jpg">
                    <img src="../images/reserve/room3.3.jpg">
                    <img src="../images/reserve/room3.4.jpg">
                </div>
            </div>
            <button onclick="location.href='${contextPath}/reserve/reserveDetail.jsp?room=room3'">예약하기</button>
        </div>
    </div>
    
    <%@ include file = "../etc/footer.jsp" %>
</body>
</html>