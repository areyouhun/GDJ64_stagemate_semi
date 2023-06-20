<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp"%>
<!-- 본인이 따로 적용할 CSS 파일 및 style 태그 -->
<link rel="stylesheet"
	href="<%=contextPath%>/css/joonho/style_event.css">
<!---------------------------------------->
<title>페이지 타이틀 입력</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
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
			<!-- 좌석배치 -->
			<div id="seat_main">
				<div id="first_seat">
					<div>
						<h2>STAGE</h2>
						<div id="seatMap1F">
							<!-- 좌석 표시를 위한 공간 -->
						</div>
						<div id="wheelchair_seat">
							<div>
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
							</div>
							<div>
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
								<img src="<%=contextPath%>/images/joonho/wheelchair.png">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 좌석 선택창 -->
			<div id="seat_choice">
				<!-- 좌석등급/가격 -->
				<div id="seat_class_price">
					<h2>좌석등급/가격</h2>
					<hr>
					<div>
						<div class="seat unavailable" style="background-color: #008B2F"></div>
						<h3>전석 : 50,000원</h3>
						<h3>(잔여 : 56석)</h3>
					</div>
				</div>
				<!-- 선택한좌석 -->
				<div id="select_seat">
					<h2>선택한 좌석</h2>
					<hr>
					<div id="selectedSeat"></div>
				</div>
				<!-- 선택 버튼 -->
				<div id="seat_choice_button">
					<div>
						<button onclick="prev_page();">이전 단계</button>
						<button onclick="seat_reset();">좌석 초기화</button>
					</div>
					<button>좌석선택 완료</button>
				</div>
			</div>
		</div>
	</section>
	<!-----------   위에서 HTML 작업  ----------->
	<%@ include file="/views/common/footer.jsp"%>
	<script src="<%=contextPath%>/js/jquery-3.7.0.min.js"></script>
	<script src="<%=contextPath%>/js/script_common.js"></script>
	<!-- 본인이 따로 적용할 외부 JS 파일 및 script 태그 -->
	<script>
	 let countSeat=0;
	 $(document).ready(function () {
         // 좌석 맵 배열
         var seatMap = [
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
        	 [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
         ];

         // 선택한 좌석 변수
         var selectedSeat = null;

         // 좌석 맵 생성
         var seatMapElement = $("#seatMap1F");
            for (var i = 0; i < seatMap.length; i++) {
            	let count=1;
                var rowElement = $("<div>").addClass("row");
                for (var j = 0; j < seatMap[i].length; j++) {
                    var seatClass = seatMap[i][j] === 1 ? "seat" : "seat unavailable";
                    if(seatMap[i][j] === 0){
                    	count++;
                    }
                    var seatElement = $("<div>").addClass(seatClass)
                    if(!seatElement.hasClass("unavailable")){
                    	seatElement.css({"backgroundColor":"var(--sm-brown)","color":"white","fontSize":"120%"});
                    	if(i==0&&(j==4||j==16)){
                    		seatElement.text("A").addClass("unavailable");
                    	}else if(i==1&&(j==4||j==16)){
                    		seatElement.text("B").addClass("unavailable");
                    	}else if(i==2&&(j==4||j==16)){
                    		seatElement.text("C").addClass("unavailable");
                    	}else if(i==3&&(j==4||j==16)){
                    		seatElement.text("D").addClass("unavailable");
                    	}else if(i==4&&(j==4||j==16)){
                    		seatElement.text("E").addClass("unavailable");
                    	}else if(i==5&&(j==4||j==16)){
                    		seatElement.text("F").addClass("unavailable");
                    	}else if(i==6&&(j==4||j==16)){
                    		seatElement.text("G").addClass("unavailable");
                    	}else if(i==7&&(j==4||j==16)){
                    		seatElement.text("H").addClass("unavailable");
                    	}else if(i==8&&(j==4||j==16)){
                    		seatElement.text("I").addClass("unavailable");
                    	}else{
                    		seatElement.css({"backgroundColor":"#008B2F"}).append("<div style='display: none'>"+String.fromCharCode([65+i])+"열"+count+"번</div>");
                    		count++;
                    	}
                    }	
                    seatElement.on("click", function () {
                        selectSeat($(this));
                    });
                    rowElement.append(seatElement);
                }
                seatMapElement.append(rowElement);
            }


         // 좌석 선택 시 동작
       	 
       	
         function selectSeat(seat) {
	             if (seat.hasClass("seat")) {
	                  if (seat.hasClass("selected")) {
	                     seat.removeClass("selected");
	                     seat.children().remove("p");
	                   	 $("#selectedSeat").children().each((i,v)=>{
	                   		 const value=$(v).text();
	                   		if(value==(seat.text()+"X")){
	                   			v.remove();
	                   			countSeat--;
	                   		}
	                   	 });
	                 }else{
	                	 if(countSeat<5){
		                 	seat.addClass("selected");
		            		 $("#selectedSeat").append("<div><div>"+seat.text()+'</div><button id="reser_cancel">X</button></div>');
		                 	seat.append("<p>V</p>");
		                 	countSeat++;
	                	 }else{
	                		 alert("5개 이하!!!");
	                	 }
	                 }
	             }
        	 
         }
         $(document).on("click", "#reser_cancel", function () {
        	 $("#seatMap2F>div>div>div").each((i,v)=>{
        		 if($(v).text()==$(this).prev().text()){
        			 $(v).parent().removeClass("selected");
        			 $(v).parent().children().remove("p");
        			 countSeat--;
        		 }
           	 });
       		 $("#seatMap1F>div>div>div").each((i,v)=>{
           		 if($(v).text()==$(this).prev().text()){
           			 $(v).parent().removeClass("selected");
           			 $(v).parent().children().remove("p");
           			 countSeat--;
           		 }
        	 });
       		 $(this).parent().remove()
         });
	 });
	 
	 const seat_reset=()=>{
		 $("#selectedSeat").children().remove();
		 $("#seatMap2F>div>div>div").each((i,v)=>{
   			 $(v).parent().removeClass("selected");
   			 $(v).parent().children().remove("p");
		 });
   		 $("#seatMap1F>div>div>div").each((i,v)=>{
   			 $(v).parent().removeClass("selected");
   			 $(v).parent().children().remove("p");
       	 });
   		countSeat=0;
	 };
	 function prev_page() {
			location.replace(getContextPath() + "/musicalNum1.do");
		}
	</script>
	<style>
	#seat_class_price>div h3{
		font-size: 16px;
	}
	#seat_choice_button{
		width:26%;
	}
	#seat_choice_button>button{
		border: none;
		background-color: var(--sm-yellow);
		width:100%;
		height:60px;
		border-radius: 15px;
		margin-top: 2%;
		font-size: 25px;
		font-weight:bolder;
		color:var(--sm-brown);
	}
	#seat_choice_button button{
		cursor: pointer;
	}
	#seat_choice_button>div>button{
		border-radius: 15px;
		background-color: white;
		width:49%;
		height: 56px;
		font-size: 21px;
		font-weight:bolder;
		color:var(--sm-brown);
		border:2px solid var(--sm-brown);
	}
	#seat_choice_button>div>button:hover{
		border: none;
		background-color: var(--sm-brown);
		color:white;
	}
	#selectedSeat{
		font-size: 18px;
	}
	#selectedSeat>div>div{
		width:65%;
	}
	#selectedSeat>div>button{
		width:22px;
		height:22px;
		background-color: white;
		color:var(--gray);
		font-weight:bolder;
		border:2px solid var(--gray);
	}
