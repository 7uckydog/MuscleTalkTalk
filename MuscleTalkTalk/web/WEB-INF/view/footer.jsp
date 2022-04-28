<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a href="#header_all" id="go_to_top">
            <img src="<%= request.getContextPath() %>/cssfolder/images/gototop.png">
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
        
        // 회원 아이콘 내, 로그인 클릭 시 로그인 페이지로 이동
        $("#login").click(function(){
        	location.href = "login";
        });
        
     	// 회원 아이콘 내, 로그아웃 클릭 시 로그아웃 컨트롤러로 이동 (세션 삭제)
        $("#logout").click(function(){
        	location.href = "logout";
        });
        
     	// 회원 아이콘 내, 회원가입 클릭 시 회원가입 컨트롤러로 이동
        $("#join").click(function(){
        	location.href = "memberjoin";
        });
     	// 회원 아이콘 내, 마이페이지 버튼 클릭 시 마이페이로 이동
     	$("#mypage").click(function(){
     		location.href= "membermypage";
     	});
    </script>