# MuscleTalkTalk

## 목차
[1. 개발환경](#개발환경)  
[2. 프로젝트 설계주안점](#프로젝트-설계주안점)  
[3. 구현 기능](#구현-기능)  
[4. 팀원 및 주 담당 기능](#팀원-및-주-담당-기능)  
[5. 프로젝트 화면](https://github.com/JaeMinPark0224/MuscleTalkTalk/blob/main/muscleTalkTalk_%EC%B5%9C%EC%A2%85%EB%B0%9C%ED%91%9C.pdf)  

## 개발환경
+ **Language**
    + JAVA11
    + Servlet/JSP
    + HTML5
    + CSS3
    + JavaScript
    + XML
+ **Web Apllication Server**
    + Apache Tomcat 9
+ **DaataBase**
    + Oracle 11g
+ **Framework & Open Api**
    + Ajax
    + jQuery
    + Servlet 4.0
    + jsp 3.1
    + ojdbc6
    + gson 2.8.6
    + jstl 1.2
    + cos 20.08
    + FullCalendar
    + Cloudinary
    + SMTP
    + CKEditor
+ **DB Tool**
    + sqldeveloper
+ **IDE**
    + Eclipse IDE for Enterprise Java Developers
+ **Compare Tool**
    + Beyond Compare
+ **Prototyping Tool**
    + OvenApp
+ **ER Diagram Tool**
    + ERD Cloud
+ **Code Editor**
    + VSCode
+ **Configuration Management Tool**
    + Git
    + GitHub Desktop
## 프로젝트 설계주안점
+ 운동 계획과 운동 결과를 캘린더로 제공
+ 다른 사용자가 올린 루틴을 가져오거나 또는 내 루틴을 공유
+ 구체적인 운동을 원하는 사용자를 위해 트레이너 연결 시스템을 제공
+ 운동을 보다 쉽고 간편하게 할 수 있도록 도와주는 웹 사이트

## 구현 기능
+ **회원가입 및 로그인**
    + 회원가입
    + 회원탈퇴
    + 로그인
    + 아이디 저장
+ **마이페이지**
    + 회원 마이페이지
    + 트레이너 마이페이지
    + 관리자 마이페이지
+ **루틴**
    + 루틴 생성
    + 루틴 조회
    + 루틴 공유
+ **게시판**
    + 자유 게시판
    + 루틴 게시판
    + 공지사항 게시판
+ **스케줄**
    + 루틴 스케줄 조회
    + PT 스케줄 조회
+ **PT프로그램**
    + PT 프로그램 생성
    + PT 프로그램 조회
    + PT 프로그램 예약
## 팀원 및 주 담당 기능
+ **박재민**
    + 메인 페이지
    + PT 프로그램
        + 트레이너: PT 프로그램 등록, 조회, 수정, 삭제
        + 트레이너: 블랙리스트 조회, 추가, 삭제
        + 트레이너: 프로그램 회원 조회
        + 검색을 통한 프로그램 조회
        + 필터를 통한 프로그램 조회
        + PT 프로그램 예약
        + PT 프로그램 리뷰 등록, 조회, 수정, 삭제
+ **서유빈**
    + header, aside, footer 제작
    + 회원가입
        + 아이디, 닉네임 중복 검사 / 이메일 인증
        + 트레이너 전용 회원가입 페이지 제작
        + 기타 유효성 체크
    + 로그인 / 로그아웃
    + 마이페이지
        + 정보 조회, 수정
        + 비밀번호 변경
        + 게시물, 댓글 조회
        + 예약 프로그램 조회
        + 트레이너용 계정으로 전환
        + 1:1 문의
        + 회원탈퇴
+ **이진정**
    + 로고 제작
    + 관리자 페이지
        + 대시보드: 회원 / 게시물 / 댓글 수 조회
        + 게시물, 댓글 조회
        + 게시물, 댓글 신고 조회
        + 회원, 트레이너 조회
        + 문의 조회, 답변 작성
    + 캘린더
        + 운동 계획 조회
        + PT 프로그램 예약 정보 조회
+ **민승택**
    + 게시판
        + 자유 / 루틴 게시판 조회, 작성, 수정, 삭제
        + 댓글 조회, 작성, 삭제, 신고
        + 검색을 통한 게시물 조회
        + 필터를 통한 게시물 조회
    + 루틴
        + 주간 / 일간 루틴 조회, 생성, 수정, 삭제
        + 루틴 공유
