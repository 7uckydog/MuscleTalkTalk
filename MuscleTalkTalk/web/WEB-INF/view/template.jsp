<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body bgcolor=" #ECECEC">
    <header id="header_all">
        <div id="header_logo">
            <a href="main">
                <img src="<%= request.getContextPath() %>/cssfolder/images/logo.png">
            </a>
        </div>
        <div id="icon_menu">
            <div id="member_icon">
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/member.png" id="member_icon_img">
                </div>
            </div>
            <div id="bell_icon">
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/bell.png" id="bell_icon_img">
                </div>
            </div>
            <div id="home_icon">
                <a href="main">
                    <img src="<%= request.getContextPath() %>/cssfolder/images/home.png">
                </a>
            </div>
        </div>
        <!-- 멤버 아이콘 영역 -->
        <div id="member_icon_menu">
            <div>

                   <img src="<%= request.getContextPath() %>/cssfolder/images/login.png" id="login_icon"> 
<%
	MemberVo ssMvo = (MemberVo)session.getAttribute("ssMvo");
	if(ssMvo == null){
%>
				<p style="padding-bottom: 25px;" id="login">로그인</p>
<% } else { %>
				<p style="padding-bottom: 25px;" id="logout">로그아웃</p>
<% } %>
            </div>
            <div>
                   <img src="<%= request.getContextPath() %>/cssfolder/images/join.png" id="sign_icon">
<%
	ssMvo = (MemberVo)session.getAttribute("ssMvo");
	if(ssMvo == null){
%>
                   <p id="join">회원가입</p>
<% } else { %>
					<p id="mypage">마이페이지</p>
<% } %>            
            </div>
        </div>

        <!-- 알림 아이콘 영역 --> <!-- Flexbox 사용 예정-->
        <div id="bell_icon_notice">
            <div id="header_notice_all">
                <div>
                    <a class="header_notice">
                        <div style="color: gray; text-align: center; margin-left: -20px; font-weight:normal;">알림 없음</div>
                    </a>
                </div>

                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.png" style="width: 10px;" class="bell_notice_x">  
                    <a class="header_notice">
                        <div>알림 1</div>
                        <div>알림 내용 1</div> 
                    </a>  
                </div>
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.png" style="width: 10px;" class="bell_notice_x">
                    <a class="header_notice">
                        <div>알림 2</div>
                        <div>알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2</div> 
                    </a>
                </div>
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.png" style="width: 10px;" class="bell_notice_x">
                    <a class="header_notice">
                        <div>알림 3</div>
                        <div>새로운 공지사항이 등록되었습니다. 알림을 클릭하여 확인해 주세요.</div> 
                    </a>
                </div>
            </div>
        </div>
    </header>
    
    <div id="aside_section">
        <aside>
            <div id="aside_all">
                <div>
                    <a href="">
                        <img src="<%= request.getContextPath() %>/cssfolder/images/exe.png">
                        <p>운동관리</p>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="<%= request.getContextPath() %>/cssfolder/images/cal.png">
                        <p>캘린더</p>
                    </a>
                </div>
                <div>
                    <a href="BoardReadAll">
                        <img src="<%= request.getContextPath() %>/cssfolder/images/com.png">
                        <p>커뮤니티</p>
                    </a>
                </div>
                <div>
                    <a href="ptlist">
                        <img src="<%= request.getContextPath() %>/cssfolder/images/pt.png">
                        <p>PT프로그램</p>
                    </a>
                </div>
            </div>
    
            <div id="triangle_4">
            </div>
        </aside>
    </div>

</body>
