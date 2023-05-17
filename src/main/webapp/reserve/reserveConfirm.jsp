<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%	
	String mainContextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function reservationConfirmed() {
        	if(confirm("예약을 확정하시겠습니까?")) {
        		alert("예약이 완료되었습니다.");
                $('#completeForm').submit();
        	} else {
        		alert("내용을 확인 후 확정을 눌러주세요.");
        	}
            
        }
    </script>
    
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/mainCss.css?version=1.7">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/reserveConfirmCss.css">
</head>
<body>
	  <%@ include file="../etc/header.jsp" %>
	
  	  <div class="reserveContainer">
  	      <div class="centerd">
              <font size="10"> 예약 내용 확인 </font>
  	      </div>
  	      <hr style="width: 900px;">
  	      <div>
  	      <form id="completeForm" action="${contextPath}/reserveComplete" method="post">
  	          <table id="table">
                  <tr>
                      <td id="td1"><label>호텔이름</label></td>
                      <td id="td2"><label><c:out value="${requestScope.reserveInfo.hotelName}"/></label></td>
                  </tr>
                  <tr>
                      <td id="td1"><label>객실종류</label></td>
                      <td id="td2"><label><c:out value="${requestScope.reserveInfo.roomName}"/></label></td>
                  </tr>
                  <tr>
                      <td id="td1"><label>체크인</label></td>
                      <td id="td2"><label><c:out value="${requestScope.reserveInfo.checkin}"/></label></td>
                  </tr>
                  <tr>
                      <td id="td1"><label>체크아웃</label></td>
                      <td id="td2"><label><c:out value="${requestScope.reserveInfo.checkout}"/></label></td>
                  </tr>
                  <tr>
                      <td id="td1"><label>기간</label></td>
                      <td id="td2"><label><c:out value="${requestScope.reserveInfo.diffDay}"/></label></td>
                  </tr>
                  <tr>
                      <td id="td1"><label>수용인원</label></td>
                      <td id="td2"><label><c:out value="${requestScope.reserveInfo.numOfuser}명"/></label></td>
                  </tr>
                  <tr>
                  	  <td id="td1"><label> 결제금액 </label></td>
                  	  <td id="td2"><label style="font-weight: bold;"><c:out value="${requestScope.reserveInfo.price}" />원</label></td>
                  </tr>
  	          </table>
  	          <input name="hotelName" type="hidden" value="${requestScope.reserveInfo.hotelName}">
              <input name="roomName" type="hidden" value="${requestScope.reserveInfo.roomName}">
              <input name="checkin" type="hidden" value="${requestScope.reserveInfo.checkin}">
              <input name="checkout" type="hidden" value="${requestScope.reserveInfo.checkout}">
              <input name="diffDay" type="hidden" value="${requestScope.reserveInfo.diffDay}">
              <input name="numOfuser" type="hidden" value="${requestScope.reserveInfo.numOfuser}">
              <input name="user_id" type="hidden" value="${requestScope.reserveInfo.user_id}">
  	     </form>
  	          <div id="button">
  	              <button type="button" onclick="reservationConfirmed();">예약확정</button>
  	          </div>
  	          <hr style="width: 900px; margin-top: 30px;">
  	      </div>
  	  </div>
  	  
  	  <%@ include file="../etc/footer.jsp" %>
</body>
</html>