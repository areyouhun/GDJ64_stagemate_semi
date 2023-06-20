<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp" %>
<!-- 본인이 따로 적용할 CSS 파일 및 style 태그 -->
<link rel="stylesheet" href="<%=contextPath%>/css/joonho/style_event_payment.css">
<!---------------------------------------->
<title>STAGEMATE/결제</title>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<!-----------   아래에서 HTML 작업  ----------->
<section class="min1280px">
    <div class="max1280px">
        <div id="seat_title">
			<h2>좌석 선택</h2>
			<h3>></h3>
			<h2>결제</h2>
			<h3>></h3>
			<h2>완료</h2>
		</div>
		<hr>
		<!-- 결제 상세정보 -->
		<div id="payment_info">
			<!-- 결제하려는 행사 이미지 -->
			<div>
				<img src="<%=contextPath%>/images/joonho/Narcissus_and_Goldmund.png">
			</div>
			<!-- 결제하려는 행사 예약대기정보 -->
			<div>
				<!-- 제목 -->
				<div id="payment_title">
					<h2>나르치스와 골드문트</h2>
				</div>
				<div id="payment_detail">
					<!-- 상세소제목 -->
					<div>
						<h3>날짜</h3>
						<h3>회차</h3>
						<h3>매수</h3>
						<h3>좌석</h3>
					</div>
					<!-- 상세내용 -->
					<div>
						<h3>2023.05.24(수)</h3>
						<h3>1회 | 19시 30분</h3>
						<h3>4매</h3>
						<h3>1층 A열 10번(VIP석)</h3>
						<h3>1층 C열 6번(R석)</h3>
						<h3>1층 C열 2번(S석)</h3>
						<h3>1층 E열 6번(A석)</h3>
					</div>
				</div>
			</div>
			<div>
				<!-- 주문자 정보 -->
				<div id="payment_buyer">
					<h2>주문자 정보</h2>
					<h3>곽철용</h3>
					<h3>01012345678</h3>
					<h3>irondragon@gmail.com</h3>
				</div>
				<!-- 최종 결제금액 -->
				<div id="payment_final">
					<h1>최종결제 금액</h1>
					<h1>427,000원</h1>
				</div>
				<div id="payment_button">
					<button>이전 단계</button>
					<button onclick="requestPay()">결제하기</button>
				</div>
			</div>
		</div>
		<hr>
		<!-- 취소 관련 안내사항 -->
		<div id="payment_cancel_info">
			<h1>취소 가능 마감 시간 : 2023년 5월 23일</h1>
			<div><h3>취소 수수료 및 취소기한을 확인하였으며, 이에 동의합니다.</h3><input type="checkbox"></div>
			<table id="payment_cancel_tbl">
				<tr>
					<th>내용</th>
					<th>취소수수료</th>
					<th>비고</th>
				</tr>
				<tr>
					<td>예매 후 7일 이내</td>
					<td>없음</td>
					<td rowspan="5"><p>- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지만 환불됩니다.</p>
					<p>- 예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.</p>
					</td>
				</tr>
				<tr>
					<td>예매 후 8일 ~ 관람일 10일 전까지</td>
					<td>뮤지컬,콘서트 등 : 장당 4,000원/<br>연극 등 : 장당 2,000원(단, 티켓 금액의 10%이내)</td>
				</tr>
				<tr>
					<td>관람일 9일 전 ~ 관람일 7일 전까지</td>
					<td>티켓금액의 10%</td>
				</tr>
				<tr>
					<td>관람일 6일 전 ~ 관람일 3일 전까지</td>
					<td>티켓금액의 20%</td>
				</tr>
				<tr>
					<td>관람일 2일 전 ~ 관람일 1일 전까지</td>
					<td>티켓금액의 30%</td>
				</tr>
			</table>
			<div><h2>모두 동의합니다.</h2><input type="checkbox" class="checkall" onclick="checkAll();"></div>
			<div>
				<div><h3>개인정보 수집 및 이용에 동의합니다.</h3><input type="checkbox" name="check"><button>[상세보기]</button></div>
				<div><h3>제3자 정보제공 내용에 동의합니다.</h3><input type="checkbox" name="check"><button>[상세보기]</button></div>
			</div>
		</div>
    </div>
</section>
<!-----------   위에서 HTML 작업  ----------->
<%@ include file="/views/common/footer.jsp" %>
<script src="<%= contextPath %>/js/jquery-3.7.0.min.js"></script>
<script src="<%= contextPath %>/js/script_common.js"></script>
<!-- 본인이 따로 적용할 외부 JS 파일 및 script 태그 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
var IMP = window.IMP; 
IMP.init("imp13225244"); 

var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;


function requestPay() {
    IMP.request_pay({
    	pg: "html5_inicis",
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : '당근 10kg',
        amount : 100,
        buyer_email : 'Iamport@chai.finance',
        buyer_name : '아임포트 기술지원팀',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
    }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
          var msg = '결제가 완료되었습니다.';
          alert(msg);
          location.href = "<%=request.getContextPath()%>/musicalNum1.do"
        } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
          alert(msg);
        }
      });
}

function checkAll() {
	if($(".checkall").is(':checked')) {
		$("input[name=check]").prop("checked", true);
	} else {
		$("input[name=check]").prop("checked", false);
	}
}

</script>
<!-------------------------------------------->
</body>
</html>