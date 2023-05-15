<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javalab.dao.*, com.javalab.vo.*" %>
<!doctype html>
<%

	String room_id = request.getParameter("room");
	String img_src = "";
	String room_name = "";
	String room_name_korean = "";
	
	String hotel_name = "EZEN_HOTEL";
	
	switch(room_id) {
	case "room1":
		img_src = "../images/reserve/room1.1.jpg";
		room_name = "DELUXE KING";
		room_name_korean = "디럭스 킹 ";
		break;
	case "room2":
		img_src = "../images/reserve/room2.1.jpg";
		room_name = "DELUXE TWIN";
		room_name_korean = "디럭스 트윈 ";
		break;
	case "room3":
		img_src = "../images/reserve/room3.1.jpg";
		room_name = "FAMILY SUITE";
		room_name_korean = "패밀리 스위트 ";
		break;
	}
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예약 화면</title>
    
    <link rel="stylesheet" type="text/css" href="../css/mainCss.css?version=1.11">
    <link rel="stylesheet" type="text/css" href="../css/reverseDetailCss.css?1.0" >
	<link rel="shortcut icon" href="#">
	
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	$(document).ready(function() {
    		setCheckinToday();
    		
    		
    		$('#checkin').change(function() {
    			console.log($('#checkin').val());
    			getDiffDay();
    		});
    		
    		$('#checkout').change(function() {
    			console.log($('#checkout').val());
    			getDiffDay();
    		});
    		
    		
    	}); // end (document).ready
    	
    	function getDiffDay() {
    		const date1 = new Date($('#checkin').val());
    		const date2 = new Date($('#checkout').val());
    		//console.log("첫 번째 날짜 : " + date1);
    		//console.log("두 번째 날짜 : " + date2);
    		// 체크인 날짜가 체크아웃 날짜보다 뒤에 있는 경우
    		if(date1 != "" && date2 != "") {
    			if(date1 > date2) {
        			alert("체크인하는 날짜는 체크아웃하는 날보다 많을 수 없습니다.");
        			$('#checkin').val("");
        			$('#checkout').val("");
        			$('#diffDay').text("");
        			return;
        		}
    			
    			const diffTime = Math.abs(date2 - date1);
        		//console.log("두 날짜의 차이(절댓값) : " + diffTime);
        		
        		const diffDay = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        		//console.log("두 날짜의 차이(일수) : " + diffDay);
        		// 날짜 데이터는 millisecond(1000분의 1초)로 표현된다.
        		// 1000(1초) * 60(1분) * 60(1시간) * 24(24시간 = 하루)
        		if(diffDay > 0) {
        			$('#diffDay').text(diffDay + '박');
        		}
        		
    		}
    	} // end getDiffDay()
    	
    	function getToday() {
    		const today = new Date();
    		const year = today.getFullYear();
    		const month = '0' + (today.getMonth() + 1);
    		const day = today.getDate();
    		const minDate = year + "-" + month + "-" + day;
    		
    		const today2 = new Date().toISOString().substr(0, 10);

   
    		return minDate;
    	} // end getToday(
    	
    	// 체크인 날짜를 오늘 보다 이전으로 선택할 수 없도록 설정
    	function setCheckinToday() {
    		const todayString = getToday();
    		$('#checkin').attr("min", todayString);
    		$('#checkout').attr("min", todayString);
    	} // end setCheckinToday()
    	
    	// 인원 추가
    	function addPerson() {
    		var num = $('#numOfUser').val();
    		num ++;
    		if(num >= 4) {
    			num = 4;
    		}
    		
    		$('#numOfUser').val(num);
    	}
    	
    	// 인원 감소
    	function minusPerson() {
    		var num = $('#numOfUser').val();
    		num --;
    		if(num <= 1) {
    			num = 1;
    		}
    		
    		$('#numOfUser').val(num);
    	}
    	
    	
    </script>
  </head>
  <body>
  	  <%@ include file = "../etc/header.jsp" %>
  
      <div class="container">
          <div class="reserveTitle">
              <div id="title"><%= room_name_korean %><span id="subtitle"><%= room_name %></span></div>
              <div id="menu">예약 화면</div>
              <hr>
              <div id="body">
                  <img src=<%= img_src %> />
                  <div class="centerd">
                      <table>
                          <tr>
                              <td><label for="hotelName">호텔이름</label></td>
                              <td><label for="roomName">객실종류</label></td>
                              <td><label for="checkin">체크인</label></td>
                              <td><label id="diffDay" style="color: green"></label></td>
                              <td><label for="checkout">체크아웃</label></td>
                              <td><label for="numOfuser">인원</label></td>
                          </tr>
                          <tr>
                              <td><input id="hotelName" name="hotelName" type="text" value=<%= hotel_name %> disabled readonly></td>
                              <td><input id="roomName" name="roomName" type="text" value='<%= room_name %>' disabled readonly></td>
                              <td><input id="checkin" name="checkin" type="date" min="YYYY-MM-DD"></td>
                              <td></td>
                              <td><input id="checkout" name="checkout" type="date"></td>
                              <td><input id="numOfUser" name="numOfuser" type="number" value="1" readonly></td>
                              <td>
                                  <button onclick="minusPerson();">-</button>
                                  <button onclick="addPerson();">+</button>
                              </td>
                          </tr>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      
      <%@ include file = "../etc/footer.jsp" %>
  </body>
</html>