#seat_class_price>h2, #seat_class_price>hr, #select_seat>h2, #select_seat>hr {
	margin-bottom: 5%;
}


#selectedSeat>div {
	display: flex;
	align-items: center;
}

#seat_choice {
	display: flex;
	justify-content: center;
	margin-bottom: 7%;
	height:160px;
}

#seat_class_price, #select_seat {
	width: 26%;
	margin-right: 5%;
}
#seat_class_price>div>h3:last-child{
	margin-left: 3%;
	color:red;
}
#seat_class_price>div>div{
	margin-right: 4%;
}
#seat_class_price>div {
	display: flex;
	margin-bottom: 3%;
    align-items: center;
}

#seatMap2F {
	margin-top: 2%;
}

#wheelchair_seat>div {
	width: 40%;
	display: flex;
	justify-content: center;
}

#wheelchair_seat>div>img {
	margin-left: 2%;
	margin-right: 2%;
}

#wheelchair_seat {
	display: flex;
	width: 100%;
	justify-content: space-around;
	margin-bottom: 5%;
}

#seat_main {
	display: flex;
	justify-content: center;
	margin-top: 5%;
	margin-bottom:5%;
	flex-direction: column;
	align-items: center;
}

#seat_title>h2:first-child, #seat_title>h3 {
	color: var(--sm-brown);
	font-weight: bold;
}

#seat_title>h2:not(:first-child) {
	color: var(--gray-light);
	font-weight: bold;
}


#first_seat>div>h2 {
	display: flex;
	justify-content: center;
	font-size: 40px;
	margin-bottom: 2%;
	font-weight: bold;
	color: var(--gray)
}

#first_seat,{
	border-radius: 15px;
	width: 80%;
	margin-bottom: 5%;
}

#seat_title * {
	margin-right: 2%;
}

#seat_title {
	display: flex;
	align-items: center;
	font-size: 30px;
	margin-top: 5%;
	margin-bottom: 3%;
}

.row {
	display: flex;
	justify-content: center;
}
/* 좌석 스타일 */
.seat {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 26px;
	height: 26px;
	margin: 5px;
	cursor: pointer;
	font-size: 80%;
	border-radius: 5px;
}

.selected {
	border: 3px solid black;
	color: white;
}

.unavailable {
	pointer-events: none;
	background-color: var(--gray)
}
</style>
	<!-------------------------------------------->
</body>
</html>