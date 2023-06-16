const urlcopy = () => {
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = 'http://localhost:9090/SemiProject/musicalNum1.do';
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("링크가 복사되었습니다. 필요하신 곳에 붙여넣기 하세요!")
}
const openmap = () => {
	open("<%=request.getContextPath()%>/map.do", "_blank", 'top=' + (window.innerHeight / 2 - 250) + ', left=' + (window.innerWidth / 2 - 250) + ', width=500, height=500')
}
let flag = true;
$("#schedule").click(e => {
	if (flag == true) {
		$("#schedule").css({ "backgroundColor": "var(--sm-brown)", "color": "white" })
		flag = false;
	} else {
		$("#schedule").css({ "backgroundColor": "white", "color": "black" })
		flag = true;
	}
})




$("#detail_information").click(e => {
	$("#detail_information").css({ "borderBottom": "14px solid black" })
	$("#detail_information").children().css({ "fontWeight": "bolder" })
	$("#reservation_cancel").css({ "borderBottom": "" })
	$("#reservation_cancel").children().css({ "fontWeight": "" })
	$("#gold_review").css({ "borderBottom": "" })
	$("#gold_review").children().css({ "fontWeight": "" })
	$("#gold_location").css({ "borderBottom": "" })
	$("#gold_location").children().css({ "fontWeight": "" })
	$("#detail_information_img").css({ "display": "inline-flex", "flex-direction": "column", "align-items": "center" })
	$("#reservation_cancel_info").css({ "display": "none" })
	$("#gold_details_map").css({ "display": "none" })

})

$("#reservation_cancel").click(e => {
	$("#detail_information").css({ "borderBottom": "" })
	$("#detail_information").children().css({ "fontWeight": "" })
	$("#reservation_cancel").css({ "borderBottom": "14px solid black" })
	$("#reservation_cancel").children().css({ "fontWeight": "bolder" })
	$("#gold_review").css({ "borderBottom": "" })
	$("#gold_review").children().css({ "fontWeight": "" })
	$("#gold_location").css({ "borderBottom": "" })
	$("#gold_location").children().css({ "fontWeight": "" })
	$("#detail_information_img").css({ "display": "none" })
	$("#reservation_cancel_info").css({ "display": "inline-flex", "flex-direction": "column" })
	$("#gold_details_map").css({ "display": "none" })


})
$("#gold_review").click(e => {
	$("#detail_information").css({ "borderBottom": "" })
	$("#detail_information").children().css({ "fontWeight": "" })
	$("#reservation_cancel").css({ "borderBottom": "" })
	$("#reservation_cancel").children().css({ "fontWeight": "" })
	$("#gold_review").css({ "borderBottom": "14px solid black" })
	$("#gold_review").children().css({ "fontWeight": "bolder" })
	$("#gold_location").css({ "borderBottom": "" })
	$("#gold_location").children().css({ "fontWeight": "" })
	$("#detail_information_img").css({ "display": "none" })
	$("#reservation_cancel_info").css({ "display": "none" })
	$("#gold_details_map").css({ "display": "none" })
})

$("#movemap").click(e=>{
	var location = document.querySelector("#gold_location").offsetTop;
	window.scrollTo({top:location, behavior:'smooth'});
	$("#detail_information").css({"borderBottom":""})
	$("#detail_information").children().css({"fontWeight":""})
	$("#reservation_cancel").css({"borderBottom":""})
	$("#reservation_cancel").children().css({"fontWeight":""})
	$("#gold_review").css({"borderBottom":""})
	$("#gold_review").children().css({"fontWeight":""})
	$("#gold_location").css({"borderBottom":"14px solid black"})
	$("#gold_location").children().css({"fontWeight":"bolder"})
	$("#detail_information_img").css({"display":"none"})
	$("#reservation_cancel_info").css({"display":"none"})
	$("#gold_details_map").css({"display":"inline-flex","flex-direction":"column","align-items": "center"})
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.523898, 127.025587), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
       
    
});
});



$("#gold_location").click(e=>{
	$("#detail_information").css({"borderBottom":""})
	$("#detail_information").children().css({"fontWeight":""})
	$("#reservation_cancel").css({"borderBottom":""})
	$("#reservation_cancel").children().css({"fontWeight":""})
	$("#gold_review").css({"borderBottom":""})
	$("#gold_review").children().css({"fontWeight":""})
	$("#gold_location").css({"borderBottom":"14px solid black"})
	$("#gold_location").children().css({"fontWeight":"bolder"})
	$("#detail_information_img").css({"display":"none"})
	$("#reservation_cancel_info").css({"display":"none"})
	$("#gold_details_map").css({"display":"inline-flex","flex-direction":"column","align-items": "center"})
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.523898, 127.025587), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
       
    
});
})
window.onload = function() { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

	let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
	let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

	let tbody_Calendar = document.querySelector(".Calendar > tbody");
	document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
	document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

	while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
		tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
	}

	let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

	for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
		let nowColumn = nowRow.insertCell();        // 열 추가
	}

	for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

		let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


		let newDIV = document.createElement("p");
		newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
		nowColumn.appendChild(newDIV);

		if (nowDay.getDay() == 6) {                 // 토요일인 경우
			nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
		}

		if (nowDay < today) {                       // 지난날인 경우
			newDIV.className = "pastDay";
		}
		else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
			newDIV.className = "today";
			newDIV.onclick = function() { choiceDate(this); }
		}
		else {                                      // 미래인 경우
			newDIV.className = "futureDay";
			newDIV.onclick = function() { choiceDate(this); }
		}
	}
}

// 날짜 선택
function choiceDate(newDIV) {
	if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
		document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	}
	newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
}

// 이전달 버튼 클릭
function prevCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	buildCalendar();    // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
	buildCalendar();    // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
	if (value < 10) {
		value = "0" + value;
		return value;
	}
	return value;
}