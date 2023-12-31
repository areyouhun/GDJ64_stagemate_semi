<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp"%>
<title>STAGEMATE</title>
</head>
<body>
    <div class="MDPlayCancel_bigchart">
        <button type="button" class="btn_close"></button>

        <div class="OrderInfo_txt">  
        <p>결제 취소 요청>스토어</p>
        <div class="MDPC_underline"></div>
        </div> 

        <p class="MCPC_txt">상품 취소, 취소 사유 입력</p>

        <table class="MDPinfo-table">
            <tr>
                <td>구매자명</td>
                <td>김뚜껑</td>
            </tr>
            <tr>
                <td>주문번호</td>
                <td>S123910481</td>
            </tr>
            <tr>
                <td>취소일자 </td>
                <td>2023.05.16</td>
            </tr>
            <tr>
                <td>환불금액</td>
                <td>14,000원</td>
            </tr>
        </table>


  
        <textarea class="MDP-textarea" cols="80" rows="9" maxlength="300" placeholder="취소 사유 입력" style="resize:none;"></textarea>
            <div class="MDP-txtgroup">
                <span style="font-weight:500">0</span>
                <span style="font-weight:350;">/300</span>
            </div>
            <div class="MDP-list-box">
                <button type="button">내역</button>
                <button type="button">취소</button>  
            </div>
    </div>    



<script>
	const closeWin=()=>{
		window.close();
	}
</script>





<style>
 .MDPlayCancel_bigchart{
    margin:auto;
    width:600px;
    height:450px;
    border:0.5px solid lightgrey;
    flex-direction: row;
    margin-top: 15px;
    margin-bottom: 5px;
}
.MDPC_underline{
    border-top: 0.5px solid gray;
    margin:0 auto;
    width: 500px;   
}
.OrderInfo_txt p{
	margin-left: 50px;
	font-weight: bold;
	font-size:18px;
	color: solid lightgrey;
}
.MCPC_txt{
    font-size:14px;
    margin:5px 0px 10px 60px;
}

/* 테이블 */
.MDPinfo-table{
    width:250px;
    height:110px;
    margin-top:20px;
    border-collapse:collapse;
    margin-left: 60px;
}

.MDPinfo-table td{
    padding:2px;
}
.MDPinfo-table td{
    font-weight:bold;
}

.MDPinfo-table tr{
    padding:7px;
}
/* 입력박스 */
.MDP-textarea{
    border-radius: 15px;
    padding: 30px;
    margin-left: 60px;
    margin-top: 25px;
    width: 450px;
    height:100px;
    background-color: #e9ecef;
    border:none;
    resize:none;


}

.MDP-txtgroup{
    margin-left:500px

}


/* 하단버튼 */

.MDP-list-box{
    margin-right:30px;
    float:right;
    margin-top: 10px;

}
.MDP-list-box button:first-child{

    background-color: lightgray;
    border: none;
    padding: 5px 25px;
    font-weight: bold;
    text-decoration: none;
    font-size: 20;
    border-radius: 5px;
    /* margin-left:590px; */
    cursor:pointer;

}

.MDP-list-box button:last-child{
    margin-top: 0px;
    color: white;
    background-color:black;
    border: none;
    padding: 5px 25px;
    font-weight: bold;
    text-decoration: none;
    font-size: 20;
    border-radius: 5px;
    cursor:pointer;
    
   
}
</style>
</body>
<script src="<%=contextPath%>/js/jquery-3.7.0.min.js"></script>
</html>