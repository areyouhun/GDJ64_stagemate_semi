<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp" %>
<link rel="stylesheet" href="<%= contextPath %>/css/yelin/play/Refund_play.css">
<<<<<<< HEAD
<%@ page import="java.util.List,com.stagemate.detail.model.vo.DetailInfo"%>
<script src="<%=contextPath%>/js/jquery-3.7.0.min.js"></script>
<script src="<%= contextPath %>/js/script_common.js"></script>
<script src="<%=contextPath%>/js/yelin/Refund_play.js"></script>
<script src="<%=contextPath%>/js/yelin/detailList.js"></script>
<title>STAGEMATE</title>
<script>
let rsvNo = '';
let esNo = '';
</script>
</head>
<body>
	<%
	DetailInfo detailInfo = (DetailInfo)request.getAttribute("DetailInfo");
	%>
	<script>
		rsvNo = '<%= detailInfo.getRsvNo()%>';
		esNo = '<%= detailInfo.getEsNo()%>';
	</script>
<%@ include file="/views/common/header.jsp" %>


<section class="min1280px">
    <div id="sectionContainer" class="max1280px">
            
        <h1 id="BookingDetailPlay_title">예매취소</h1>
        <div class="division-line"></div>
        <div class="Refund1_bigchart">
             <!-- 제목 -->
			<p class="play_title"><%=detailInfo.getEventName() %></p>
			<div class="bookchart" id="bookchart2" style="padding: 10px 10px 10px 10px" >
            <div class="ticketbook">
                        <a href='' Title='<%=detailInfo.getEventName() %>'>
                        <img src='../upload/joonho/<%=detailInfo.getFileName() %>' width='180' height='220' alt='' /></a>
            </div>
			<table class="book_info">
                    <tr>
                        <th>예매자</th>
                        <td><%=detailInfo.getMemberNm() %></td>
                    </tr>
                    <tr>
                        <th>예매번호</th>
                        <td><%=detailInfo.getRsvNo() %></td>
                    </tr>
                    <tr>
                        <th>관람일시</th>
                        <td><%=detailInfo.getRsvDate() %></td>
                    </tr>
                    <tr>
                        <th>장소</th>
                        <td><%=detailInfo.getLocation() %></td>
                    </tr>
                    <tr>
                        <th>좌석</th>
                        <td>1층 R석 C열 11번</td>   
                    </tr>
                    <tr>
                        <th>티켓 수령방법</th>
                        <td>현장수령</td>   
                    </tr>   
             </table>
        </div>  
            <h4 class="font-pay">결제내역</h4>
            <table class="pay_chart">
                <tr>
                    <th>예매일</th>
                    <td><%=detailInfo.getRsvDate() %></td>
                    <th>현재상태</th>
                    <td><%=detailInfo.getOrderStatus() %></td>
                </tr>
                <tr>
                    <th>결제수단</th>
                    <td>신용카드[신한카드]</td>
                    <th>결제 금액</th>
                    <td><%=detailInfo.getRsvPirce() %>원</td>
                </tr>
            </table>
        </div>

        <h4 class="rfd-list">환불내역</h4>
        <table class="refund_chart">
            <tr>
                <th>환불 방법</th>
                <td>카드 취소</td>
            </tr>
            <tr>
                <th>환불 금액</th>
                <td><%=detailInfo.getRsvPirce() %>원</td>   
            </tr>
            <tr>
                <th>환불일정</th>
                <td>취소처리 완료 후, 영업일기준 3~4일 뒤에 카드사의 승인취소가 확인됩니다. </td>
            </tr>   
            <tr>
                <td colspan="2" class="under_td2" >총 환불금액:   <%=detailInfo.getRsvPirce() %>원</td>
           </tr>
        </table>
        <div class="warning-msg" >
            <img class="w_m_img" src="<%= contextPath %>/images/yelin/warning.png" style="" >
            <p id="warning-txt">선택하신 예매내역을 취소하시겠습니까?<br>
                예매내역 및 결제내역을 확인하신 후 아래의 <취소하기> 버튼을 누르시면 취소가 완료됩니다.
            </p>
        </div>

        <div class="refund-ckb" align="right" style="padding-right: 170px; padding-top:10px">
            <input type="checkbox" class="refund-ckb"> 환불 금액을 확인하였으며, 이에 동의합니다.  
        </div> 
        
        


        <div class="refund-btn-group">
        <input type="button" class="re-btn3" value="예매내역목록" onclick="location.assign('<%=request.getContextPath()%>/Detail/DetailListServlet.do')"
			value="예매내역목록">
        <input type="button" class="refund-btn" value="취소하기" onclick="cacelDetail('1')">
        </div>
    </div>
        
     </div>  
              
    
    </div>

        
    </section>


<%@ include file="/views/common/footer.jsp" %>
</body>

</html>