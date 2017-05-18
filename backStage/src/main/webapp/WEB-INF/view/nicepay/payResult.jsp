<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="kr.co.nicepay.module.lite.NicePayWebConnector"%>
<%@ page import="com.bs.models.PayHistVO" %>
<%@ page import="com.bs.payment.PaymentService" %>
<%
request.setCharacterEncoding("euc-kr"); 

/*
*******************************************************
* <결제 결과 설정>
* 사용전 결과 옵션을 사용자 환경에 맞도록 변경하세요.
* 로그 디렉토리는 꼭 변경하세요.
*******************************************************
*/
NicePayWebConnector connector = new NicePayWebConnector();
// String nicePayHome = "C:/workspace/server/tomcat_8.0/webapps/ROOT/NICEPAY_Lite_JSP/WEB-INF/";   // 모듈 WEB-INF Path 설정
String nicePayHome = request.getSession().getServletContext().getRealPath("/WEB-INF/");
String requestMid = request.getParameter("MID");

connector.setNicePayHome(nicePayHome);                              // 로그 디렉토리 생성
connector.setRequestData(request);                                  // 요청 페이지 파라메터 셋팅
connector.addRequestData("MID", requestMid);                        // 상점아이디
connector.addRequestData("actionType", "PY0");                      // 서비스모드 설정(결제 서비스 : PY0 , 취소 서비스 : CL0)
connector.addRequestData("MallIP", request.getRemoteAddr());        // 상점 고유 ip
connector.addRequestData("CancelPwd", "123456");                    // 취소 비밀번호
connector.requestAction();

/*
*******************************************************
* <결제 결과 필드>
* 아래 응답 데이터 외에도 전문 Header와 개별부 데이터 Get 가능
*******************************************************
*/
PayHistVO payHistVO = new PayHistVO();
payHistVO.setResult_code(connector.getResultData("ResultCode"));
payHistVO.setResult_msg(connector.getResultData("ResultMsg"));
payHistVO.setAuth_date(connector.getResultData("AuthDate"));
payHistVO.setAuth_code(connector.getResultData("AuthCode"));
payHistVO.setBuyer_name(connector.getResultData("BuyerName"));
payHistVO.setMall_user_id(connector.getResultData("MallUserID"));
payHistVO.setPay_method(connector.getResultData("PayMethod"));
payHistVO.setMid(connector.getResultData("MID"));
payHistVO.setTid(connector.getResultData("TID"));
payHistVO.setMoid(connector.getResultData("Moid"));
payHistVO.setAmt(connector.getResultData("Amt"));
payHistVO.setGoods_name(connector.getResultData("GoodsName"));
payHistVO.setCard_code(connector.getResultData("CardCode"));
payHistVO.setCard_name(connector.getResultData("CardName"));
payHistVO.setCard_quota(connector.getResultData("CardQuota"));
payHistVO.setBank_code(connector.getResultData("BankCode"));
payHistVO.setBank_name(connector.getResultData("BankName"));
payHistVO.setRcpt_type(connector.getResultData("RcptType"));
payHistVO.setRcpt_auth_code(connector.getResultData("RcptAuthCode"));
payHistVO.setRcpt_tid(connector.getResultData("RcptTID"));
payHistVO.setCarrier(connector.getResultData("Carrier"));
payHistVO.setDst_addr(connector.getResultData("DstAddr"));
payHistVO.setVbank_bank_code(connector.getResultData("VbankBankCode"));
payHistVO.setVbank_bank_name(connector.getResultData("VbankBankName"));
payHistVO.setVbank_num(connector.getResultData("VbankNum"));
payHistVO.setVbank_exp_date(connector.getResultData("VbankExpDate"));


