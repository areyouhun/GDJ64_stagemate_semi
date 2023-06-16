<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.stagemate.member.model.vo.Member, java.util.Arrays" %>
<%
	Object loginMemberUncast = request.getSession().getAttribute("loginMember");
	Member loginMember = null;
	if (loginMemberUncast != null) {
		loginMember = Member.class.cast(loginMemberUncast);
	}
	String saveId = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		saveId = Arrays.stream(cookies)
						.filter(cookie -> cookie.getName().equals("saveId"))
						.findFirst()
						.map(cookie -> cookie.getValue())
						.orElse("");
	}
%>
<header class="min1280px">
    <div class="header-container max1280px">
        <div class="header-container-logo" onclick="location.replace('<%= request.getContextPath() %>')">
            <img src="<%= request.getContextPath() %>/images/common/logo_header.svg" alt="로고_헤더">
        </div>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>">홈</a></li>
                <li><a href="#">뮤지컬</a></li>
                <li><a href="#">연극</a></li>
                <li><a href="#">콘서트</a></li>
                <li><a href="#">스토어</a></li>
                <li><a href="#">커뮤니티</a></li>
            </ul>
        </nav>
        <form class="header-container-search">
            <div>
                <input type="text" class="fw-light" placeholder="이거 누르면 지워짐" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = '이거 누르면 지워짐'">
            </div>
            <div class="search_submit">
                <input type="submit" value="" 
                	style="background-image: url('<%= request.getContextPath() %>/images/common/icon_search.svg')">
            </div>
        </form>
        <div class="header-container-icons">
	        <div>
	        <% if (loginMember == null) { %>
	            <p class="icons_text_upper">GUEST</p>
	            <input type="button" value="" onclick="toLoginPage();"  
	            		style="background-image: url('<%= request.getContextPath() %>/images/common/icon_logout.svg')">
	            <p class="icons_text_lower fw-bold">로그인</p>
            <% } else { %>
            	<p class="icons_text_upper"><%= loginMember.getMemberNm()%></p>
            	<input type="button" value=""
            			onmouseenter="showModalLogOut();"  
	            		style="background-image: url('<%= request.getContextPath() %>/images/common/icon_login.svg')">
            <% } %>
	        </div>
            <div>
                <input type="button" value="" 
                	style="background-image: url('<%= request.getContextPath() %>/images/common/icon_cart.svg')">
                <p class="icons_text_lower fw-bold">장바구니</p>
            </div>
            <div>
                <input type="button" value="" 
                	style="background-image: url('<%= request.getContextPath() %>/images/common/icon_notice.svg')">
                <p class="icons_text_lower fw-bold">공지사항</p>
            </div>
        </div>
        <div class="modal-logout-container">
				<div class="logout-content_msg">
					<% if (loginMember != null) { %>
						<% if (loginMember.getMemberId().equals("stageadmin")) { %>
							<h5>관리자 페이지</h5>
						<% } else { %>
							<h5>마이 페이지</h5>
					<% } } %>
					<div></div>
					<h5>로그아웃</h5>
				</div>
				<div class="logout-content_close">
					<input type="button" value="" 
                	style="background-image: url('<%= request.getContextPath() %>/images/common/profile_close.svg')">
				</div>
		</div>
    </div>
</header>
<script>
function showModalLogOut() {
	$(".logout-content_close").width("8%");
	$(".logout-content_close").height($(".logout-content_close").width());
	
	$(".modal-logout-container").css("transition", "all 0.5s")
							.addClass("modal-logout-show");
}

function closeModalLogOut() {
	$(".modal-logout-container").css("transition", "")
						.removeClass("modal-logout-show");
}
</script>