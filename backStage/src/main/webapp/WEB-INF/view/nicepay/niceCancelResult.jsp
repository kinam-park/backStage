<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="kr.co.nicepay.module.lite.NicePayWebConnector"%>
<%@ page import="kr.co.nicepay.module.lite.util.NicePayUtils"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
/*
*******************************************************
* <취소 결과 설정>
* 사용전 결과 옵션을 사용자 환경에 맞도록 변경하세요.
* 로그 디렉토리는 꼭 변경하세요.
*******************************************************
*/
NicePayWebConnector connector = new NicePayWebConnector();
String requestMid = request.getParameter("MID");
connector.setRequestData(request);

// connector.setNicePayHome("C:/workspace/server/tomcat_8.0/webapps/ROOT/NICEPAY_Lite_JSP/WEB-INF"); // 로그 디렉토리 설정
connector.setNicePayHome(request.getSession().getServletContext().getRealPath("/WEB-INF/")); // 로그 디렉토리 설정
connector.addRequestData("MID", requestMid);                        //상점 ID
connector.addRequestData("CancelIP", request.getRemoteAddr());      //취소 IP
connector.addRequestData("actionType", "CL0");                      // 서비스모드 설정(결제 서비스 : PY0 , 취소 서비스 : CL0)
connector.requestAction();

/*
*******************************************************
* <취소 결과 필드>
*******************************************************
*/
String resultCode = connector.getResultData("ResultCode");          // 결과코드 (취소성공: 2001, 취소진행중: 2002)
String resultMsg  = connector.getResultData("ResultMsg");           // 결과메시지
String cancelAmt  = connector.getResultData("CancelAmt");           // 취소금액
String cancelDate = connector.getResultData("CancelDate");          // 취소일
String cancelTime = connector.getResultData("CancelTime");          // 취소시간
String cancelNum  = connector.getResultData("CancelNum");           // 취소번호
String payMethod  = connector.getResultData("PayMethod");           // 취소 결제수단
String mid        = connector.getResultData("MID");                 // 상점 ID
String tid        = connector.getResultData("TID");                 // TID
String errorCD    = connector.getResultData("ErrorCD");             // 상세 에러코드
String errorMsg   = connector.getResultData("ErrorMsg");            // 상세 에러메시지
String authDate   = connector.getResultData("AuthDate");            // 거래시간

%>
<!DOCTYPE html>
<html>
<head>
<title>NICEPAY CANCEL RESULT</title>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/payment/import.css"/>
</head>
<body>
  <div class="payfin_area">
    <div class="top">취소 결과 샘플</div>
    <div class="conwrap">
      <div class="con">
        <div class="tabletypea">
          <table>
            <tr>
              <th><span>거래 아이디</th>
              <td><%=tid%></td>
            </tr>
            <tr>
              <th><span>결제 수단</th>
              <td><%=payMethod%></td>
            </tr>         
            <tr>
              <th><span>결과 내용</th>
              <td>[<%=resultCode%>]<%=resultMsg%></td>
            </tr>
            <tr>
              <th><span>취소 금액</th>
              <td><%=cancelAmt%></td>
            </tr>
            <tr>
              <th><span>취소일</th>
              <td><%=cancelDate%></td>
            </tr>
            <tr>
              <th><span>취소시간</th>
              <td><%=cancelTime%></td>
            </tr>
          </table>
        </div>
      </div>
      <p>* 취소가 성공한 경우에는 다시 승인상태로 복구 할 수 없습니다.</p>
    </div>
  </div>
</body>
</html>