String resultCode    = connector.getResultData("ResultCode");       // 결과코드 (정상 결과코드:3001)
// String resultMsg     = connector.getResultData("ResultMsg");        // 결과메시지
// String authDate      = connector.getResultData("AuthDate");         // 승인일시 (YYMMDDHH24mmss)
// String authCode      = connector.getResultData("AuthCode");         // 승인번호
// String buyerName     = connector.getResultData("BuyerName");        // 구매자명
// String mallUserID    = connector.getResultData("MallUserID");       // 회원사고객ID
String payMethod     = connector.getResultData("PayMethod");        // 결제수단
// String mid           = connector.getResultData("MID");              // 상점ID
// String tid           = connector.getResultData("TID");              // 거래ID
// String moid          = connector.getResultData("Moid");             // 주문번호
// String amt           = connector.getResultData("Amt");              // 금액
// String goodsName     = connector.getResultData("GoodsName");        // 금액
// String cardCode      = connector.getResultData("CardCode");         // 카드사 코드
// String cardName      = connector.getResultData("CardName");         // 결제카드사명
// String cardQuota     = connector.getResultData("CardQuota");        // 카드 할부개월 (00:일시불,02:2개월)
// String bankCode      = connector.getResultData("BankCode");         // 은행 코드
// String bankName      = connector.getResultData("BankName");         // 은행명
// String rcptType      = connector.getResultData("RcptType");         // 현금 영수증 타입 (0:발행되지않음,1:소득공제,2:지출증빙)
// String rcptAuthCode  = connector.getResultData("RcptAuthCode");     // 현금영수증 승인 번호
// String rcptTID       = connector.getResultData("RcptTID");          // 현금 영수증 TID   
// String carrier       = connector.getResultData("Carrier");          // 이통사구분
// String dstAddr       = connector.getResultData("DstAddr");          // 휴대폰번호
// String vbankBankCode = connector.getResultData("VbankBankCode");    // 가상계좌은행코드
// String vbankBankName = connector.getResultData("VbankBankName");    // 가상계좌은행명
// String vbankNum      = connector.getResultData("VbankNum");         // 가상계좌번호
// String vbankExpDate  = connector.getResultData("VbankExpDate");     // 가상계좌입금예정일



/*
*******************************************************
* <결제 성공 여부 확인>
*******************************************************
*/
boolean paySuccess = false;
if(payMethod.equals("CARD")){
	if(resultCode.equals("3001")) {
		paySuccess = true;	            // 신용카드(정상 결과코드:3001)
	}
}else if(payMethod.equals("BANK")){
	if(resultCode.equals("4000")) paySuccess = true;	            // 계좌이체(정상 결과코드:4000)	
}else if(payMethod.equals("CELLPHONE")){
	if(resultCode.equals("A000")) paySuccess = true;	            // 휴대폰(정상 결과코드:A000)
}else if(payMethod.equals("VBANK")){	
	if(resultCode.equals("4100")) paySuccess = true;	            // 가상계좌(정상 결과코드:4100)
}

/*
*******************************************************
* k.park <결제 성공 후 데이터 플로우>
*******************************************************
*/
if(paySuccess == true){
	PaymentService paymentService = new PaymentService();
	paymentService.insertPayHist(payHistVO);	
}
%>
<!DOCTYPE html>
<html>
<head>
<title>NICEPAY PAY RESULT</title>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/payment/import.css"/>
</head>
<body> 
  <div class="payfin_area">
    <div class="top">결제 결과 샘플</div>
    <div class="conwrap">
      <div class="con">
        <div class="tabletypea">
          <table>
            <colgroup><col width="30%"/><col width="*"/></colgroup>
              <td>
                <tr>
                  <th><span>결과 내용</th>
                  <td>[<%=resultCode%>]<%=resultMsg%></td>
                </tr>
                <tr>
                  <th><span>결제 수단</th>
                  <td><%=payMethod%></td>
                </tr>
                <tr>
                  <th><span>상품명</th>
                  <td><%=goodsName%></td>
                </tr>
                <tr>
                  <th><span>금액</th>
                  <td><%=amt%>원</td>
                </tr>
                <tr>
                  <th><span>거래아이디</th>
                  <td><%=tid%></td>
                </tr>               
                <%if(payMethod.equals("CARD")){%>
                  <tr>
                    <th><span>카드사명</th>
                    <td><%=cardName%></td>
                  </tr>
                  <tr>
                    <th><span>할부개월</th>
                    <td><%=cardQuota%></td>
                  </tr>
                <%}else if(payMethod.equals("BANK")){%>
                  <tr>
                    <th><span>은행</th>
                    <td><%=bankName%></td>
                  </tr>
                  <tr>
                    <th><span>현금영수증 타입</th>
                    <td><%=rcptType%>(0:발행안함,1:소득공제,2:지출증빙)</td>
                  </tr>
                <%}else if(payMethod.equals("CELLPHONE")){%>
                  <tr>
                    <th><span>이통사 구분</th>
                    <td><%=carrier%></td>
                  </tr>
                  <tr>
                    <th><span>휴대폰 번호</th>
                    <td><%=dstAddr%></td>
                  </tr>
                <%}else if(payMethod.equals("VBANK")){%>
                  <tr>
                    <th><span>입금 은행</th>
                    <td><%=vbankBankName%></td>
                  </tr>
                  <tr>
                    <th><span>입금 계좌</th>
                    <td><%=vbankNum%></td>
                  </tr>
                  <tr>
                    <th><span>입금 기한</th>
                    <td><%=vbankExpDate%></td>
                  </tr>
                <%}%>
            </td>
          </table>
        </div>
      </div>
      <p>*테스트 아이디인경우 당일 오후 11시 30분에 취소됩니다.</p>
    </div>
  </div>
</body>
</html>