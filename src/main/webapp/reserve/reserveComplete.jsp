<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .completeContainer {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
            margin: 10%;
        }
        .completeContainer #centerd {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 60px;
        }
        .completeContainer label {
            font-size: 20px;
        }
        .completeContainer #reserveNumber {
            font-size: 25px;
            margin-left: 20px;
            margin-right: 20px;
            
            text-align: center;
            height: 40px;
            width: 200px;
        }
        .completeContainer #copyButton {
            font-size: 20px;
            background-color: azure;
            border: 2px solid grey;
            width: 60px;
            height: 45px;
        }
        .completeContainer #copyButton:hover {
            cursor: pointer;
        }
        .completeContainer table tr td {
            display: flex;
            align-items: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function copyValue() {
            const data = $('#reserveNumber').val();
            
            navigator.clipboard.writeText(data)
            .then(() => {
                alert("클립보드에 복사되었습니다.");
            })
            .catch(() => {
                alert("클립보드 저장에 실패했습니다.");
            })
            
        }
    </script>
</head>
<body>
    <div class="completeContainer">
        <div id="title">
            <div><font size="8">예약이 완료 되었습니다.</font></div>
            <div id="centerd">
                <table>
                    <tr>
                        <td>
                            <label for="reserveNumber">예매번호</label>
                            <input id="reserveNumber" type="text" value="<c:out value='${requestScope.reserveNo}' />" readonly>
                            <button id="copyButton" type="button" onclick="copyValue();">복사</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>