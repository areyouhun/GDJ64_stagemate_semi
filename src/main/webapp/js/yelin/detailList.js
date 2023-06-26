

// store는 가리고 예매만 창을 띄운 채로 시작
//클릭했을 때 보여주는 이벤트
//클릭할 때 해당 버튼이 까맣게 변해야 한다. 
$(document).ready(function() { //jquery시작할때 무조건 이걸로 시작
	//기본창이 예매페이지므로 상품 페이지 숨기고 시작
	setDateBox();
	setDateBox1()
	$('.PlayBookingList').show();
	$('.StoreBookingList').hide();
});

$("#play_btn").click(function() {
	searchList('1', 1, 10);
	$(".PlayBookingList").show();
	$(".StoreBookingList").hide();

});

$("#store_btn").click(function() {
	searchList('2', 1, 10);
	$(".StoreBookingList").show();
	$(".PlayBookingList").hide();
});



function setDateBox() {
	var date = new Date();
	var year = date.getFullYear();

	$("#year1").append("<option value=''>년도</option>");
	for (var y = 2021; y <= (year + 1); y++) {
		$("#year1").append("<option value='" + y + "'>" + y + " 년" + "</option>");
	}

	$("#month1").append("<option value=''>월</option>");
	for (var i = 1; i <= 12; i++) {
		if (String(i).length == '1') {
			$("#month1").append("<option value='" + "0" + i + "'>" + "0" + i + "월" + "</option>");
		} else {
			$("#month1").append("<option value='" + i + "'>" + i + "월" + "</option>");
		}
	}
}

function setDateBox1() {
	var date = new Date();
	var year = date.getFullYear();

	$("#year2").append("<option value=''>년도</option>");
	for (var y = 2021; y <= (year + 1); y++) {
		$("#year2").append("<option value='" + y + "'>" + y + " 년" + "</option>");
	}

	$("#month2").append("<option value=''>월</option>");
	for (var i = 1; i <= 12; i++) {
		if (String(i).length == '1') {
			$("#month2").append("<option value='" + "0" + i + "'>" + "0" + i + "월" + "</option>");
		} else {
			$("#month2").append("<option value='" + i + "'>" + i + "월" + "</option>");
		}
	}
}


function searchList(type, cPage, numPerpage) {
	let reqData = {};
	let url = '';
	if (type == '1') {
		reqData['day'] = $('button[name="filterDate1"].active').val();
		let yyyy = $('#year1').val();
		let mm = $('#month1').val();
		reqData['yyyy'] = yyyy === '년도' ? '' : yyyy;
		reqData['mm'] = mm === '월' ? '' : mm;
		let status = $('input[name="status1"]:checked').val();
		if (status === '1') {
			status = '전체';
		} else if (status === '2') {
			status = '예매';
		}  else if (status === '3') {
			status = '취소';
		} 
		reqData['status'] = status;
		reqData['order'] = '';
		url = getContextPath() + "/PlayListSearchServlet";
	} else {
		reqData['day'] = $('button[name="filterDate2"].active').val();
		let yyyy = $('#year2').val();
		let mm = $('#month2').val();
		reqData['yyyy'] = yyyy === '년도' ? '' : yyyy;
		reqData['mm'] = mm === '월' ? '' : mm;
		let status = $('input[name="status2"]:checked').val();
		if (status === '1') {
			status = '배송 중';
		} else if (status === '2') {
			status = '배송 전';
		}  else if (status === '3') {
			status = '배송 완료';
		} 
		reqData['status'] = status;
		reqData['order'] = $('#order').val() === 'lately' ? 'DESC' : 'ASC';
		url = getContextPath() + "/StoreListSearchServlet";
	}
	
	reqData['cPage'] = cPage;
	reqData['numPerpage'] = numPerpage;

	$.ajax({
		type: "post",
		url: url,
		data: reqData,
		dataType: "text",
		beforeSend: showLoading,
		success: (data) => {
			if (data != null) {
				data = JSON.parse(data);
				if (type == '1') {
					$('#searchCount1').text(data['totalCount']);
					let tableBody = $('.BookingList-table tbody');
				    tableBody.empty();
					let list = data["detailList"];
				    for (let i = 0; i < list.length; i++) {
				      let row = $('<tr>');
				      row.append('<td class="book_no"><a href="" style="color: gray">' + list[i].rsvNo + '</a></td>');
				      row.append('<td class="book_no"><a href="" style="text-decoration: none; color: black">' + list[i].eventName + '</a></td>');
				      row.append('<td class="book_no">' + list[i].rsvDate.split(' ')[0] + ' ' + list[i].rsvDate.split(' ')[1].substring(0, 5) + '</td>');
				      row.append('<td class="book_no">' + '1매' + '</td>');
				      row.append('<td class="book_no">' + '2023-06-03 17:00' + '</td>');
				      row.append('<td class="book_no">' + list[i].orderStatus + '</td>');
				      row.append('<td class="book_no"><a href="">리뷰작성</a></td>');
				      tableBody.append(row);
				    };
				} else {
					$('#searchCount2').text(data['totalCount']);
					let tableBody = $('.OrderList-table tbody');
				    tableBody.empty();
					let list = data["storeList"];
				    for (let i = 0; i < list.length; i++) {
				      let row = $('<tr>');
				      row.append('<td class="book_no">' + list[i].orderDate.split(' ')[0] + ' ' + list[i].orderDate.split(' ')[1].substring(0, 5) + '</td>');
				      row.append('<td class="book_no"><a href="" style="text-decoration: none; color: black">' + list[i].orderNo + '</a></td>');
				      row.append('<td class="book_no"><a href="">' + list[i].productNm + '</a></td>');
				      row.append('<td class="book_no">' + list[i].totalPrice + '</td>');
				      row.append('<td class="book_no">' + list[i].orderStatus + '</td>');
				      row.append('<td class="book_no"><a href="">리뷰작성</a></td>');
				      tableBody.append(row);
				    };
				}
				
				$('#page .pageBar').html('');
				$('#page .pageBar').html(data['pageBar']);
			}
		},
		error:(response, status, error) => {
			if (response.status === 500) {
				alert("code:" + response.status + "\n" + "message:" + response.responseText + "\n" + "error:" + error);
			}
		}
	});
}

function showLoading() {
	const $div = $("<div>");
	const loading = $(`<img src='${getContextPath()}/images/jaehun/login_page/loading.gif'>`);
	$("#accessFailed").append($div.append(loading));
	$div.width("100%").height("100%");
	loading.height("100%")
			.width(loading.height())
			.css("margin", "0 auto");
}

