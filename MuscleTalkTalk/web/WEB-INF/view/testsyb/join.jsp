<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
        @font-face {
            font-family: THEmpgtM;
            src: url("<%= request.getContextPath() %>/cssfolder/fonts/THEmpgtM.woff");
        }
        @font-face {
            font-family: THEmpgtB;
            src: url("<%= request.getContextPath() %>/cssfolder/fonts/THEmpgtB.woff");
        }
        body{
            width: 1200px;
            margin: 0 auto;
        }
        *{
            text-decoration: none;
        }

/* header css */
        header{
            font-family:'THEmpgtM';
            font-weight: light;
            margin: 0 auto;
            height: 140px;
            background-color: #ECECEC;
            position: relative;
        }
        #header_logo{
            margin-left: 50px;
            margin-top: 40px;
            float: left;
            transition: .3s;
        }
        #header_logo:hover, #member_icon:hover, #bell_icon:hover, #home_icon:hover{
            opacity: 0.3;
        }

/* session */
        section{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: 2370px;
            margin: 0 auto;
            font-size: 12px;
            font-family:'THEmpgtM';
        }
        #noti_text{
            padding-top: 70px;
            padding-bottom: 40px;
        }
        #title{
            font-family:'THEmpgtB';
            font-size: 24px;
            color:#5E5E5E;
            font-weight: bold;
            margin: 0;
            text-align: center;
        }
        #subtext {
            padding-top: 30px;
            color:#5E5E5E;
            text-align: center;
            line-height: 17px;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #user_input > form > div {
            width: 530px;
            margin-left: 255px;
            text-align: left;
        }
        #user_input > form > div > p {
            width: 100px;
            margin-left: 0px;
            padding-left: 0px;
            text-align: left;
        }
        #file_upload{
            width: 900px;
            margin-left: 0px;
            padding-left: 0px;
            text-align: left;
            margin-bottom: 20px;
        }
        hr{
            width: 420px;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        #thirteenth_line{
            margin-bottom: 35px;
        }
        input[type="flie"]{
            font-family:'THEmpgtM';
        }

        #modal_all{
            position: fixed; top: 0; left: 0; 
            width: 100%; height: 100%;
            z-index: 1;
            background-color: rgba(128, 128, 128, 0.356);
            display: none;
        }
        #modal{
            width: 280px;
            height: 270px;
            position: relative;  top:30%;
            margin: auto;
            background-color: white;
        }
        #modal_title{
            font-family:'THEmpgtB';
            font-size: 12px;
            color: rgb(64, 64, 64);
            padding-top: 50px;
            padding-bottom: 10px;
        }
        #modal_subtext{
            font-family:'THEmpgtM';
            font-size: 12px;
            color: rgb(158, 158, 158);
            padding-bottom: 20px;
        }
        #modal_accept, #modal_cancel{
            font-family:'THEmpgtM';
            font-size: 12px;
            background-color: white;
            border: none;
            padding: 13px 45px;
            cursor: pointer;
        }
        #modal_accept{
            color: #4B4DB2;
        }
        #modal_cancel{
            color: #9E9E9E;
        }
        #modal_email{
            width: 200px;
            height: 30px;
            margin-bottom: 5px;
        }
        #modal_hr{
            margin-top: 25px;
            border: 0.1px solid rgb(240, 240, 240);
        }
        #user_input{
            text-align: center;
        }
        
        #member_name, #member_email, #member_id, #member_password, #member_password_check, #member_nickname, #member_phone, #member_gender, #member_age, #member_height, #member_weight, #member_purpose, #member_concern, #gym_name, #gym_location {
            width: 415px;
            height: 40px;
            margin-bottom: 15px;
            background-color: #E0E0E0;
            border: 0;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        input::placeholder{
            font-family:'THEmpgtM';
            color: #9E9E9E;
            padding-left: 8px;
            font-size: 12px;
        }
        input:focus {
            outline:none;
        }
        #second_line{
            margin-left: 105px;
        }
        #member_mail_check, #member_nickname_check, #member_id_check{
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
        }
        #member_mail_check2, #member_nickname_check2, #member_id_check2{
            color: white;
            background-color: #4B4DB2;
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
            display:none;
        } 
        #member_id, #member_id_check{
            float: left;
        }
        #trainer_checkbox{
            text-align: center;
            margin-left: 110px;
        }
        #trainer_checkbox{
            text-align: center;
            margin-left: 110px;
        }#agree_checkbox{
            text-align: center;
            margin-left: 15px;
            margin-bottom: 60px;
        }
        #next_btn{
            color: white;
            background-color: rgb(75, 77, 178);
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
        }

        /* footer css */
        footer > div{
            margin-left: 210px;
            text-align: left;
            width: 930px;
            background-color: lightgray;
            border-radius: 0 0 10px 10px;
            font-size: 9px;
            font-family: "THEmpgtM";
            margin: 0 auto;
            margin-bottom: 15%;
        }
        footer > div > ul{
            margin-left: 20px;
            margin-top: 0px;
            padding: 30px;
            color: gray;
            line-height: 15px;
            list-style: none;
        }
        #go_to_top {
            width: 30px;
            height: 45px;
            position: fixed;
            bottom: 35px;
            right: 45px;
            cursor: pointer;
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
    </header>
    <section>
        <div id="noti_text">
            <p id="title">
                회원가입
            </p>
            <p id="subtext">
                반갑습니다. <br>똑똑하게 운동하자 머슬톡톡의 회원가입 페이지입니다.<br><br>
                머슬톡톡의 보다 다양한 기능 사용을 위해 회원가입을 진행해주세요.
            </p>
        </div>

        <div id="user_input">
            <form>
                <div id="first_line">
                    <p>아이디 *</p>
                    <input type="text" id="member_id" name="member_id" placeholder="아이디 입력" required>
                    <input type="button" id="member_id_check" name="member_id_check" value="중복 확인">
                    <input type="button" id="member_id_check2" name="member_id_check2" value="확인 완료">
                </div>
                <div id="second_line">
                    <p>비밀번호 *</p>
                    <input type="text" id="member_password" name="member_password" placeholder="비밀번호 입력" required><br>
                </div>
                <div id="third_line">
                    <p>비밀번호 확인 *</p>
                    <input type="text" id="member_password_check" name="member_password_check" placeholder="비밀번호 입력" required><br>
                </div>
                <div id="fourth_line">
                    <p>닉네임 *</p>
                    <input type="text" id="member_nickname" name="member_nickname" placeholder="닉네임 입력" required>
                    <input type="button" id="member_nickname_check" name="member_nickname_check" value="중복 확인">
                    <input type="button" id="member_nickname_check2" name="member_nickname_check2" value="확인 완료">
                </div>
                <div id="fifth_line">
                    <p>이메일 *</p>
                    <input type="text" id="member_email" name="member_email" placeholder="이메일 입력" required>
                    <input type="button" id="member_mail_check" name="member_mail_check" value="인증하기">
                    <input type="button" id="member_mail_check2" name="member_mail_check2" value="인증완료">
                </div>
                <div id="sixth_line">
                    <p>성명 *</p>
                    <input type="text" id="member_name" name="member_name" placeholder="성명 입력" required><br>
                </div>
                <div id="sixth_line">
                    <p>개인 핸드폰 번호 *</p>
                    <input type="text" id="member_phone" name="member_phone" placeholder="번호 입력" required><br>
                </div>
                <div id="seventh_line">
                    <p>성별 *</p>
                    <select name="member_gender" id="member_gender">
                        <option value="남자" selected> 남자</option>
                        <option value="여자"> 여자</option>
                    </select>
                </div>
                <br>
                <hr>
                <br>
                <div id="eighth_line">
                    <p>나이 *</p>
                    <input type="text" id="member_age" name="member_age" placeholder="나이: 숫자만 입력" required><br>
                </div>
                <div id="ninth_line">
                    <p>신장(cm) *</p>
                    <input type="text" id="member_height" name="member_height" placeholder="신장: 숫자만 입력" required><br>
                </div>
                <div id="tenth_line">
                    <p>몸무게(kg) *</p>
                    <input type="text" id="member_weight" name="member_weight" placeholder="몸무게: 숫자만 입력" required><br>
                </div>
                <div id="eleventh_line">
                    <p>운동목표 *</p>
                    <select name="member_purpose" id="member_purpose">
                        <option value="선택안함" selected> 선택안함</option>
                        <option value="감량"> 감량</option>
                        <option value="증량"> 증량</option>
                        <option value="체력관리"> 체력관리</option>
                        <option value="바디프로필"> 바디프로필</option>
                        <option value="기타"> 기타</option>
                    </select>
                </div>
                <div id="twelfth_line">
                    <p>관심사 *</p>
                    <select name="member_concern" id="member_concern">
                        <option value="선택안함" selected> 선택안함</option>
                        <option value="웨이트트레이닝"> 웨이트트레이닝</option>
                        <option value="필라테스"> 필라테스</option>
                        <option value="요가"> 요가</option>
                        <option value="기타"> 기타</option>
                    </select>
                </div>
                <br>
                <hr>
                <br>
                <div id="thirteenth_line">
                    <input type="checkbox" name="trainer_join" value="trainer_join" id="trainer_checkbox"> 
                    <label for="trainer_checkbox">
                        트레이너용 회원가입을 원하십니까?
                    </label>
                </div>
                <div id="fourteenth_line">
                    <p>인증 서류</p>
                    <input type="file" id="file_upload" value="파일" name="파일" accept="image/*"> 
                </div>
                <div id="fifteenth_line">
                    <p>헬스장명</p>
                    <input type="text" id="gym_name" name="gym_name" placeholder="소속된 헬스장명 입력"><br>
                </div>
                <div id="sixteen_line">
                    <p>헬스장명</p>
                    <input type="text" id="gym_location" name="gym_location" placeholder="소속된 헬스장 주소 입력"><br>
                </div>
                <br>
                <hr>
                <br>
                <div>
                    <input type="checkbox" name="agree" value="agree" id="agree_checkbox"> 
                    <label for="agree_checkbox">
                        서비스 이용약관 및 개인정보 취급 방침을 확인하였으며 이에 동의합니다.
                    </label>
                </div>
                <input type="submit" id="next_btn" name="next_btn" value="다음 >">
            </form>

            <div id="modal_all" class="modal">
                <div id="modal" class="modal">
                    <!-- 모달창내용작성 -->
                    <div class="modal_text" class="modal">
                        <p id="modal_title" class="modal">
                            이메일 인증
                        </p>
                        <p id="modal_subtext" class="modal">
                            이메일 인증을 위해,<br>
                            이메일로 발송된 인증번호를 입력해 주세요.
                        </p>
                        <input type="text" id="modal_email" name="modal_email" placeholder="이메일 입력" required class="modal"><br>
                        <hr id="modal_hr" class="modal">
                        <input type="button" id="modal_cancel" name="modal_cancel" value="취소" class="modal">
                        <input type="submit" id="modal_accept" name="modal_accept" value="확인" class="modal">
                    	<div id="hide_section"></div>
                    </div>
                </div>
            </div>                
        </div>
    </section>
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
        $("#mail_check").on("click", function(){
                $("#modal_all").show();
        });

        $("#modal_cancel").on("click", function(){
                $("#modal_all").hide();
        });


        $("#submit").submit(function(){
            var rt = true;

            if($("#mail_check").is(":visible")){
                alert("인증 완료해주세요.");
                return rt = false;
            }
	    })
    </script>
</body>
</html>