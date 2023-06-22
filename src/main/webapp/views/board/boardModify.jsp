<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp"%>
<!-- 본인이 따로 적용할 CSS 파일 및 style 태그 -->
<style>
.board_title {
	margin-top: 5%;
	margin-bottom: 10%;
}

.board_title hr {
	width: 100%;
	/* text-align: right; */
	margin-left: 5%;
}

.board_title strong {
	margin-left: 5%;
	font-size: 30px;
}

.board_title strong {
	margin-left: 5%;
	font-size: 35px;
}

p {
	margin-top: 2%;
	margin-left: 5%;
	font-size: 35px;
}

hr {
	margin-top: 2%;
}

table {
	width: 100%;
	border: 1px black;
}

div#boardwrite {
	margin-left: 5%;
	width: 100%;
	margin-top: -8%;
}



a {
	text-decoration: none;
	color: black;
}

a.on {
	display: inline-block;
	min-width: 80px;
	padding: 10px;
	text-align: center;
	border: 1px solid #000;
	border-radius: 15px;
	margin-left: 2%;
	margin-top: 1.5%;
}

td {
	text-align: center;
}

.bt_wrap {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 5%;
}
#filecontainer {
	display: flex;
	margin-left: 3%;
}

input#file-upload-button {
	border-radius: 15%;
}
</style>

<!---------------------------------------->
<title>게시글 수정</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<!-----------   아래에서 HTML 작업  ----------->
	<section class="min1280px">
		<div class="max1280px">
			<body>
				<div class="board_title">
					<strong>STAGEMATE</strong>
					<hr>
					<p>게시글 수정</p>
				</div>
				<div id="boardwrite">
					<table border="1" width=500>
						<tr>
							<th width=80>제목</th>
							<td colspan="2" height=50><textarea placeholder="수정중..."
									style="width: 100%; height: 100%"></textarea>
						</tr>
						<tr>
							<th width=80>파일첨부</th>
							<td colspan="2" height=50><div id="filecontainer">
									<form action="" method="post" enctype="mulipart/form-data">
										<input type="file" name="upfile" multiple> <input
											type="submit" value="업로드">
						</tr>
						<tr>
							<td colspan="2" height=400><textarea placeholder="수정수정"
									style="width: 100%; height: 100%"></textarea></td>
						</tr>
					</table>
					<div class="bt_wrap">
						<a href="#" onclick="window.open('boardList.jsp')" class="on">취소</a> 
						<a href="#" onclick="window.open('boardList.jsp')" class="on">완료</a>
					</div>

				</div>
			</body>
		</div>
	</section>
	<!-----------   위에서 HTML 작업  ----------->
	<%@ include file="/views/common/footer.jsp"%>
	<script src="<%=contextPath%>/js/jquery-3.7.0.min.js"></script>
	<script src="<%=contextPath%>/js/script_common.js"></script>
	<!-- 본인이 따로 적용할 외부 JS 파일 및 script 태그 -->

	<!-------------------------------------------->
</body>
</html>