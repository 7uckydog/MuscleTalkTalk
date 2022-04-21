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
        
        $("#login").click(function(){
        	location.href = "login"
        })