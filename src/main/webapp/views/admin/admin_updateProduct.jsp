<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp" %>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/yoonjin/style_product_list_for_admin.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/yoonjin/style_insertProduct.css">
<%@page import="java.util.List,com.stagemate.store.model.vo.Product,com.stagemate.store.model.vo.StoreUpfile"%>
<%
Product p = (Product)request.getAttribute("p");
List<StoreUpfile> files = (List) request.getAttribute("fileList");
StoreUpfile main=null;
StoreUpfile detail=null;
for(StoreUpfile f:files){
	if(f.getIsMainImg()=='Y'){
		main=f;
	}else{
		detail=f;
	}
};
%>
<title>STAGEMATE</title>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<section class="min1280px">
	<div id="sectionContainer" class="max1280px body_height div_flex_style">
		<div id="store_admin_nav">
				<nav>
					<ul id="store_admin_nav_ul">
						<li><a href="<%=contextPath%>/admin/membermanage" >회원 관리</a></li>
						<li class="select_nav_admin">
							<a href="<%=contextPath%>/admin/eventlist">상품 관리</a>
							<ul>
								<li><a href="<%=contextPath%>/admin/eventlist">행사</a></li>
								<li class="select_nav_admin"><a href="<%=contextPath%>/admin/selectAllProduct.do">스토어</a></li>
							</ul>
						</li>
						<li>
							<a href="<%=contextPath%>/admin/SalesDetail.do">판매 관리</a>
							<ul>
								<li><a href="<%=contextPath%>/admin/SalesDetail.do">판매내역관리</a></li>
								<li><a href="">결제 취소 요청</a></li>
								<li><a href="">반품/교환 관리</a></li>
							</ul>
						</li>
						<li>
							<a href="">커뮤니티 관리</a>
							<ul>
								<li><a href="">게시판 관리</a></li>
								<li><a href="">신고 관리</a></li>
							</ul>
						</li>
						<li>
							<a href="">고객센터</a>
							<ul>
								<li><a href="">공지사항 관리</a></li>
								<li><a href="">1:1문의 관리</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		<div id="store_manager_container">
			<div id="store_manager_nav">
				<nav>
					<span>상품관리</span>
					<span><img src="<%=contextPath %>/images/yoonjin/button/arrow.svg" alt=""></span>
					<span>스토어</span>
				</nav>
			</div>
			<hr>
			<div id="product_insert_form">
				<form action="<%=contextPath%>/admin/updateProductEnd.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value=<%=p.getProductNo() %> name="productNo">
					<table>
						<tr>
							<th>행사*</th>
							<td><input type="text" name="productTitle" id="" required placeholder="행사명이 없는 경우 '일반상품'으로 입력" value="<%=p.getProductTitle()%>"></td>
						</tr>
						<tr>
							<th>상품명*</th>
							<td><input type="text" name="productNm" id="" required value="<%=p.getProductNm()%>"></td>
						</tr>
						<tr>
							<th>판매가*</th>
							<td><input type="number" name="productPrice" id="" required value="<%=p.getProductPrice()%>"></td>
						</tr>
						<tr>
							<th>재고수량*</th>
							<td><input type="number" name="productAmt" id="" required value="<%=p.getProductAmt()%>"></td>
						</tr>
						<tr>
							<th>대표이미지*</th>
							<td>
								<img src="<%=contextPath+"/upload/yoonjin/"+main.getImgFileRename()%>" id="productFile">
    							<input type="file" name="upFileMain" id="productFileInput" style="display:none" accept="image/*" required>
								<span id="upfilename"></span>
							</td>
						</tr>
						<tr>
							<th>상세이미지*</th>
							<td><input type="file" name="upFileDetail" id="" required value="<%=contextPath+"/upload/yoonjin/"+detail.getImgFileRename()%>"></td>
						</tr>
						<tr>
							<td style="color: red; font-size:12px;">*이미지 선택은 모두 다시해주세요.</td>
						</tr>
						<tr>
							<th>관리자비고</th>
							<td>
								<textarea name="productComment" id="" cols="60" rows="5"><%=p.getProductComment()%></textarea>
							</td>
						</tr>
					</table>
					<div id="insert_btn">
						<button type="submit" id="updateBtn">수정</button>
						<button type="reset" id="resetBtn">취소</button>
					</div>
				</form>
			</div>
			<div class="page-bar">
				<%-- <%=request.getAttribute("pageBar")%> --%>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>
<script src="<%= contextPath %>/js/jquery-3.7.0.min.js"></script>
<script src="<%= contextPath %>/js/script_common.js"></script>
<script src="<%= contextPath %>/js/yoonjin/insertProduct.js"></script>
<script src="<%= contextPath %>/js/yoonjin/updateProduct.js"></script>
</body>
</html>