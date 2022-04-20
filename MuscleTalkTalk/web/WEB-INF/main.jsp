<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/reset.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/header.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/aside.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/section.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/footer.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	@font-face {
	    font-family: THEmpgtM;
	    src: url("<%= request.getContextPath() %>/cssfolder/fonts/THEmpgtM.woff");
	}
	body{
	    width: 1200px;
	    margin: 0 auto;
	}
	*{
	    text-decoration: none;
	}
</style>
</head>
<body bgcolor=" #ECECEC">
    <header id="header_all">
        <div id="header_logo">
            <a href="">
                <img src="<%= request.getContextPath() %>/cssfolder/images/logo.png">
            </a>
        </div>
        <div id="icon_menu">
            <div id="member_icon">
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/회원.svg" id="member_icon_img">
                </div>
            </div>
            <div id="bell_icon">
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/알림.svg" id="bell_icon_img">
                </div>
            </div>
            <div id="home_icon">
                <a href="">
                    <img src="<%= request.getContextPath() %>/cssfolder/images/메인홈.svg">
                </a>
            </div>
        </div>

        <!-- 멤버 아이콘 영역 -->
        <div id="member_icon_menu">
            <div>
                <a href="">    
                   <img src="<%= request.getContextPath() %>/cssfolder/images/login.png" id="login_icon">
                   <p style="padding-bottom: 25px;">로그인</p>
                </a>
            </div>
            <div>
                <a href="">    
                   <img src="<%= request.getContextPath() %>/cssfolder/images/join.png" id="sign_icon">
                   <p>회원가입</p>
                </a>
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
                    <img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.svg" style="width: 10px;" class="bell_notice_x">  
                    <a href="" class="header_notice">
                        <div>알림 1</div>
                        <div>알림 내용 1</div> 
                    </a>  
                </div>
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.svg" style="width: 10px;" class="bell_notice_x">
                    <a href="" class="header_notice">
                        <div>알림 2</div>
                        <div>알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2</div> 
                    </a>
                </div>
                <div>
                    <img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.svg" style="width: 10px;" class="bell_notice_x">
                    <a href="" class="header_notice">
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
                    <a href="">
                        <img src="<%= request.getContextPath() %>/cssfolder/images/com.png">
                        <p>커뮤니티</p>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="<%= request.getContextPath() %>/cssfolder/images/pt.png">
                        <p>PT프로그램</p>
                    </a>
                </div>
            </div>
    
            <div id="triangle_4">
            </div>
        </aside>
    
        <section>
            각자 코드
        </section>
    </div>

    <footer>
        <div>
            <ul>
                <li>대한민국 &copy; 주식회사 머슬톡톡 무단 전재와 무단 복제를 금함.</li>
                <li>Muscle TalkTalk Co.Ltd ㅣ 주소 및 연락처 : 화성시 무슨로 몇몇 (031)-000-0000</li>
                <li>대표자 : 박재민 ㅣ사업자등록번호 : 124-82-10324</li>
                <li>메일문의 : muscleTalkTalk@gmail.com ㅣ호스팅서비스 : aws</li>
                <li>Copyright © 2022 MuscleTalkTalk All Right Reserved</li>
            </ul>
        </div>
        <a href="" id="go_to_top">
            <img src="<%= request.getContextPath() %>/cssfolder/images/gototop.svg">
        </a>
    </footer>

    <script>
        $("#member_icon_img").mouseenter(function(event){
            // console.log(event);
            $("#member_icon_menu").fadeIn("fast");
        });
        $("#member_icon").mousemove(function(event){
            // console.log("X:" + event.offsetX + " Y:" + event.offsetY);
        });
        $("#member_icon").mouseleave(function(event){
            console.log("X:" + event.offsetX + " Y:" + event.offsetY);
            if(event.offsetX < 0 || event.offsetY < 0 || event.offsetX > 23) {
                $("#member_icon_menu").fadeOut("fast");
            }
        });
        $("#member_icon_menu").mouseenter(function(event){
            // console.log(event);
            // $("#member_icon_menu").css("display","block");
        })
        $("#member_icon_menu").mouseleave(function(event){
            $("#member_icon_menu").fadeOut("fast");
        })


        $("#bell_icon_img").mouseenter(function(event){
            // console.log(event);
            $("#bell_icon_notice").fadeIn("fast");
        });
        $("#bell_icon").mousemove(function(event){
            // console.log("X:" + event.offsetX + " Y:" + event.offsetY);
        });
        $("#bell_icon").mouseleave(function(event){
            console.log("X:" + event.offsetX + " Y:" + event.offsetY);
            if(event.offsetX < 0 || event.offsetX > 23 || event.offsetY < 0) {
                $("#bell_icon_notice").fadeOut("fast");
            }
            // if(event.offsetY < 5 || event.offsetY > -5) {
            //     $("#bell_icon_notice").fadeOut();
            // }
        });
        $("#bell_icon_notice").mouseenter(function(event){
            $("#bell_icon_notice").show("fast");
        });
        $("#bell_icon_notice").mouseleave(function(event){
            $("#bell_icon_notice").fadeOut("fast");
        });

        // header 알림 - x 클릭 시 알림 삭제
        $(".bell_notice_x").click(function(){
            console.log($(this).next().remove());
            $(this).remove();
        });
    </script>
</body>
</html>