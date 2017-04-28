<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="kr.co.nicepay.module.lite.util.NicePayParamSetter"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.Date"%>
<%
/*
*******************************************************
* <결제요청 파라미터>
* 결제시 Form 에 보내는 결제요청 파라미터입니다.
* 샘플페이지에서는 기본(필수) 파라미터만 예시되어 있으며, 
* 추가 가능한 옵션 파라미터는 연동메뉴얼을 참고하세요.
*******************************************************
*/
String merchantKey      = "33F49GnCMS1mFYlGXisbUDzVf2ATWCl9k3R++d5hDd3Frmuos/XLx8XhXpe+LDYAbpGKZYSwtlyyLOtS/8aD7A==";   // 상점키
String merchantID       = "nictest00m";                      // 상점아이디
// String goodsCnt         = "1";                               // 결제상품개수
// String goodsName        = "나이스페이";                      // 결제상품명
// String price            = "1004";                            // 결제상품금액	
// String buyerName        = "나이스";                          // 구매자명
// String buyerTel         = "010-8638-1719";                   // 구매자연락처
// String buyerEmail       = "bleach87@naver.com";                 // 구매자메일주소
// String moid             = "mnoid1234567890";                 // 상품주문번호	
// String encodeParameters = "CardNo,CardExpire,CardPwd";       // 암호화대상항목 (변경불가)   
    
/*
*******************************************************
* <해쉬암호화> (수정하지 마세요)
* MD5 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
*******************************************************
*/    
NicePayParamSetter paramSetter = new NicePayParamSetter();	
String ediDate = paramSetter.getyyyyMMddHHmmss();
String md_src = ediDate + merchantID + price + merchantKey;
String hash_String  = paramSetter.encrypt(md_src);
    
/*
******************************************************* 
* <서버 IP값>
*******************************************************
*/
InetAddress inet= InetAddress.getLocalHost();	    
%>
<!DOCTYPE html>
<html>
<head>
<title>NICEPAY PAY REQUEST</title>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/payment/import.css"/>
<script src="https://web.nicepay.co.kr/flex/js/nicepay_tr_ns_utf.js" type="text/javascript"></script>
<script type="text/javascript">
//결제창 최초 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
function nicepayStart(){
    document.getElementById("vExp").value = getTomorrow();
    goPay(document.payForm);
}

//결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
function nicepaySubmit(){
    document.payForm.submit();
}

//결제창 종료 함수 <<'nicepayClose()' 이름 수정 불가능>>
function nicepayClose(){
    alert("결제가 취소 되었습니다");
}

//가상계좌입금만료일 설정 (today +1)
function getTomorrow(){
    var today = new Date();

    var yyyy = today.getFullYear().toString();
    var mm = (today.getMonth()+1).toString();
    var dd = (today.getDate()+1).toString();
    if(mm.length < 2){mm = '0' + mm;}
    if(dd.length < 2){dd = '0' + dd;}
    return (yyyy + mm + dd);
}
</script>
</head>
<body>
<form name="payForm" method="post" action="payResult">
    <div class="payfin_area">
      <div class="top">결제 요청 샘플</div>
      <div class="conwrap">
        <div class="con">
          <div class="tabletypea">
            <table>
              <colgroup><col width="30%" /><col width="*" /></colgroup>
              <tr>
                <th><span>결제 수단</span></th>
                <td>
                  <select name="PayMethod">
                    <option value="CARD">신용카드</option>
                    <option value="BANK">계좌이체</option>
                    <option value="CELLPHONE">휴대폰결제</option>
                    <option value="VBANK">가상계좌</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th><span>결제 상품명</span></th>
                <td><input type="text" name="GoodsName" value="<%=goodsName%>"></td>
              </tr>			  
              <tr>
                <th><span>결제 상품개수</span></th>
                <td><input type="text" name="GoodsCnt" value="<%=goodsCnt%>"></td>
              </tr>	  
              <tr>
                <th><span>결제 상품금액</span></th>
                <td><input type="text" name="Amt" value="<%=price%>"></td>
              </tr>	  
              <tr>
                <th><span>구매자명</span></th>
                <td><input type="text" name="BuyerName" value="<%=buyerName%>"></td>
              </tr>	  
              <tr>
                <th><span>구매자 연락처</span></th>
                <td><input type="text" name="BuyerTel" value="<%=buyerTel%>"></td>
              </tr>    
              <tr>
                <th><span>상품 주문번호</span></th>
                <td><input type="text" name="Moid" value="<%=moid%>"></td>
              </tr>	  
              <tr>
                <th><span>상점 아이디</span></th>
                <td><input type="text" name="MID" value="<%=merchantID%>"></td>
              </tr>             
              
              <!-- 소켓이용유무 & IP값 -->
              <input type="hidden" name="UserIP" value="<%=request.getRemoteAddr()%>"/>    <!-- 회원사고객IP -->
              <input type="hidden" name="MallIP" value="<%=inet.getHostAddress()%>"/>      <!-- 상점서버IP -->
              
              <!-- 결제 관련 옵션 파라메터 -->
              <input type="hidden" name="VbankExpDate" id="vExp"/>                         <!-- 가상계좌입금만료일 -->
              <input type="hidden" name="BuyerEmail" value="<%=buyerEmail%>"/>             <!-- 구매자 이메일 -->				  
              <input type="hidden" name="GoodsCl" value=""/>                               <!-- 상품구분 -->
              
              <!-- 일반(0)/에스크로(1) 선택 파라미터 -->
              <input type="hidden" name="TransType" value="0"/> 
              
              <!-- 변경 불가능 -->
              <input type="hidden" name="EncodeParameters" value="<%=encodeParameters%>"/> <!-- 암호화대상항목 -->
              <input type="hidden" name="EdiDate" value="<%=ediDate%>"/>                   <!-- 전문 생성일시 -->
              <input type="hidden" name="EncryptData" value="<%=hash_String%>"/>           <!-- 해쉬값	-->
              <input type="hidden" name="TrKey" value=""/>                                 <!-- 필드만 필요 -->
              <input type="hidden" name="MerchantKey" value="<%=merchantKey%>"/>           <!-- 상점 키 -->
            </table>
          </div>
        </div>
        <div class="btngroup">
          <a href="#" class="btn_blue" onClick="nicepayStart();">요 청</a>
        </div>
      </div>
    </div>
</form>
</body>
</html>