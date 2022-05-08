<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<%-- <link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css"> --%>
<style>
        @font-face {
            font-family: THEmpgtM;
            src: url("./fonts/THEmpgtM.woff");
        }
        body{
            width: 1200px;
            margin: 0 auto;
        }
        *{
            text-decoration: none;
        }
/* board write section css */
        section{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: 2000px;
            position: relative;
            font-family: 'THEmpgtM';
            
        }

        #board_main{
           /* margin-top: 65px; */
            /* margin-left: 65px; */
            padding-top: 65px;
            margin-left: 65px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 40px;
            font-size: 15px;
        }
        #board_category{
            padding-top: 65px;
            margin-right: 65px;
            float: right;
            font-size: 12px;
        }
        #board_note{
            border:1px solid #4B4DB2; 
            border-bottom: 0;
            width: 800px;
            box-sizing: border-box;
            height: 150px;
            /* padding: 40px 30px 30px 30px; */
            padding-left: 50px;
            margin: 0 65px;
            text-align: left;
        }
        #note_title{
            margin-top: 20.5px;
           margin-bottom: 20px;
           font-size: 12px;
        }
        .note_content_1{
            font-weight: 100;
            margin-top: 20px;
        }
        .note_content_2{
            font-weight: 100;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .note_content_3{
            font-weight: 100;
            /* margin-top: 20px; */
        }
        .note_content_1,.note_content_2,.note_content_3{
            font-size: 12px;
        }
        #board_information{ 
            border:1px solid #4B4DB2; 
            background-color: #4B4DB2;
            width: 800px;
            box-sizing: border-box;
            height: 55px;
            padding: 10px 30px 10px 50px;
            margin: 0px auto;
            text-align: left;
            position: relative;
            overflow: hidden;
            vertical-align: middle;
        }
        #writer_board{
            display: inline-block;
            /* margin: auto; */
            line-height: 30px;
            font-size: 12px;
            color: white;
        }
        #board_write1{
            margin: 60px 0 0 65px;
            display: inline-block;
            font-size: 12px;
        }
        #board_write2{
            margin: 60px 0 0 372px;
            display: inline-block;
            font-size: 12px;
        }
        #board_title{
            margin: 15px 0 0 65px;
            width: 260px;
            height: 25px;
            font-size: 12px;
        }
        #board_select{
            margin: 15px 0px 0 170px;
            width: 100px;
            height: 30px;
            font-size: 12px;
        }
        .select_click {
	        background-color: #4B4DB2;
        }
        #board_content{
            margin: 48px 0 15px 65px;
            font-size: 12px;
        }
        #board_content1{
            margin: 10px 65px 0 65px;
            width: 790px;
            height: 359px;
            box-sizing: content-box;
            resize: none;
        }
        #board_cancel{
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
        }
        #board_register{
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: white;
            background-color: #4B4DB2;
            border: 1px solid #4B4DB2;
        }
        #btn_cancel_register{
            margin-top: 62px;
            text-align: center;
        }
        #textEditer{
        	margin: 0px 65px
        }
        button {
			cursor: pointer;
		}
    </style>
</head>

<body bgcolor=" #ECECEC">
    <%@ include file="/WEB-INF/view/template.jsp"%>
    <section>
        <div id="board_main">
            게시판
        </div>
        <div id="board_category">
            <a href="totalboard">통합 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="BoardReadAll">자유 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="routineboardreadall">루틴 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">공지사항</a>
        </div>
        <div id="board_note">
            <div id="note_title">게시판 유의사항</div>
            <div class="note_content_1">
                - 욕설,상업적 내용,광고,정치,특정 회원 및 트레이너 혹은 프로그램 등을 비방하는 내용의 악의적인 게시물은 신고 및 삭제될 수 있습니다.
            </div>
            <div class="note_content_2">
                - 친목,금전거래,재산권 침해,근거 없는 허위사실 유포 또한 신고 및 삭제될 수 있습니다.
            </div>
            <div class="note_content_3">
                - 전 회원의 보다 편리한 게시판 사용 및 홈페이지 관리를 위한 에티켓을 지켜주세요.
            </div>
        </div>
        <div id="board_information">
            <div id="writer_board">
                자유 게시물 작성하기
            </div>
        </div>
        <div>
            <p id="board_write1">게시물 제목</p>
            <p id="board_write2">게시판 선택</p>
        </div>
        <form action="boardinsert.do" method="post">
        <div>
            <input id="board_title" name="boardTitle" type="text" required placeholder="게시물 제목을 입력해 주세요.(최대 10자)">
            <select name="b" id="board_select">
                <option id="board_select1" name="board_category" value="f">자유 게시판</option>
                <option id="board_select1" name="board_category" value="r">루틴 게시판</option>
            </select>
        </div>
        <div id="board_content">
            게시물 내용
        </div>
        <div id="textEditer">
            <textarea id="board_content1" name="boardContent" placeholder="게시물 내용을 입력해 주세요.(최대 300자)"></textarea>
        	<script>
        		CKEDITOR.replace('board_content1', {width :'800px', 
        											height : '360px',
        											/* startupFocus : true, */
        											uiColor:'#ffffff',
        											enterMode:'2',
        											resize: 'none'});
        		CKEDITOR.config.resize_enabled=false;
        	</script>
        </div>
        <div id="btn_cancel_register">
            <button type="button" onclick="location.href = 'BoardReadAll';" id="board_cancel">취소</button>
            <button id="board_register" type="submit">글등록</button>
        </div>
        </form>
    </section>
    
	<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>