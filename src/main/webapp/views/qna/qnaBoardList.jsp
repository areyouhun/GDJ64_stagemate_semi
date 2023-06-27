<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/top.jsp"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.stagemate.qna.model.vo.Qna"%>

<% 
		List<Qna> qnas =(List)request.getAttribute("qnas");
%>

<link rel="stylesheet"
	href="<%=contextPath %>/css/nabin/notice_insert.css">
<link rel="stylesheet" href="<%=contextPath %>/css/nabin/notice.css">
<link rel="stylesheet" href="<%=contextPath %>/css/nabin/media.css">
<section class="min1280px">
	<div id="sectionContainer" class="max1280px">
		<div class="board_wrap">
			<div class="board_title">
				<strong>1:1 문의</strong>
			</div>
			<div class="title_list">
				<table>
					<tr>
						<a href="<%=request.getContextPath()%>/notice/noticeList.do">공지사항</a>
					</tr>
					<tr>|
					</tr>
					<tr>
						<a href="<%=request.getContextPath()%>/qna/qnaList.do">1:1
							문의사항</a>
					</tr>
				</table>
			</div>
			<div class="board_list_wrap">
				<table>
					<tr>
						<th>번호</th>
						<th>비밀글</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<%if(qnas.isEmpty()){ %>
					<tr>
						<td colspan="6">조회된 데이터가 없습니다</td>
					</tr>
					<%}else{
                        for(Qna q:qnas){%>
							<tr>
								<td><%=q.getInquiryNo() %></td>
								<td><%=q.getInquiryLockFlg() %></td>
								<td><%=q.getCtgNum()%></td>
								<td>
									<a href="<%=request.getContextPath()%>/qna/qnaView.do?no=<%=q.getInquiryNo()%>">
											<%=q.getInquiryTitle() %>
									</a>
								</td>
								<td><%=q.getWriterId() %></td>
		
								<%-- 첨부파일 <td>
		                            //<%if(b.getQnaOriginalFilename()){ %>
		                            <img src= "<%=request.getContextPath() %>/images/file.png"
		                            width="20">
		                            <%} %>
		                            </td>
		                             --%>
		
								<td><%=q.getInquiryInsertDt() %></td>
							</tr>
					<%}
                    } %>

				</table>
				
							<div class="bt_wrap">
					<%if(loginMember!=null&&loginMember.getMemberId().equals("MemberId")){ %>
					<button class="on"
						onclick="location.assign('<%=request.getContextPath()%>/qna/insertForm.do')">글쓰기</button>
					<%} %>
				</div>
				<div id="pageBar">
					<%=request.getAttribute("pageBar") %>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>
<script src="<%= contextPath %>/js/jquery-3.7.0.min.js"></script>
<script src="<%= contextPath %>/js/script_common.js"></script>