<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<%@ include file="/WEB-INF/view/font.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
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
/* notice write section css */
        section{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: 2000px;
            position: relative;
            font-family: THEmpgtM;
            
        }

        #notice_main{
            padding-top: 65px;
            margin-left: 65px;
            font-weight: bold;
            display: inline-block;
           /*  margin-bottom: 40px; */
            font-size: 15px;
        }
    
        #note_title{
            margin-top: 20.5px;
           margin-bottom: 20px;
           font-size: 12px;
        }
       
        #notice_information{ 
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
        #writer_notice{
            display: inline-block;
            /* margin: auto; */
            line-height: 30px;
            font-size: 12px;
            color: white;
        }
        #notice_update{
            margin: 50px 0 0 65px;
            display: inline-block;
            font-size: 12px;
        }
      
        #notice_title{
            margin: 15px 0 0 65px;
            width: 800px;
            height: 25px;
            font-size: 12px;
            border: 1px solid rgb(204, 204, 204)
        }
        #notice_select{
            margin: 15px 0px 0 170px;
            width: 100px;
            height: 30px;
            font-size: 12px;
        }
        .select_click {
	        background-color: #4B4DB2;
        }
        #notice_content{
            margin: 48px 0 15px 65px;
            font-size: 12px;
        }
        #notice_content1{
            margin: 10px 65px 0 65px;
            width: 790px;
            height: 359px;
            box-sizing: content-box;
            resize: none;
        }
        #notice_cancel{
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
        }
        #notice_update_btn{
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: white;
            background-color: #4B4DB2;
            border: 1px solid #4B4DB2;
        }
        #btn_cancel_update{
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
<body>
<%@ include file="/WEB-INF/view/template.jsp"%>
    <section>
        <div id="notice_main">
            공지사항 수정
        </div>
        <div>
            <p id="notice_update">공지사항 제목</p>
        </div>
        <form action="noticeupdate.do" method="post">
        <div>
            <input id="notice_title" name="notiTitle" type="text" placeholder="공지사항 제목 입력">
        </div>
        <div id="notice_content">
            공지사항 내용
        </div>
        <div id="textEditer">
            <textarea id="notice_content1" name="notiContent" placeholder="공지사항 내용을 입력해 주세요."></textarea>
        	<script>
        		CKEDITOR.replace('notice_content1', {width :'800px', 
        											height : '360px',
        											/* startupFocus : true, */
        											uiColor:'#ffffff',
        											enterMode:'2',
        											resize: 'none'});
        		CKEDITOR.config.resize_enabled=false;
        	</script>
        </div>
        <div id="btn_cancel_update">
            <button type="button" onclick="location.href = 'noticeReadAll';" id="notice_cancel">취소</button>
            <button id="notice_update_btn" type="submit">수정완료</button>
        </div>
        <input type="hidden" name="noticeNo" value="${nvo.noticeNo}">
        </form>
    </section>


</body>
</html>